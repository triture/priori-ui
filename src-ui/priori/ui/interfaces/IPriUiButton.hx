package priori.ui.interfaces;

interface IPriUiButton extends IPriUIStyle {
    public var action(get, set):Void->Void;
    public var label(get, set):String;
    public function executeAction():Void;
}