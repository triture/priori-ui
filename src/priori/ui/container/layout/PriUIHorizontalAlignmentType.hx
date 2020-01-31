package priori.ui.container.layout;

@:enum
abstract PriUIHorizontalAlignmentType(String) from String to String {
    var LEFT = 'LEFT';
    var CENTER = 'CENTER';
    var RIGHT = 'RIGHT';
    var SPACE_BETWEEN = 'SPACE_BETWEEN';
    var SPACE_AROUND = 'SPACE_AROUND';
    var SPACE_EVENLY = 'SPACE_EVENLY';
}