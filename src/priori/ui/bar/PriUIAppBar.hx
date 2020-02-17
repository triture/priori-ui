package priori.ui.bar;

import priori.ui.container.PriUIContainer;
import priori.ui.style.PriUIStyle;
import priori.ui.style.PriUIDisplayType;
import priori.ui.container.layout.PriUIRow;
import priori.ui.style.PriUIDensity;
import priori.ui.text.PriUILabel;

@priori('
<priori>
    <view>
        <p:left                 value="0" />
        <p:right                value="0" />
        <p:z                    value="4" />
        
        <p:styleIntent          value="HEADER" />
        <p:styleSize            value="SMALLER" />

        <p:text                 value="Title Bar" />

        <private:PriUIRow 
            id="container" 
            left="0"
            right="0"
            top="0"
            bottom="0"
            paddingLeft="12"
            paddingRight="12"
            horizontalAlign="LEFT"
            >
            <private:PriUILabel id="label" />
        </private:PriUIRow>
    </view>
</priori>
')
class PriUIAppBar extends PriUIContainer {

    public var text(get, set):String;
    
    public function new() {
        super();
        
        this.styleDisplayType = PriUIDisplayType.PRIMARY;
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