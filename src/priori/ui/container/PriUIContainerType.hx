package priori.ui.container;

import priori.ui.style.PriUIColorSwatch;
import priori.ui.style.PriUIStyle;

@:enum 
abstract PriUIContainerType(String) {
    var NONE = 'NONE';
    var PRIMARY = 'PRIMARY';
    var PRIMARY_ALTERNATIVE = 'PRIMARY_ALT';
    var SECONDARY = 'SECONDARY';
    var SECONDARY_ALTERNATIVE = 'SECONDARY_ALT';
    var SURFACE = 'SURFACE';
    var BACKGROUND = 'BACKGROUND';
    var ERROR = 'ERROR';
    
    public function getBackgroundSwatch(style:PriUIStyle):PriUIColorSwatch {
        if (style == null) return null;
        
        var v:PriUIContainerType = cast this;

        return switch (v) {
            case PriUIContainerType.NONE : null;
            case PriUIContainerType.PRIMARY : style.primary;
            case PriUIContainerType.PRIMARY_ALTERNATIVE : style.primaryAlt;
            case PriUIContainerType.SECONDARY : style.secondary;
            case PriUIContainerType.SECONDARY_ALTERNATIVE : style.secondaryAlt;
            case PriUIContainerType.SURFACE : style.surface;
            case PriUIContainerType.BACKGROUND : style.background;
            case PriUIContainerType.ERROR : style.error;
        }
    }

    public function getForegroundSwatch(style:PriUIStyle):PriUIColorSwatch {
        if (style == null) new PriUIColorSwatch(0x000000);
        
        var v:PriUIContainerType = cast this;

        return switch (v) {
            case PriUIContainerType.NONE : new PriUIColorSwatch(0x000000);
            case PriUIContainerType.PRIMARY | PriUIContainerType.PRIMARY_ALTERNATIVE : style.onPrimary;
            case PriUIContainerType.SECONDARY | PriUIContainerType.SECONDARY_ALTERNATIVE : style.onSecondary;
            case PriUIContainerType.SURFACE : style.onSurface;
            case PriUIContainerType.BACKGROUND : style.onBackground;
            case PriUIContainerType.ERROR : style.onError;
        }
    }
}