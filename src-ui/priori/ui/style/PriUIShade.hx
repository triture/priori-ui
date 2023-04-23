package priori.ui.style;

@:enum
abstract PriUIShade(String) {
    var BRIGHTER = 'BRIGHTER';
    var DEFAULT = 'DEFAULT';
    var DARKER = 'DARKER';

    @:from
    static public function fromString(s:String):PriUIShade {
        if (s == null) return null;
        else if ([
            'BRIGHTER',
            'DEFAULT',
            'DARKER'
        ].indexOf(s.toUpperCase()) == -1) return PriUIShade.DEFAULT;
        else return cast s.toUpperCase();
    }
}