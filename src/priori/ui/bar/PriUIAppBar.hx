package priori.ui.bar;

import priori.ui.style.PriUIType;
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

        <private:PriUILabel text="Title Bar" id="label" />
    </view>
</priori>
')
class PriUIAppBar extends PriUIRow {

    @:isVar public var text(default, set):String = "";
    
    public function new() {
        super();

        this.styleType = PriUIType.PRIMARY;
    }

    private function set_text(value:String):String {
        this.text = value;
        this.label.text = value;
        
        return value;
    }

    override private function updateStyle():Void {
        super.updateStyle();

        switch (this.styleDensity) {
            case PriUIDensity.DEFAULT : {
                this.height = 44;
            }
            case PriUIDensity.COMPACT : {
                this.height = 38;
            }
        }

    }
}