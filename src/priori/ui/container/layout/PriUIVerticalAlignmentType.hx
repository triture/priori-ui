package priori.ui.container.layout;

@:enum
abstract PriUIVerticalAlignmentType(String) from String to String {
    var TOP = 'TOP';
    var CENTER = 'CENTER';
    var BOTTOM = 'BOTTOM';
    var SPACE_BETWEEN = 'SPACE_BETWEEN';
    var SPACE_AROUND = 'SPACE_AROUND';
    var SPACE_EVENLY = 'SPACE_EVENLY';
}