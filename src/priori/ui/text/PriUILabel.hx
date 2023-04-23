package priori.ui.text;

import priori.style.font.PriFontStyle;
import priori.style.font.PriFontStyleAlign;
import priori.ui.container.layout.PriUIVerticalAlignmentType;
import priori.ui.style.PriUIDisplayType;
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
    public var selectable(get, set):Bool;
    public var align(get, set):PriFontStyleAlign;

    @:isVar public var isHTML(default, set):Bool = false;

    public function new() {
        super();

        this.clipping = false;
        
        this.label.allowTransition(PriTransitionType.TEXT_COLOR, 0.4);
        this.label.clipping = false;
    }

    private function set_isHTML(value:Bool):Bool {
        this.isHTML = value;
        var text:String = this.__textValue;
        this.__textValue = '';
        this.set_text(text);
        return value;
    }

    override private function set_testIdentifier(value:String):String return this.label.testIdentifier=value;
    override private function get_testIdentifier():String return this.label.testIdentifier;

    private function get_align():PriFontStyleAlign return this.label.align;
    private function set_align(value:PriFontStyleAlign):PriFontStyleAlign return this.label.align = value;

    override public function hasFocus():Bool return this.label.hasFocus();

    override private function updateStyle():Void {
        this.updateFont();
    }

    override public function removeFocus():Void {
        super.removeFocus();
        this.label.removeFocus();
    }

    override private function setup():Void {
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

        this.label.ellipsis = (this.editable && e.type == PriFocusEvent.FOCUS_IN)
            ? false
            : true;

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
        var display:PriUIDisplayType = this.styleDisplayType;

        var font:PriUIFont = this.styleIntent.getFont(style, this.styleSize);
        var fontColor:PriColor = this.styleDisplayType.getColorKit(style).overColor.baseColor;

        var st:PriFontStyle = font.getFontStyle(style.fontFamily, fontColor);
        st.align = this.align;

        this.label.startBatchUpdate();
        this.label.fontSize = font.size;
        this.label.letterSpace = font.spacing;
        this.label.fontStyle = st;
        this.label.endBatchUpdate();

        this.updateDisplay();
    }

    private function get_editable():Bool return this.label.editable;
    private function set_editable(value:Bool):Bool {
        this.label.focusable = value;
        return this.label.editable = value;
    }

    private function get_text():String return this.__textValue;
    private function set_text(value:String):String {
        this.__textValue = value == null ? '' : value;

        if (this.isHTML) {
            if (value == null || value.length == 0) {
                this.label.text = ".";
                this.label.visible = false;
            } else {
                this.label.html = value;
                this.label.visible = true;
            }
        } else {
            if (value == null || value.length == 0) {
                this.label.text = ".";
                this.label.visible = false;
            } else {
                this.label.text = value;
                this.label.visible = true;
            }
        }

        this.updateDisplay();
        return value;
    }

    private function get_autoSize():Bool return this.label.autoSize;
    private function set_autoSize(value:Bool):Bool {
        this.label.autoSize = value;
        this.label.clipping = !value;
        this.updateDisplay();
        return value;
    }

    private function get_multiLine():Bool return this.label.multiLine;
    private function set_multiLine(value:Bool):Bool {
        this.label.multiLine = value;
        this.updateDisplay();
        return value;
    }

    private function get_selectable():Bool return this.label.selectable;
    private function set_selectable(value:Bool):Bool return this.label.selectable = value;

    override private function paint():Void {

        if (this.autoSize == false) {
            this.label.width = Math.round(this.width);
        } else {
            super.set_width(Math.round(this.label.width));
        }

        super.set_height(Math.round(this.label.height));
    }

    override private function set_width(value:Float):Float {
        if (this.autoSize == false) {
            super.set_width(value);
        }

        return value;
    }

    override private function set_height(value:Float):Float {
        return value;
    }
}