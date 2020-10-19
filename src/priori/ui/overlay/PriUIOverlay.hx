package priori.ui.overlay;

import priori.ui.event.PriUIEvent;
import priori.view.PriDisplay;
import priori.ui.style.PriUIDisplayType;
import priori.ui.container.PriUIContainer;

class PriUIOverlay extends PriUIContainer {

    @:isVar public var allowCloseOverlay(get, set):Bool = true;
    @:isVar public var allowCloseOverlayWithEsc(get, set):Bool = true;

    
    public function new() {
        super();

        this.styleDisplayType = PriUIDisplayType.OVERLAY;
        this.z = 8;
        this.corners = [5];

    }

    public function open():Void PriUIOverlayManager.singleton().add(this);
    public function close():Void PriUIOverlayManager.singleton().remove(this);

    private function get_allowCloseOverlay():Bool return this.allowCloseOverlay;
    private function set_allowCloseOverlay(value:Bool):Bool return this.allowCloseOverlay = value;
    
    private function get_allowCloseOverlayWithEsc():Bool return this.allowCloseOverlayWithEsc;
    private function set_allowCloseOverlayWithEsc(value:Bool):Bool return this.allowCloseOverlayWithEsc = value;
    
    public function onCloseOverlay():Void {}
    public function onOpenOverlay():Void {}

    static public function dispatchCloseOverlayHelper(dispatcher:PriDisplay):Void {
        dispatcher.dispatchEvent(new PriUIEvent(PriUIEvent.CLOSE_OVERLAY, false, true));
    }
}