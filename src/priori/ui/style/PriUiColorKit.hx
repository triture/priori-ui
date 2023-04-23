package priori.ui.style;

import priori.geom.PriColor;
import priori.ui.event.PriUIEvent;
import priori.event.PriEventDispatcher;
import haxe.ds.StringMap;

class PriUiColorKit extends PriEventDispatcher {

    private var colorMap:StringMap<PriUIColorSwatch> = new StringMap<PriUIColorSwatch>();

    public var overColor(get, set):PriUIColorSwatch;
    public var backgroundColor(get, set):PriUIColorSwatch;
    public var accent(get, set):PriUIColorSwatch;

    public function new(base:PriColor, background:PriColor, accent:PriColor) {
        super();

        this.overColor = new PriUIColorSwatch(base);
        this.backgroundColor = new PriUIColorSwatch(background);
        this.accent = new PriUIColorSwatch(accent);
    }

    public function isEqual(colorKit:PriUiColorKit):Bool {
        if (colorKit == null) return false;
        else if (colorKit.overColor == null || colorKit.backgroundColor == null || colorKit.accent == null) return false;
        else if (this.overColor == null || this.backgroundColor == null || this.accent == null) return false;
        else return (this.overColor.isEqual(colorKit.overColor) && this.backgroundColor.isEqual(colorKit.backgroundColor) && this.accent.isEqual(colorKit.accent));
    }

    private function get_overColor():PriUIColorSwatch return this.colorMap.get('overColor');
    private function set_overColor(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('overColor', value);

    private function get_backgroundColor():PriUIColorSwatch return this.colorMap.get('backgroundColor');
    private function set_backgroundColor(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('backgroundColor', value);

    private function get_accent():PriUIColorSwatch return this.colorMap.get('accent');
    private function set_accent(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('accent', value);

    private function updateColor(key:String, value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;

        var old = this.colorMap.get(key);
        this.colorMap.set(key, value);

        if (!value.isEqual(old)) this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));

        return value;
    }

}
