package priori.ui.bar;

import priori.ui.style.PriUIStyle;
import priori.ui.style.PriUIContainerType;
import priori.ui.container.layout.PriUIRow;
import priori.ui.style.PriUIDensity;
import priori.ui.text.PriUILabel;

@priori('
<priori>
    <view>
        <p:left                 value="0" />
        <p:right                value="0" />
        <p:paddingLeft          value="12" />
        <p:paddingRight         value="12" />
        <p:horizontalAlign      value="LEFT" />
        <p:z                    value="3" />
        
        <p:styleIntent          value="HEADER" />
        <p:styleSize            value="SMALLER" />

        <p:text                 value="Title Bar" />

        <private:PriUILabel id="label" />
    </view>
</priori>
')
class PriUIAppBar extends PriUIRow {

    public var text(get, set):String;
    
    public function new() {
        super();
        
        this.styleContainerType = PriUIContainerType.PRIMARY;
    }

    private function get_text():String return this.label.text;
    private function set_text(value:String):String {
        this.label.text = value;
        return value;
    }

    override private function updateStyle():Void {
        super.updateStyle();
        this.updateDisplay();
    }

    override private function paint():Void {
        super.paint();
        
        var space:Float = switch (this.styleDensity) {
            case PriUIDensity.DEFAULT : Math.floor(this.label.height * PriUIStyle.DENSITY_DEFAULT_WEIGHT);
            case PriUIDensity.COMPACT : Math.floor(this.label.height * PriUIStyle.DENSITY_COMPACT_WEIGHT);
        }
        
        this.height = this.label.height + space * 2;

    }
}