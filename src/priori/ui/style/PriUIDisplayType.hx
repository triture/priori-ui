package priori.ui.style;

import priori.ui.style.PriUIColorSwatch;

@:enum 
abstract PriUIDisplayType(String) {

    var NONE = 'NONE';
    var INHERIT = 'INHERIT';

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

    @:from
    static public function fromString(s:String):PriUIDisplayType {
        if (s == null) return null;
        else if ([
            'NONE',
            'INHERIT',
            'PRIMARY',
            'PRIMARY_ALTERNATIVE',
            'SECONDARY',
            'SECONDARY_ALTERNATIVE',
            'CONTAINER',
            'BOARD',
            'OVERLAY',
            'ELEMENT',
            'DANGER',
            'CAUTION',
            'SUCCESS',
            'INFORMATION',
            'SUBTLE',
            'HIGHLIGHT'
        ].indexOf(s.toUpperCase()) == -1) return PriUIDisplayType.PRIMARY;
        else return cast s.toUpperCase();
    }
    
    public function getBackgroundSwatch(style:PriUIStyle):PriUIColorSwatch {
        if (style == null) return new PriUIColorSwatch(null);
        
        var v:PriUIDisplayType = cast this;

        return switch (v) {
            case PriUIDisplayType.NONE | PriUIDisplayType.INHERIT : new PriUIColorSwatch(null);
            
            case PriUIDisplayType.PRIMARY : style.primary;
            case PriUIDisplayType.PRIMARY_ALTERNATIVE : style.primaryAlt;
            case PriUIDisplayType.SECONDARY : style.secondary;
            case PriUIDisplayType.SECONDARY_ALTERNATIVE : style.secondaryAlt;
            
            case PriUIDisplayType.CONTAINER : style.container;
            case PriUIDisplayType.BOARD : style.board;
            case PriUIDisplayType.OVERLAY : style.overlay;
            case PriUIDisplayType.ELEMENT : style.element;
            
            case PriUIDisplayType.DANGER : style.danger;
            case PriUIDisplayType.CAUTION : style.caution;
            case PriUIDisplayType.SUCCESS : style.success;
            case PriUIDisplayType.INFORMATION : style.information;

            case PriUIDisplayType.SUBTLE : style.subtle;
            case PriUIDisplayType.HIGHLIGHT : style.highlight;
        }
    }

    public function getForegroundSwatch(style:PriUIStyle):PriUIColorSwatch {
        if (style == null) new PriUIColorSwatch(0x000000);
        
        var v:PriUIDisplayType = cast this;

        return switch (v) {
            case PriUIDisplayType.NONE | PriUIDisplayType.INHERIT : new PriUIColorSwatch(0x000000);

            case PriUIDisplayType.PRIMARY | PriUIDisplayType.PRIMARY_ALTERNATIVE : style.onPrimary;
            case PriUIDisplayType.SECONDARY | PriUIDisplayType.SECONDARY_ALTERNATIVE : style.onSecondary;
            
            case PriUIDisplayType.CONTAINER : style.onContainer;
            case PriUIDisplayType.BOARD : style.onBoard;
            case PriUIDisplayType.OVERLAY : style.onOverlay;
            case PriUIDisplayType.ELEMENT : style.onElement;

            case PriUIDisplayType.DANGER : style.onDanger;
            case PriUIDisplayType.CAUTION : style.onCaution;
            case PriUIDisplayType.SUCCESS : style.onSuccess;
            case PriUIDisplayType.INFORMATION : style.onInformation;

            case PriUIDisplayType.SUBTLE : style.onSubtle;
            case PriUIDisplayType.HIGHLIGHT : style.onHighlight;
        }
    }
}