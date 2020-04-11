package priori.ui.overlay;

import priori.scene.PriSceneManager;
import priori.types.PriTransitionType;
import priori.system.PriKey;
import priori.event.PriKeyboardEvent;
import priori.event.PriTapEvent;
import priori.app.PriApp;
import priori.ui.container.PriUISpace;
import priori.ui.event.PriUIEvent;
import priori.ui.style.PriUIDisplayType;
import priori.ui.style.PriUIShade;
import priori.ui.container.PriUIContainer;

class PriUIOverlayManager {
    
    private static var _singleton:PriUIOverlayManager;

    public static function use():PriUIOverlayManager {
        if (_singleton == null) _singleton = new PriUIOverlayManager();
        return _singleton;
    }

    inline public static function singleton():PriUIOverlayManager return use();

    private var overlays:Array<PriUIOverlayElement> = [];
    private var overlayContainer:PriUISpace;

    private function new() {
        this.overlayContainer = new PriUISpace();
        this.overlayContainer.left = 0;
        this.overlayContainer.top = 0;
        this.overlayContainer.right = 0;
        this.overlayContainer.bottom = 0;
    }

    public function getContainer():PriUISpace {
        return this.overlayContainer;
    }

    public function closeTopMostOverlay():Void {
        if (this.overlays.length > 0) {
            this.remove(this.overlays[this.overlays.length - 1].overlay);
        }
    }

    public function closeAllOverlays():Void {
        var currentOverlays:Array<PriUIOverlayElement> = this.overlays.copy();
        for (item in currentOverlays) {
            this.remove(item.overlay);
        }
    }

    public function tryToCloseParentOverlay(element:PriUIContainer):Void {
        if (element == null) return;
        element.dispatchEvent(new PriUIEvent(PriUIEvent.CLOSE_OVERLAY, false, true));
    }

    public function add(overlay:PriUIOverlay):Void {
        if (overlay == null) return;
        
        overlay.removeEventListener(PriUIEvent.CLOSE_OVERLAY, this.onCloseOverlay);
        overlay.addEventListener(PriUIEvent.CLOSE_OVERLAY, this.onCloseOverlay);

        var currentIndex:Int = -1;
        for (i in 0 ... this.overlays.length) if (this.overlays[i].overlay == overlay) currentIndex = i;

        var item:PriUIOverlayElement = currentIndex >= 0
            ? this.overlays[currentIndex]
            : {
                overlay : overlay,
                background : new PriUIContainer()
        };

        if (currentIndex >= 0) this.overlays.remove(item);
        this.overlays.push(item);

        item.background.removeEventListener(PriTapEvent.TAP, this.onTapBackground);
        item.background.addEventListener(PriTapEvent.TAP, this.onTapBackground);
        item.background.pointer = false;
        item.background.styleDisplayType = PriUIDisplayType.PRIMARY;
        item.background.styleShade = PriUIShade.DARKER;
        item.background.alpha = 0.0;
        item.background.left = 0;
        item.background.right = 0;
        item.background.top = 0;
        item.background.bottom = 0;
        item.background.allowTransition(PriTransitionType.ALPHA, 0.2);
        item.background.z = 8;

        item.overlay.alpha = 0;
        item.overlay.allowTransition(PriTransitionType.ALPHA, 0.3);

        for (o in this.overlays) {
            if (o.overlay == item.overlay) item.overlay.disabled = false;
            else o.overlay.disabled = true;
        }

        PriSceneManager.use().holder.disabled = true;

        haxe.Timer.delay(function():Void {
            item.background.alpha = 0.3;
            item.overlay.alpha = 1;
        }, 5);

        this.overlayContainer.addChildList(
            [
                item.background,
                item.overlay
            ]
        );


        this.updateContainer();
    }

    public function remove(overlay:PriUIOverlay):Void {
        if (overlay == null) return;

        overlay.removeEventListener(PriUIEvent.CLOSE_OVERLAY, this.onCloseOverlay);

        var currentIndex:Int = -1;
        for (i in 0 ... this.overlays.length) if (this.overlays[i].overlay == overlay) currentIndex = i;

        if (currentIndex > -1) {
            var item:PriUIOverlayElement = this.overlays[currentIndex];

            item.background.removeEventListener(PriTapEvent.TAP, this.onTapBackground);

            this.overlayContainer.removeChildList(
                [
                    item.overlay,
                    item.background
                ]
            );

            this.overlays.remove(item);

            if (this.overlays.length == 0) PriSceneManager.use().holder.disabled = false;
            else this.overlays[this.overlays.length-1].overlay.disabled = false;

            item.overlay.onCloseOverlay();
            item.background.kill();

            this.updateContainer();
        }
    }

    private function updateContainer():Void {
        if (this.overlayContainer.numChildren == 0) this.overlayContainer.visible = false;
        else {

            PriApp.g().removeEventListener(PriKeyboardEvent.KEY_UP, this.onKeyUp);
            PriApp.g().addEventListener(PriKeyboardEvent.KEY_UP, this.onKeyUp);

            this.overlayContainer.visible = true;
        }
    }

    private function onKeyUp(e:PriKeyboardEvent):Void {
        if (e.keycode == PriKey.ESC) {
            if (
                this.overlays.length > 0 &&
                this.overlays[this.overlays.length - 1].overlay.allowCloseOverlay &&
                this.overlays[this.overlays.length - 1].overlay.allowCloseOverlayWithEsc
            ) {
                this.remove(this.overlays[this.overlays.length - 1].overlay);
            } 
        }
    }

    private function onTapBackground(e:PriTapEvent):Void {
        var currentIndex:Int = -1;
        for (i in 0 ... this.overlays.length) {
            if (
                this.overlays[i].background == e.currentTarget &&
                this.overlays[i].overlay.allowCloseOverlay
            ) currentIndex = i;
        }
        if (currentIndex > -1) this.remove(this.overlays[currentIndex].overlay);
    }

    private function onCloseOverlay(e:PriUIEvent):Void {
        if (Std.is(e.target, PriUIOverlay)) {
            var o:PriUIOverlay = cast e.target;
            this.remove(o);
        }
    }
}

private typedef PriUIOverlayElement = {
    var background:PriUIContainer;
    var overlay:PriUIOverlay;
}