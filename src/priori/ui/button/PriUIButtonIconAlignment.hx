package priori.ui.button;

@:enum
abstract PriUIButtonIconAlignment(String) {
    var LEFT = 'LEFT';
    var RIGHT = 'RIGHT';

    @:from
    static public function fromString(s:String):PriUIButtonIconAlignment {
        if (s == null) return null;
        else if ([
            'LEFT',
            'RIGHT'
        ].indexOf(s.toUpperCase()) == -1) return PriUIButtonIconAlignment.LEFT;
        else return cast s.toUpperCase();
    }
}