package priori.ui.style;

import priori.event.PriEventDispatcher;
import priori.ui.event.PriUIEvent;

class PriUIStyle extends PriEventDispatcher {
    
    @:isVar public var primary(default, set):PriUIColorSwatch = new PriUIColorSwatch(0x2D384D, 5);
    @:isVar public var primaryAlt(default, set):PriUIColorSwatch = new PriUIColorSwatch(0x635D67, -40);
    @:isVar public var secondary(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xFFC400, 0);
    @:isVar public var secondaryAlt(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xE1BC2A, 5);

    @:isVar public var subtle(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xF3F4F5, 5);
    @:isVar public var highlight(default, set):PriUIColorSwatch = new PriUIColorSwatch(0x7520b5, 5);

    @:isVar public var container(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xFFFFFF, 10);
    @:isVar public var board(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xF3F4F5, 10);
    @:isVar public var overlay(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xFFFFFF, 10);
    @:isVar public var element(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xF5F5F5, 10);

    @:isVar public var danger(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xB00020, 10);
    @:isVar public var caution(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xFFC400, 10);
    @:isVar public var success(default, set):PriUIColorSwatch = new PriUIColorSwatch(0x648348, 10);
    @:isVar public var information(default, set):PriUIColorSwatch = new PriUIColorSwatch(0x354fb7, 5);

    @:isVar public var onPrimary(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xFFFFFF);
    @:isVar public var onSecondary(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xFFFFFF);
    @:isVar public var onContainer(default, set):PriUIColorSwatch = new PriUIColorSwatch(0x000000);
    @:isVar public var onBoard(default, set):PriUIColorSwatch = new PriUIColorSwatch(0x000000);
    @:isVar public var onOverlay(default, set):PriUIColorSwatch = new PriUIColorSwatch(0x000000);
    @:isVar public var onElement(default, set):PriUIColorSwatch = new PriUIColorSwatch(0x000000);
    @:isVar public var onSubtle(default, set):PriUIColorSwatch = new PriUIColorSwatch(0x000000);
    @:isVar public var onHighlight(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xFFFFFF);
    @:isVar public var onDanger(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xFFFFFF);
    @:isVar public var onCaution(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xFFFFFF);
    @:isVar public var onSuccess(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xFFFFFF);
    @:isVar public var onInformation(default, set):PriUIColorSwatch = new PriUIColorSwatch(0xFFFFFF);
    
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
        
        result.subtle = this.subtle.clone();
        result.highlight = this.highlight.clone();

        result.container = this.container.clone();
        result.board = this.board.clone();
        result.overlay = this.overlay.clone();
        result.element = this.element.clone();
        
        result.danger = this.danger.clone();
        result.caution = this.caution.clone();
        result.success = this.success.clone();
        result.information = this.information.clone();

        result.onPrimary = this.onPrimary.clone();
        result.onSecondary = this.onSecondary.clone();
        result.onContainer = this.onContainer.clone();
        result.onBoard = this.onBoard.clone();
        result.onOverlay = this.onOverlay.clone();
        result.onElement = this.onElement.clone();
        result.onSubtle = this.onSubtle.clone();
        result.onHighlight = this.onHighlight.clone();
        result.onDanger = this.onDanger.clone();
        result.onCaution = this.onCaution.clone();
        result.onSuccess = this.onSuccess.clone();
        result.onInformation = this.onInformation.clone();

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

    private function set_subtle(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.subtle = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }
        
        return value;
    }

    private function set_highlight(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.subtle = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }
        
        return value;
    }

    private function set_board(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.board = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }
        
        return value;
    }

    private function set_container(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.container = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }

    private function set_overlay(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.overlay = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }
        
        return value;
    }

    private function set_element(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.element = value;
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
    
    private function set_onBoard(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onBoard = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }
        
        return value;
    }

    private function set_onContainer(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onContainer = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }

    private function set_onOverlay(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onOverlay = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }
        
        return value;
    }

    private function set_onElement(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onElement = value;
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

    private function set_danger(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.danger = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }
    
    private function set_onDanger(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onDanger = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }

    private function set_caution(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.caution = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }
    
    private function set_onCaution(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onCaution = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }
    

    private function set_success(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.success = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }
    
    private function set_onSuccess(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onSuccess = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }

    private function set_information(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.information = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }
    
    private function set_onInformation(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onInformation = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }

    private function set_onSubtle(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onSubtle = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }

    private function set_onHighlight(value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        else {
            this.onHighlight = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }
    


}