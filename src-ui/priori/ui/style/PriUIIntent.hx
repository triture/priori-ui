package priori.ui.style;

enum abstract PriUIIntent(String) {
    
    var HEADER = "HEADER";
    var SUBTITLE = "SUBTITLE";
    var BODY = "BODY";
    var BUTTON = "BUTTON";
    var CAPTION = "CAPTION";
    var OVERLINE = "OVERLINE";

    @:from
    static public function fromString(s:String):PriUIIntent {
        if (s == null) return null;
        else if ([
            'HEADER',
            'SUBTITLE',
            'BODY',
            'BUTTON',
            'CAPTION',
            'OVERLINE'
        ].indexOf(s.toUpperCase()) == -1) return PriUIIntent.BODY;
        else return cast s.toUpperCase();
    }

    public function getFont(style:PriUIStyle, size:PriUISize):PriUIFont {
        if (style == null) return null;
        
        var v:PriUIIntent = cast this;

        switch (v) {
            case PriUIIntent.HEADER : return size == PriUISize.BIGGER ? style.fontHeaderBigger : style.fontHeaderSmaller;
            case PriUIIntent.SUBTITLE : return size == PriUISize.BIGGER ? style.fontSubtitleBigger : style.fontSubtitleSmaller;
            case PriUIIntent.BODY : return size == PriUISize.BIGGER ? style.fontBodyBigger : style.fontBodySmaller;
            case PriUIIntent.BUTTON : return style.fontButton;
            case PriUIIntent.CAPTION : return style.fontCaption;
            case PriUIIntent.OVERLINE : return style.fontOverline;
        }
    }
}