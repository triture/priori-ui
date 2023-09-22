package priori.ui.style;

enum abstract PriUISize(String) {
    var BIGGER = 'BIGGER';
    var SMALLER = 'SMALLER';

    @:from
    static public function fromString(s:String):PriUISize {
        if (s == null) return null;
        else if ([
            'BIGGER',
            'SMALLER'
        ].indexOf(s.toUpperCase()) == -1) return PriUISize.SMALLER;
        else return cast s.toUpperCase();
    }

}