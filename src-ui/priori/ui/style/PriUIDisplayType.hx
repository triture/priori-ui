package priori.ui.style;

enum abstract PriUIDisplayType(String) {

    var NONE = 'NONE';
    var INHERIT = 'INHERIT';

    var PRIMARY = 'PRIMARY';

//    var PRIMARY_ALTERNATIVE = 'PRIMARY_ALT';
//    var SECONDARY = 'SECONDARY';
//    var SECONDARY_ALTERNATIVE = 'SECONDARY_ALT';
//
//    // backgrounds
//    var CONTAINER = 'CONTAINER';
//    var BOARD = 'BOARD';
//    var OVERLAY = 'OVERLAY';
//    var ELEMENT = 'ELEMENT';
//
//    // moods
    var DANGER = 'DANGER';
//    var CAUTION = 'CAUTION';
    var SUCCESS = 'SUCCESS';
    var INFORMATION = 'INFORMATION';
//
//    // details
//    var SUBTLE = 'SUBTLE';
//    var HIGHLIGHT = 'HIGHLIGHT';

    @:from
    static public function fromString(s:String):PriUIDisplayType {
        if (s == null) return null;
        else if ([
            'NONE',
            'INHERIT',
            'PRIMARY',
//            'PRIMARY_ALTERNATIVE',
//            'SECONDARY',
//            'SECONDARY_ALTERNATIVE',
//            'CONTAINER',
//            'BOARD',
//            'OVERLAY',
//            'ELEMENT',
            'DANGER',
//            'CAUTION',
            'SUCCESS',
            'INFORMATION'
//            'SUBTLE',
//            'HIGHLIGHT'
        ].indexOf(s.toUpperCase()) == -1) return PriUIDisplayType.PRIMARY;
        else return cast s.toUpperCase();
    }
    
    public function getColorKit(style:PriUIStyle):PriUiColorKit {
        if (style == null) return null;
        
        var v:PriUIDisplayType = cast this;

        return switch (v) {
            case PriUIDisplayType.NONE | PriUIDisplayType.INHERIT : new PriUiColorKit(0x000000, 0xFFFFFF, 0x000000);
            
            case PriUIDisplayType.PRIMARY : style.primary;
            case PriUIDisplayType.DANGER : style.danger;
            case PriUIDisplayType.SUCCESS : style.success;
            case PriUIDisplayType.INFORMATION : style.information;
        }
    }

}