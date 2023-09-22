package priori.ui.container.layout;

enum abstract PriUIVerticalAlignmentType(String) {
    var TOP = 'TOP';
    var CENTER = 'CENTER';
    var BOTTOM = 'BOTTOM';
    var SPACE_BETWEEN = 'SPACE_BETWEEN';
    var SPACE_AROUND = 'SPACE_AROUND';
    var SPACE_EVENLY = 'SPACE_EVENLY';

    @:from
    static public function fromString(s:String):PriUIVerticalAlignmentType {
        if (s == null) return null;
        else if ([
            'TOP',
            'CENTER',
            'BOTTOM',
            'SPACE_BETWEEN',
            'SPACE_AROUND',
            'SPACE_EVENLY'
        ].indexOf(s.toUpperCase()) == -1) return PriUIVerticalAlignmentType.CENTER;
        else return cast s.toUpperCase();
    }
}