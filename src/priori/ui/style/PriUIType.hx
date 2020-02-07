package priori.ui.style;

import priori.ui.style.PriUIColorSwatch;
import priori.ui.style.PriUIStyle;

@:enum 
abstract PriUIType(String) {

    var NONE = 'NONE';
    var PRIMARY = 'PRIMARY';
    var PRIMARY_ALTERNATIVE = 'PRIMARY_ALT';
    var SECONDARY = 'SECONDARY';
    var SECONDARY_ALTERNATIVE = 'SECONDARY_ALT';

    // backgrounds
    var CONTAINER = 'CONTAINER';
    var BOARD = 'BOARD';
    var OVERLAY = 'OVERLAY';
    var ELEMENT = 'ELEMENT';
    
    // moods
    var DANGER = 'DANGER';
    var CAUTION = 'CAUTION';
    var SUCCESS = 'SUCCESS';
    var INFORMATION = 'INFORMATION';

    // details
    var SUBTLE = 'SUBTLE';
    var HIGHLIGHT = 'HIGHLIGHT';
    
    public function getBackgroundSwatch(style:PriUIStyle):PriUIColorSwatch {
        if (style == null) return null;
        
        var v:PriUIType = cast this;

        return switch (v) {
            case PriUIType.NONE : null;
            case PriUIType.PRIMARY : style.primary;
            case PriUIType.PRIMARY_ALTERNATIVE : style.primaryAlt;
            case PriUIType.SECONDARY : style.secondary;
            case PriUIType.SECONDARY_ALTERNATIVE : style.secondaryAlt;
            
            case PriUIType.CONTAINER : style.container;
            case PriUIType.BOARD : style.board;
            case PriUIType.OVERLAY : style.overlay;
            case PriUIType.ELEMENT : style.element;
            
            case PriUIType.DANGER : style.danger;
            case PriUIType.CAUTION : style.caution;
            case PriUIType.SUCCESS : style.success;
            case PriUIType.INFORMATION : style.information;

            case PriUIType.SUBTLE : style.subtle;
            case PriUIType.HIGHLIGHT : style.highlight;
        }
    }

    public function getForegroundSwatch(style:PriUIStyle):PriUIColorSwatch {
        if (style == null) new PriUIColorSwatch(0x000000);
        
        var v:PriUIType = cast this;

        return switch (v) {
            case PriUIType.NONE : new PriUIColorSwatch(0x000000);
            case PriUIType.PRIMARY | PriUIType.PRIMARY_ALTERNATIVE : style.onPrimary;
            case PriUIType.SECONDARY | PriUIType.SECONDARY_ALTERNATIVE : style.onSecondary;
            
            case PriUIType.CONTAINER : style.onContainer;
            case PriUIType.BOARD : style.onBoard;
            case PriUIType.OVERLAY : style.onOverlay;
            case PriUIType.ELEMENT : style.onElement;

            case PriUIType.DANGER : style.onDanger;
            case PriUIType.CAUTION : style.onCaution;
            case PriUIType.SUCCESS : style.onSuccess;
            case PriUIType.INFORMATION : style.onInformation;

            case PriUIType.SUBTLE : style.onSubtle;
            case PriUIType.HIGHLIGHT : style.onHighlight;
        }
    }
}