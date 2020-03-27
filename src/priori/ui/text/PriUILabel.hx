package priori.ui.text;

import priori.event.PriEvent;
import priori.event.PriFocusEvent;
import priori.event.PriKeyboardEvent;
import priori.ui.style.PriUIStyle;
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

    private var __textValue:String = "";

    public var text(get, set):String;
    public var editable(get, set):Bool;
    public var autoSize(get, set):Bool;
    public var multiLine(get, set):Bool;
    
    public function new() {
        super();

        this.clipping = false;
        
        this.label.allowTransition(PriTransitionType.TEXT_COLOR, 0.4);
        this.label.clipping = false;
    }

    override public function hasFocus():Bool return this.label.hasFocus();

    override private function updateStyle():Void {
        this.updateFont();
    }

    override public function removeFocus():Void {
        super.removeFocus();
        this.label.removeFocus();
    }

    override private function setup():Void {
        this.label.focusable = true;

        this.label.addEventListener(PriEvent.CHANGE, this.onChange);
        this.label.addEventListener(PriKeyboardEvent.KEY_DOWN, this.onKey);
        this.label.addEventListener(PriFocusEvent.FOCUS_IN, this.onFocus);
        this.label.addEventListener(PriFocusEvent.FOCUS_OUT, this.onFocus);
    }

    private function onChange(e:PriEvent):Void {
        this.__textValue = this.label.text;
        this.dispatchEvent(new PriEvent(PriEvent.CHANGE));
    }

    private function onFocus(e:PriFocusEvent):Void {
        var ev:PriFocusEvent = cast e.clone();
        ev.currentTarget = this;
        ev.target = this;
        this.dispatchEvent(ev);
    }

    private function onKey(e:PriKeyboardEvent):Void {
        var ev:PriKeyboardEvent = cast e.clone();
        ev.currentTarget = this;
        ev.target = this;
        this.dispatchEvent(ev);
    }

    private function updateFont():Void {
        var style:PriUIStyle = this.style;

        var font:PriUIFont = this.styleIntent.getFont(style, this.styleSize);
        var color:PriColor = this.styleDisplayType.getForegroundSwatch(style).baseColor;
        
        this.label.startBatchUpdate();
        this.label.fontSize = font.size;
        this.label.letterSpace = font.spacing;
        this.label.fontStyle = font.getFontStyle(style.fontFamily, color);
        this.label.endBatchUpdate();

        this.updateDisplay();
    }

    private function get_editable():Bool return this.label.editable;
    private function set_editable(value:Bool):Bool {
        this.label.editable = value;
        return value;
    }

    private function get_text():String return this.__textValue;
    private function set_text(value:String):String {
        this.__textValue = value == null ? '' : value;
        
        if (value == null || value.length == 0) {
            this.label.text = ".";
            this.label.visible = false;
        } else {
            this.label.text = value;
            this.label.visible = true;
        }

        this.updateDisplay();
        return value;
    }

    private function set_autoSize(value:Bool):Bool {
        this.label.autoSize = value;
        this.updateDisplay();
        return value;
    }
    private function get_autoSize():Bool return this.label.autoSize;

    private function set_multiLine(value:Bool):Bool {
        this.label.multiLine = value;
        this.updateDisplay();
        return value;
    }
    private function get_multiLine():Bool return this.label.multiLine;

    override private function paint():Void {
        
        if (this.autoSize) {
            this.width = Math.round(this.label.width);
        } else {
            this.label.width = Math.round(this.width);
        }

        this.height = Math.round(this.label.height);
    }
}