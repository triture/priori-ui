package priori.ui.style;

@:enum abstract PriUIEmphasis(String) {
    
    var HIGH = "HIGH";
    var MEDIUM = "MEDIUM";
    var LOW = "LOW";

    @:from
    static public function fromString(s:String):PriUIEmphasis {
        if (s == null) return null;
        else if ([
            'HIGH',
            'MEDIUM',
            'LOW'
        ].indexOf(s.toUpperCase()) == -1) return PriUIEmphasis.HIGH;
        else return cast s.toUpperCase();
    }

}