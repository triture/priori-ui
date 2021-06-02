package priori.ui.input;

import priori.event.PriTapEvent;
import priori.ui.style.PriUIEmphasis;
import priori.ui.button.PriUIButtonFontAwesome;
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

class PriUIInputCheckbox extends PriUIInput<Bool> {

    @:isVar public var text(default, set):String;
    private var checkValue:Bool;

    public var isHTML(get, set):Bool;

    private var button:PriUIButtonFontAwesome;
    private var label:PriUILabel;

    private var iconActive:FontAwesomeIconType = FontAwesomeIconType.CHECK_SQUARE_REGULAR;
    private var iconInactive:FontAwesomeIconType = FontAwesomeIconType.SQUARE_REGULAR;

    public function new() {
        super();

        this.value = false;
        this.text = 'Checkbox';
    }

    private function get_isHTML():Bool return this.label.isHTML;
    private function set_isHTML(value:Bool):Bool return this.label.isHTML = value;

    override private function setup():Void {

        this.button = new PriUIButtonFontAwesome();
        this.button.styleDisplayType = PriUIDisplayType.PRIMARY;
        this.button.label = '';
        this.button.styleEmphasis = PriUIEmphasis.LOW;
        this.button.action = this.changeState;

        this.label = new PriUILabel();
        this.label.autoSize = false;
        this.label.multiLine = true;
        this.label.styleIntent = PriUIIntent.SUBTITLE;
        this.label.addEventListener(PriTapEvent.TAP, this.onTap);

        this.addChildList(
            [
                this.button,
                this.label
            ]
        );
    }

    private function onTap(e:PriTapEvent):Void this.changeState();

    private function changeState():Void {
        this.value = !this.checkValue;
        if (this.onChange != null) this.onChange();

        this.validate();
    }

    override private function paint():Void {
        var space:Int = 20;

        this.label.x = this.button.maxX;
        this.label.y = (this.button.height - this.style.fontSubtitleSmaller.size)/2 - 2;
        this.label.width = this.width - this.label.x - (this.errorIcon == null ? 0 : this.errorIcon.width);

        this.height = Math.round(Math.max(this.button.maxY, this.label.maxY));
    }

    private function updateData():Void {
        this.label.text = this.text;
        this.button.iconType = this.checkValue ? this.iconActive : this.iconInactive;
        this.updateDisplay();
    }

    override private function get_value():Bool return this.checkValue;
    override private function set_value(value:Bool):Bool {
        this.checkValue = value;
        this.updateData();
        return value;
    }

    private function set_text(value:String):String {
        this.text = value;
        this.updateData();
        return value;
    }

}
