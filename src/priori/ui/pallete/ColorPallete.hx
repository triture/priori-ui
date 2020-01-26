package priori.ui.pallete;

import priori.event.PriEventDispatcher;
import priori.ui.event.PriUIEvent;

class ColorPallete extends PriEventDispatcher {
    
    @:isVar public var primary(default, set):ColorSwatch = new ColorSwatch(0x2D384D);
    @:isVar public var primaryAlt(default, set):ColorSwatch = new ColorSwatch(0x635D67);
    @:isVar public var secondary(default, set):ColorSwatch = new ColorSwatch(0xE9B56A);
    @:isVar public var secondaryAlt(default, set):ColorSwatch = new ColorSwatch(0xB1A9A2);
    
    @:isVar public var background(default, set):ColorSwatch = new ColorSwatch(0xF4F1E8);

    public function new() {
        super();
    }

    private function set_background(value:ColorSwatch):ColorSwatch {
        if (value == null) return value;
        else {
            this.background = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_PALLETE_EVENT));
        }

        return value;
    }

    private function set_primary(value:ColorSwatch):ColorSwatch {
        if (value == null) return value;
        else {
            this.primary = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_PALLETE_EVENT));
        }
        
        return value;
    }

    private function set_primaryAlt(value:ColorSwatch):ColorSwatch {
        if (value == null) return value;
        else {
            this.primaryAlt = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_PALLETE_EVENT));
        }
        
        return value;
    }

    private function set_secondary(value:ColorSwatch):ColorSwatch {
        if (value == null) return value;
        else {
            this.secondary = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_PALLETE_EVENT));
        }
        
        return value;
    }

    private function set_secondaryAlt(value:ColorSwatch):ColorSwatch {
        if (value == null) return value;
        else {
            this.secondaryAlt = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_PALLETE_EVENT));
        }
        
        return value;
    }


}