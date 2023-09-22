package priori.ui.container.layout;

enum abstract PriUIAutoSizeType(String) {
    var FIT = 'FIT';
    var FIXED = 'FIXED';

    @:from
    static public function fromString(s:String):PriUIAutoSizeType {
        if (s == null) return null;
        else if ([
            'FIT',
            'FIXED'
        ].indexOf(s.toUpperCase()) == -1) return PriUIAutoSizeType.FIXED;
        else return cast s.toUpperCase();
    }
}