package priori.ui.text;

import priori.geom.PriColor;
import priori.ui.style.PriUIFont;
import priori.ui.container.PriUIContainer;
import priori.types.PriTransitionType;

@priori('
<priori>
    <imports>
        <priori.view.text.PriText />
    </imports>
    <view>
        <private:PriText id="label"/>
    </view>
</priori>
')
class PriUILabel extends PriUIContainer {
    
    public var text(get, set):String;
    public var autoSize(get, set):Bool;
    
    public function new() {
        super();

        this.clipping = false;

        this.label.allowTransition(PriTransitionType.TEXT_COLOR, 0.4);
    }

    override private function updateStyle():Void {
        super.updateStyle();
        this.updateFont();
    }

    private function updateFont():Void {
        var font:PriUIFont = this.style.fontHeader2;
        var color:PriColor = this.isInsideContainerType().getForegroundSwatch(this.style).baseColor;

        this.label.fontSize = font.size;
        this.label.fontStyle = font.getFontStyle(this.style.fontFamily, color);

        this.updateDisplay();
    }

    private function set_text(value:String):String {
        this.label.text = value;
        this.updateDisplay();
        return value;
    }
    private function get_text():String return this.label.text;

    private function set_autoSize(value:Bool):Bool return this.label.autoSize = value;
    private function get_autoSize():Bool return this.label.autoSize;

    override private function paint():Void {
        
        if (this.autoSize) {
            this.width = this.label.width;
        } else {
            this.label.width = this.width;
        }

        this.height = this.label.height;
    }
}