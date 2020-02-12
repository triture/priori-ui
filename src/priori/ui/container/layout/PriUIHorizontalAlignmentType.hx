package priori.ui.container.layout;

@:enum
abstract PriUIHorizontalAlignmentType(String) {
    var LEFT = 'LEFT';
    var CENTER = 'CENTER';
    var RIGHT = 'RIGHT';
    var SPACE_BETWEEN = 'SPACE_BETWEEN';
    var SPACE_AROUND = 'SPACE_AROUND';
    var SPACE_EVENLY = 'SPACE_EVENLY';

    @:from
    static public function fromString(s:String):PriUIHorizontalAlignmentType {
        if (s == null) return null;
        else if ([
            'LEFT',
            'CENTER',
            'RIGHT',
            'SPACE_BETWEEN',
            'SPACE_AROUND',
            'SPACE_EVENLY'
        ].indexOf(s.toUpperCase()) == -1) return PriUIHorizontalAlignmentType.CENTER;
        else return cast s.toUpperCase();
    }
}