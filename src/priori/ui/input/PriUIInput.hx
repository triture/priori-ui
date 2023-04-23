package priori.ui.input;

import priori.ui.style.PriUIIntent;
import priori.fontawesome.FontAwesomeIconType;
import priori.ui.style.PriUIDisplayType;
import priori.ui.icon.PriUIFontAwesomeIcon;
import priori.ui.text.PriUILabel;
import priori.ui.container.PriUISpace;

class PriUIInput<T> extends PriUISpace {

    @:isVar public var value(get, set):T;
    private var validators:Array<(value:T)->Void>;

    private var errorMessage:PriUILabel;
    private var errorIcon:PriUIFontAwesomeIcon;

    public var onChange:Void->Void;

    public function new() {
        this.validators = [];

        super();

        this.clipping = false;
    }

    public function addValidation(validator:(value:T)->Void):Void this.validators.push(validator);

    private function get_value():T return null;
    private function set_value(value:T):T return value;

    public function validate():Bool {
        var v:T = this.value;
        var error:String = null;

        for (validator in this.validators) {
            try {
                validator(v);
            } catch (e:Dynamic) {
                error = Std.string(e);
            }

            if (error != null) break;
        }

        if (error != null) {
            error = StringTools.trim(error);
            if (error.length == 0) error = "Error";
            this.showError(error);
            return false;

        } else this.hideError();

        return true;
    }

    private function showError(messsage:String):Void {
        if (this.errorIcon == null) {
            this.errorIcon = new PriUIFontAwesomeIcon();
            this.errorIcon.margin = 0;
            this.errorIcon.size = 22;
            this.errorIcon.styleDisplayType = PriUIDisplayType.DANGER;
            this.errorIcon.iconType = FontAwesomeIconType.EXCLAMATION_CIRCLE;
            this.errorIcon.right = 13;
            this.errorIcon.top = 10;

            this.errorMessage = new PriUILabel();
            this.errorMessage.styleIntent = PriUIIntent.OVERLINE;
            this.errorMessage.styleDisplayType = PriUIDisplayType.DANGER;
            this.errorMessage.x = 7;

            this.addChildList(
                [
                    this.errorIcon,
                    this.errorMessage
                ]
            );
        }

        this.errorMessage.text = messsage;
        this.errorMessage.visible = true;
        this.errorIcon.visible = true;
        this.updateErrorDisplay();
    }

    private function hideError():Void {
        if (this.errorIcon != null) {
            this.errorMessage.visible = false;
            this.errorIcon.visible = false;
            this.updateErrorDisplay();
        }
    }

    private function updateErrorDisplay():Void {
        this.updateDisplay();
        this.errorMessage.y = this.height + 2;
    }

}