package priori.ui.overlay;

import priori.ui.style.PriUIShade;
import priori.ui.style.PriUIContainerType;
import priori.ui.container.PriUIContainer;
import priori.view.PriDisplay;

class PriUIOverlayManager {
    
    private static var _singleton:PriUIOverlayManager;

    public static function use():PriUIOverlayManager {
        if (_singleton == null) _singleton = new PriUIOverlayManager();
        return _singleton;
    }

    inline public static function singleton():PriUIOverlayManager return use();

    private var overlays:Array<PriUIOverlayElement> = [];

    private function new() {
        
    }

    public function add(overlay:PriUIOverlay) {
        var currentIndex:Int = -1;

        for (i in 0 ... this.overlays.length) if (this.overlays[i].overlay == overlay) currentIndex = i;

        var item:PriUIOverlayElement = currentIndex >= 0
            ? this.overlays[currentIndex]
            : {
                overlay: overlay,
                background: new PriUIContainer()
        };

        if (currentIndex >= 0) this.overlays.remove(item);
        this.overlays.push(item);

        item.background.styleContainerType = PriUIContainerType.PRIMARY;
        item.background.styleShade = PriUIShade.DARKER;
        item.background.alpha = 0.6;
    }
}

private typedef PriUIOverlayElement = {
    var background:PriUIContainer;
    var overlay:PriUIOverlay;
}