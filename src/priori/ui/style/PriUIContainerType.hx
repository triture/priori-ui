package priori.ui.style;

import priori.ui.style.PriUIColorSwatch;

@:enum 
abstract PriUIContainerType(String) {

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
        
        var v:PriUIContainerType = cast this;

        return switch (v) {
            case PriUIContainerType.NONE : null;
            case PriUIContainerType.PRIMARY : style.primary;
            case PriUIContainerType.PRIMARY_ALTERNATIVE : style.primaryAlt;
            case PriUIContainerType.SECONDARY : style.secondary;
            case PriUIContainerType.SECONDARY_ALTERNATIVE : style.secondaryAlt;
            
            case PriUIContainerType.CONTAINER : style.container;
            case PriUIContainerType.BOARD : style.board;
            case PriUIContainerType.OVERLAY : style.overlay;
            case PriUIContainerType.ELEMENT : style.element;
            
            case PriUIContainerType.DANGER : style.danger;
            case PriUIContainerType.CAUTION : style.caution;
            case PriUIContainerType.SUCCESS : style.success;
            case PriUIContainerType.INFORMATION : style.information;

            case PriUIContainerType.SUBTLE : style.subtle;
            case PriUIContainerType.HIGHLIGHT : style.highlight;
        }
    }

    public function getForegroundSwatch(style:PriUIStyle):PriUIColorSwatch {
        if (style == null) new PriUIColorSwatch(0x000000);
        
        var v:PriUIContainerType = cast this;

        return switch (v) {
            case PriUIContainerType.NONE : new PriUIColorSwatch(0x000000);
            case PriUIContainerType.PRIMARY | PriUIContainerType.PRIMARY_ALTERNATIVE : style.onPrimary;
            case PriUIContainerType.SECONDARY | PriUIContainerType.SECONDARY_ALTERNATIVE : style.onSecondary;
            
            case PriUIContainerType.CONTAINER : style.onContainer;
            case PriUIContainerType.BOARD : style.onBoard;
            case PriUIContainerType.OVERLAY : style.onOverlay;
            case PriUIContainerType.ELEMENT : style.onElement;

            case PriUIContainerType.DANGER : style.onDanger;
            case PriUIContainerType.CAUTION : style.onCaution;
            case PriUIContainerType.SUCCESS : style.onSuccess;
            case PriUIContainerType.INFORMATION : style.onInformation;

            case PriUIContainerType.SUBTLE : style.onSubtle;
            case PriUIContainerType.HIGHLIGHT : style.onHighlight;
        }
    }
}