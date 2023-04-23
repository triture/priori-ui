package priori.ui.style;

@:enum
abstract PriUIDensity(String) {
    var DEFAULT = "DEFAULT";
    var COMPACT = "COMPACT";

    @:from
    static public function fromString(s:String):PriUIDensity {
        if (s == null) return null;
        else if ([
            'DEFAULT',
            'COMPACT'
        ].indexOf(s.toUpperCase()) == -1) return PriUIDensity.DEFAULT;
        else return cast s.toUpperCase();
    }
}