package priori.ui.container;

import priori.ui.event.PriUIEvent;

class PriUIFlex extends PriUIContainer {
    
    @:isVar public var weight(default, set):Float = 1;

    private function set_weight(value:Float):Float {
        if (value == null || value <= 0 || value == this.weight) return value;
        this.weight = value;
        if (this.parent != null) this.parent.dispatchEvent(new PriUIEvent(PriUIEvent.UPDATE_DISPLAY));
        return value;
    }
}