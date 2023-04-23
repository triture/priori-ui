package priori.ui.factory;

import priori.fontawesome.FontAwesomeIconType;
import priori.ui.button.PriUIButtonFontAwesome;
import priori.ui.button.PriUIButton;
import priori.ui.input.PriUIInputText;
import priori.ui.style.PriUIDisplayType;

class PriUIFactory {

    static public function getInput(title:String, ?displayType:PriUIDisplayType, ?multi:Bool=false):PriUIInputText {
        var input:PriUIInputText = new PriUIInputText();
        input.width = 300;
        if (displayType != null) input.styleDisplayType = displayType;
        input.placeholder = title;
        input.multiline = multi;
        return input;
    }

    static public function getButton(title:String, ?displayType:PriUIDisplayType, ?icon:FontAwesomeIconType):PriUIButton {
        if (icon == null) {
            var button:PriUIButton = new PriUIButton();
            if (displayType != null) button.styleDisplayType = displayType;
            button.label = title;
            return button;
        } else {
            var button:PriUIButtonFontAwesome = new PriUIButtonFontAwesome();
            button.iconType = icon;
            if (displayType != null) button.styleDisplayType = displayType;
            button.label = title;
            return button;
        }
    }

}
