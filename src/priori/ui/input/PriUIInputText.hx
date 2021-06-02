package priori.ui.input;

import priori.system.PriKey;
import priori.event.PriKeyboardEvent;
import priori.ui.style.PriUIIntent;
import priori.fontawesome.FontAwesomeIconType;
import priori.ui.icon.PriUIFontAwesomeIcon;
import priori.ui.text.PriUILabel;
import priori.ui.style.PriUIShade;
import priori.ui.style.PriUIDisplayType;
import priori.ui.container.PriUISpace;
import priori.types.PriFormInputTextFieldType;
import haxe.Timer;
import priori.event.PriEvent;
import priori.event.PriFocusEvent;
import priori.style.font.PriFontStyleWeight;
import priori.style.font.PriFontStyleItalic;
import priori.style.font.PriFontStyle;
import priori.view.form.PriFormTextArea;
import priori.view.form.PriFormInputText;
import priori.view.PriLineHorizontal;
import priori.view.text.PriText;

class PriUIInputText extends PriUIInput<String> {

    public var password(get, set):Bool;
    public var inputType(get, set):PriFormInputTextFieldType;

    @:isVar public var placeholder(default, set):String;
    @:isVar public var multiline(default, set):Bool = false;

    public var onDelayedChange:Void->Void;

    private var labelPlaceholder:PriText;
    private var input:PriFormInputText;
    private var inputMultiline:PriFormTextArea;
    private var line:PriLineHorizontal;

    private var timerChange:Timer;

    public var action:()->Void;

    @:isVar public var inputMarginLeft(default, set):Float = 0;
    @:isVar public var inputMarginRight(default, set):Float = 0;

    public function new() {
        super();

        this.styleDisplayType = PriUIDisplayType.PRIMARY;

        //this.clipping = false;
        this.height = 50;
    }


    private function set_inputMarginLeft(value:Float):Float {
        var v:Float = (value == null || value < 0) ? 0 : value;
        if (this.inputMarginLeft == v) return value;
        this.inputMarginLeft = v;
        this.updateDisplay();
        return value;
    }

    private function set_inputMarginRight(value:Float):Float {
        var v:Float = (value == null || value < 0) ? 0 : value;
        if (this.inputMarginRight == v) return value;
        this.inputMarginRight = v;
        this.updateDisplay();
        return value;
    }

    override private function updateStyle():Void {

        var type = this.styleDisplayType;

        if (type != PriUIDisplayType.NONE) {

            var style = this.style;
            var shade = this.styleShade;

            this.bgColor = PriUIDisplayType.SUBTLE.getBackgroundSwatch(style).getColor(shade);

            var colorBasic = type.getBackgroundSwatch(style).getColor(shade);
            var colorClear = type.getBackgroundSwatch(style).getColor(PriUIShade.BRIGHTER);

            this.labelPlaceholder.textColor = colorClear;

            var hasFocus:Bool = this.hasFocus();
            var curLen:Int = this.input == null ? this.inputMultiline.value.length : this.input.value.length;

            if (curLen > 0 || hasFocus) {
                this.labelPlaceholder.fontSize = 11;
            } else {
                this.labelPlaceholder.fontSize = 18;
            }

            if (hasFocus) {
                this.line.lineColor = colorBasic;
            } else {
                this.line.lineColor = PriUIDisplayType.SUBTLE.getBackgroundSwatch(style).getColor(PriUIShade.DARKER);
            }

            if (this.input == null) this.inputMultiline.fontStyle = this.inputMultiline.fontStyle.setColor(colorBasic);
            else this.input.fontStyle = this.input.fontStyle.setColor(colorBasic);

        }

    }

    private function set_multiline(value:Bool):Bool {
        if (value != null) {

            this.multiline = value;

            if (value == false && this.input == null) {
                // create singleline

                this.input = new PriFormInputText();
                this.input.addEventListener(PriKeyboardEvent.KEY_DOWN, this.onKeyDown);
                this.input.addEventListener(PriEvent.CHANGE, this.onFieldChange);
                this.input.addEventListener(PriFocusEvent.FOCUS_IN, this.onFocus);
                this.input.addEventListener(PriFocusEvent.FOCUS_OUT, this.onFocus);
                this.input.fontSize = 14;
                this.input.fontStyle = this.inputMultiline.fontStyle;
                this.input.value = this.inputMultiline.value;

                this.removeChild(this.inputMultiline);
                this.inputMultiline.kill();
                this.inputMultiline = null;

                this.addChildList(
                    [
                        this.input,
                        this.labelPlaceholder,
                        this.line
                    ]
                );

                this.height = 50;

                this.updateStyle();
                this.updateDisplay();

            } else if (value == true && this.inputMultiline == null) {

                this.inputMultiline = new PriFormTextArea();
                this.inputMultiline.addEventListener(PriKeyboardEvent.KEY_DOWN, this.onKeyDown);
                this.inputMultiline.addEventListener(PriEvent.CHANGE, this.onFieldChange);
                this.inputMultiline.addEventListener(PriFocusEvent.FOCUS_IN, this.onFocus);
                this.inputMultiline.addEventListener(PriFocusEvent.FOCUS_OUT, this.onFocus);
                this.inputMultiline.fontSize = 14;
                this.inputMultiline.fontStyle = this.input.fontStyle;
                this.inputMultiline.value = this.input.value;

                this.removeChild(this.input);
                this.input.kill();
                this.input = null;

                this.addChildList(
                    [
                        this.inputMultiline,
                        this.labelPlaceholder,
                        this.line
                    ]
                );

                this.height = 140;

                this.updateStyle();
                this.updateDisplay();

            }


        }

        return value;
    }

    override public function hasFocus():Bool {
        if (this.input == null) return this.inputMultiline.hasFocus();
        else return this.input.hasFocus();
    }

    override public function setFocus():Void {
        if (this.input == null) this.inputMultiline.setFocus();
        else this.input.setFocus();
    }

    private function set_placeholder(value:String):String {
        if (this.placeholder == value) return value;

        this.placeholder = value;

        this.labelPlaceholder.text = value.toLowerCase();
        this.updateDisplay();
        return value;
    }

    private function get_inputType():PriFormInputTextFieldType return this.input == null ? null : this.input.fieldType;
    private function set_inputType(value:PriFormInputTextFieldType):PriFormInputTextFieldType {
        if (value != null) if (this.input != null) this.input.fieldType = value;
        return value;
    }

    private function get_password():Bool return this.input == null ? false : this.input.password;
    private function set_password(value:Bool):Bool {
        if (value != null) if (this.input != null) this.input.password = value;
        return value;
    }

    override private function get_value():String return this.input == null ? this.inputMultiline.value : this.input.value;
    override private function set_value(value:String):String {
        if (value != null) {

            if (this.input == null) this.inputMultiline.value = value;
            else this.input.value = value;

            this.updatePlaceholder();
        }

        return this.value;
    }

    private function updatePlaceholder():Void {

//        var focus:Bool = this.input == null ? this.inputMultiline.hasFocus() : this.input.hasFocus();
//        var curLen:Int = this.input == null ? this.inputMultiline.value.length : this.input.value.length;
//
//        if (curLen > 0 || this.hasFocus()) {
//            this.labelPlaceholder.fontSize = 11;
//        } else {
//            this.labelPlaceholder.fontSize = 18;
//        }

        this.updateStyle();
        this.updateDisplay();
    }

    private function onFocus(e:PriFocusEvent):Void {
        this.updatePlaceholder();

        if (e.type == PriFocusEvent.FOCUS_OUT && this.timerChange != null) this.runDelayedChange();
    }

    private function runDelayedChange():Void {
        this.killTimer();
        this.validate();
        if (this.onDelayedChange != null) this.onDelayedChange();
    }

    private function killTimer():Void {
        if (this.timerChange != null) {
            this.timerChange.stop();
            this.timerChange.run = null;
            this.timerChange = null;
        }
    }

    private function onKeyDown(e:PriKeyboardEvent):Void {
        if (this.action != null && e.keycode == PriKey.ENTER) this.action();
    }

    private function onFieldChange(e:PriEvent):Void {
        this.killTimer();
        if (this.onChange != null) this.onChange();
        this.timerChange = Timer.delay(this.runDelayedChange, 600);
        this.dispatchEvent(new PriEvent(PriEvent.CHANGE));
    }

    override private function setup():Void {

        this.corners = [4, 4, 0, 0];

        this.input = new PriFormInputText();
        this.input.addEventListener(PriKeyboardEvent.KEY_DOWN, this.onKeyDown);
        this.input.addEventListener(PriEvent.CHANGE, this.onFieldChange);
        this.input.addEventListener(PriFocusEvent.FOCUS_IN, this.onFocus);
        this.input.addEventListener(PriFocusEvent.FOCUS_OUT, this.onFocus);
        this.input.height = 40;
        this.input.fontSize = 14;
        this.input.fontStyle = new PriFontStyle().setWeight(PriFontStyleWeight.THICK300);

        this.labelPlaceholder = new PriText();
        this.labelPlaceholder.fontSize = 18;
        this.labelPlaceholder.fontStyle = new PriFontStyle().setItalic(PriFontStyleItalic.ITALIC).setWeight(PriFontStyleWeight.LIGHTER);
        this.labelPlaceholder.autoSize = false;
        this.labelPlaceholder.mouseEnabled = false;

        this.line = new PriLineHorizontal();
        this.line.lineWidth = 2;

        this.addChildList(
            [
                this.input,
                this.labelPlaceholder,
                this.line
            ]
        );
    }

    override private function paint():Void {
        var space:Int = 13;
        var hasPlaceholder:Bool = this.placeholder != null && StringTools.trim(this.placeholder).length > 0;
        var fieldWidth:Float = this.width - space * 2 - this.inputMarginLeft - this.inputMarginRight;

        if (this.errorIcon != null && this.errorIcon.visible) {
            fieldWidth -= this.errorIcon.width;
        }

        this.labelPlaceholder.x = space + this.inputMarginLeft;
        this.labelPlaceholder.y = (this.labelPlaceholder.fontSize < 14) ? 7 : 17;
        this.labelPlaceholder.width = fieldWidth;

        if (this.input != null) {
            this.input.x = space + this.inputMarginLeft;
            this.input.width = fieldWidth;

            if (hasPlaceholder) this.input.y = 20;
            else this.input.centerY = this.height/2;

            this.input.height = this.height - this.input.y;
        }

        if (this.inputMultiline != null) {
            this.inputMultiline.x = space + this.inputMarginLeft;
            this.inputMultiline.width = fieldWidth;
            this.inputMultiline.y = hasPlaceholder ? 30 : 15;
            this.inputMultiline.height = this.height - this.inputMultiline.y;
        }

        this.line.width = this.width;
        this.line.y = this.height - 1;

        if (this.errorIcon != null) {
//            this.errorIcon.maxX = this.width - space - this.inputMarginRight;
//            this.errorIcon.centerY = this.input == null
//                ? this.inputMultiline.centerY
//                : this.input.centerY - 3;

//            this.errorMessage.x = space / 2;
//            this.errorMessage.y = this.height + 2;
        }
    }

    override public function kill():Void {
        this.action = null;
        if (this.timerChange != null) this.runDelayedChange();
        super.kill();
    }
}
