package priori.ui.style;

import priori.event.PriEventDispatcher;
import priori.ui.event.PriUIEvent;

class PriUIStyle extends PriEventDispatcher {
    
    @:isVar public var primary(default, set):PriUIColorSwatch = new PriUIColorSwatch(0x2D384D);
    @:isVar public var primaryAlt(default, set):PriUIColorSwatch = new PriUIColorSwatch(0x635D67);
    @:isVar public var secondary(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xE9B56A);
    @:isVar public var secondaryAlt(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xB1A9A2);
    @:isVar public var surface(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xF4F1E8);
    @:isVar public var background(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xF4F1E8);
    @:isVar public var error(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xB00020);

    @:isVar public var onPrimary(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xFFFFFF);
    @:isVar public var onSecondary(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xFFFFFF);
    @:isVar public var onSurface(default, set):PriUIColorSwatch = new PriUIColorSwatch(0x000000);
    @:isVar public var onBackground(default, set):PriUIColorSwatch = new PriUIColorSwatch(0x000000);
    @:isVar public var onError(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xFFFFFF);

    @:isVar public var fontFamily(default, set):String = "'Open Sans', sans-serif";

    public function new() {
        super();
    }

    public function clone():PriUIStyle {
        var result:PriUIStyle = new PriUIStyle();

        result.primary = this.primary.clone();
        result.primaryAlt = this.primaryAlt.clone();
        result.secondary = this.secondary.clone();
        result.secondaryAlt = this.secondaryAlt.clone();
        result.background = this.background.clone();

        result.fontFamily = this.fontFamily;

        return result;
    }

    private function set_fontFamily(value:String):String {
        if (value == null) return value;
        else {
            this.fontFamily = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }

    private function set_surface(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.surface = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }
        
        return value;
    }

    private function set_background(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.background = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }

    private function set_error(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.error = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }

    private function set_primary(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.primary = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }
        
        return value;
    }

    private function set_primaryAlt(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.primaryAlt = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }
        
        return value;
    }

    private function set_secondary(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.secondary = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }
        
        return value;
    }

    private function set_secondaryAlt(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.secondaryAlt = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }
        
        return value;
    }
    
    private function set_onSurface(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onSurface = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }
        
        return value;
    }

    private function set_onBackground(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onBackground = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }

    private function set_onError(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onError = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }

    private function set_onPrimary(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onPrimary = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }
        
        return value;
    }

    private function set_onSecondary(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onSecondary = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }
        
        return value;
    }


}