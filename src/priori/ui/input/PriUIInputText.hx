package priori.ui.input;

import priori.event.PriTapEvent;
import priori.geom.PriColor;
import priori.style.border.PriBorderStyle;
import priori.style.font.PriFontStyleVariant;
import priori.ui.style.PriUISize;
import priori.ui.style.PriUIColorSwatch;
import priori.system.PriKey;
import priori.event.PriKeyboardEvent;
import priori.ui.style.PriUIIntent;
import priori.ui.style.PriUIDisplayType;
import priori.types.PriFormInputTextFieldType;
import haxe.Timer;
import priori.event.PriEvent;
import priori.event.PriFocusEvent;
import priori.style.font.PriFontStyle;
import priori.view.form.PriFormTextArea;
import priori.view.form.PriFormInputText;
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

    private var timerChange:Timer;

    public var action:()->Void;

    @:isVar public var inputMarginLeft(default, set):Float = 13;
    @:isVar public var inputMarginRight(default, set):Float = 13;
    @:isVar public var inputAditionalHeightByFontSize(default, set):Float = 2.3;

    public function new() {
        super();

        this.styleIntent = PriUIIntent.BODY;
        this.styleSize = PriUISize.SMALLER;
    }

    private function set_inputAditionalHeightByFontSize(value:Float):Float {
        var v:Float = (value == null || value < 0) ? 0 : value;
        if (this.inputAditionalHeightByFontSize == v) return value;
        this.inputAditionalHeightByFontSize = v;
        this.updateStyle();
        this.updateDisplay();
        return value;
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

    inline private function hasPlaceholder():Bool {
        return (this.placeholder != null && StringTools.trim(this.placeholder).length > 0);
    }

    inline private function hasContentOrSelection():Bool {
        var curLen:Int = this.input == null ? this.inputMultiline.value.length : this.input.value.length;
        var hasFocus:Bool = this.hasFocus();
        return (curLen > 0 || hasFocus);
    }

    override private function updateStyle():Void {
        var type = this.styleDisplayType;

        if (type != PriUIDisplayType.NONE) {
            var style = this.style;
            var size = this.styleSize;
            var font = this.styleIntent.getFont(style, size);

            var fgColor:PriUIColorSwatch = type.getColorKit(style).overColor;
            var bgColor:PriUIColorSwatch = type.getColorKit(style).backgroundColor;

            var invert:Bool = !bgColor.isLight();

            var realFGColor:PriColor = fgColor.baseColor;
            var realBGColor:PriColor = bgColor.baseColor;
            var borderColor:PriColor = bgColor.isLight() ? realFGColor : bgColor.baseColor.mix(0, 0.3);

            this.bgColor = realBGColor;

            if (this.hasPlaceholder()) {
                this.labelPlaceholder.fontStyle = this.labelPlaceholder.fontStyle
                    .setColor(realFGColor)
                    .setFamily(style.fontFamily)
                    .setWeight(font.weight)
                    .setVariant(PriFontStyleVariant.ALL_CAPS);
            }

            this.border = new PriBorderStyle().setWidth(2).setColor(borderColor);

            if (this.multiline) {
                this.inputMultiline.fontSize = font.size;
                this.inputMultiline.fontStyle = this.inputMultiline.fontStyle
                    .setColor(realFGColor)
                    .setFamily(style.fontFamily)
                    .setWeight(font.weight)
                    .setVariant(font.variant);

            } else {
                this.input.fontSize = font.size;
                this.input.fontStyle = this.input.fontStyle
                    .setColor(realFGColor)
                    .setFamily(style.fontFamily)
                    .setWeight(font.weight)
                    .setVariant(font.variant);
            }
        }
    }

    private function set_multiline(value:Bool):Bool {
        if (value != null) {

            this.multiline = value;

            if (value == false && this.input == null) {
                // create singleline

                this.input = this.createInputSingleLine();
                this.input.value = this.inputMultiline.value;

                this.removeChild(this.inputMultiline);
                this.inputMultiline.kill();
                this.inputMultiline = null;

                this.addChildList(
                    [
                        this.input,
                        this.labelPlaceholder
                    ]
                );

                this.updateStyle();
                this.updateDisplay();

            } else if (value == true && this.inputMultiline == null) {

                this.inputMultiline = this.createInputMultiline();
                this.inputMultiline.value = this.input.value;

                this.removeChild(this.input);
                this.input.kill();
                this.input = null;

                this.addChildList(
                    [
                        this.inputMultiline,
                        this.labelPlaceholder
                    ]
                );

                this.updateStyle();
                this.updateDisplay();

            }


        }

        return value;
    }

    private function createInputSingleLine():PriFormInputText {
        var input:PriFormInputText = new PriFormInputText();
        input.addEventListener(PriKeyboardEvent.KEY_DOWN, this.onKeyDown);
        input.addEventListener(PriEvent.CHANGE, this.onFieldChange);
        input.addEventListener(PriFocusEvent.FOCUS_IN, this.onFocus);
        input.addEventListener(PriFocusEvent.FOCUS_OUT, this.onFocus);
        input.fontStyle = new PriFontStyle();

        return input;
    }

    private function createInputMultiline():PriFormTextArea {
        var input:PriFormTextArea = new PriFormTextArea();
        input.addEventListener(PriKeyboardEvent.KEY_DOWN, this.onKeyDown);
        input.addEventListener(PriEvent.CHANGE, this.onFieldChange);
        input.addEventListener(PriFocusEvent.FOCUS_IN, this.onFocus);
        input.addEventListener(PriFocusEvent.FOCUS_OUT, this.onFocus);
        input.fontStyle = new PriFontStyle();

        return input;
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
        this.addEventListener(PriTapEvent.TAP, this.onTap);
        this.pointer = false;

        this.input = this.createInputSingleLine();

        this.labelPlaceholder = new PriText();
        this.labelPlaceholder.fontStyle = new PriFontStyle();
        this.labelPlaceholder.autoSize = false;
        this.labelPlaceholder.mouseEnabled = false;

        this.addChildList(
            [
                this.input,
                this.labelPlaceholder
            ]
        );

    }

    private function onTap(e:PriTapEvent):Void this.setFocus();

    private function getFieldFontSize():Float {
        var type = this.styleDisplayType;
        var style = this.style;
        var size = this.styleSize;
        var fontSize:Float = this.styleIntent.getFont(style, size).size;

        return fontSize;
    }

    inline private function calculateNormalInputHeight(fontsize:Float):Float return Math.round(fontsize * this.inputAditionalHeightByFontSize);
    private function calculateNormalFieldHeight():Float {
        var type = this.styleDisplayType;
        var style = this.style;
        var size = this.styleSize;

        var fontsize:Float = this.styleIntent.getFont(style, size).size;
        var fontProportion:Float = style.fontBoundingBoxProportion;

        var normalInputHeight:Float = this.calculateNormalInputHeight(fontsize);
        var smallPlaceholderHeight:Float = (fontsize * 0.75 * fontProportion);
        var marginForPlaceHolder:Float = smallPlaceholderHeight * 0.45;

        return normalInputHeight + smallPlaceholderHeight + marginForPlaceHolder;
    }

    override private function paint():Void {
        var fontsize:Float = this.getFieldFontSize();

        var hasPlaceholder:Bool = this.hasPlaceholder();
        var hasContentSelection:Bool = this.hasContentOrSelection();
        var fieldWidth:Float = this.width - this.inputMarginLeft - this.inputMarginRight;

        var normalHeight:Float = Math.round(this.calculateNormalFieldHeight());
        var normalFieldHeight:Float = this.calculateNormalInputHeight(fontsize);
        var inputInitialY:Float = normalHeight - normalFieldHeight;
        var extraInitialYForMultiline:Float = (normalFieldHeight - fontsize)/2;

        this.corners = [4];

        if (this.errorIcon != null && this.errorIcon.visible) {
            fieldWidth -= this.errorIcon.width;
        }

        if (this.multiline) {
            this.height = Math.floor(normalHeight * 2.5);

            this.inputMultiline.y = inputInitialY + extraInitialYForMultiline;
            this.inputMultiline.height = this.height - this.inputMultiline.y;
            this.inputMultiline.x = this.inputMarginLeft;
            this.inputMultiline.width = fieldWidth;

        } else {
            this.height = normalHeight;

            this.input.height = normalFieldHeight;
            this.input.x = this.inputMarginLeft;
            this.input.width = fieldWidth;

            if (hasPlaceholder) this.input.maxY = this.height;
            else this.input.centerY = this.height/2;
        }

        if (this.hasPlaceholder()) {
            this.labelPlaceholder.fontSize = hasContentSelection
                ? fontsize * 0.75
                : fontsize * 1.2;

            this.labelPlaceholder.x = this.inputMarginLeft;
            this.labelPlaceholder.width = fieldWidth;
            this.labelPlaceholder.centerY = hasContentSelection
                ? inputInitialY/2 + inputInitialY * 0.1
                : normalHeight/2;
        }

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
