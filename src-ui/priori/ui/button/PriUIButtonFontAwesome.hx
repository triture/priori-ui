package priori.ui.button;

import priori.ui.icon.PriUIFontAwesomeIcon;
import priori.fontawesome.FontAwesomeIconType;

class PriUIButtonFontAwesome extends PriUIButton {
    
    public var iconType(get, set):FontAwesomeIconType;

    private var __butonIcon:PriUIFontAwesomeIcon;

    public function new() {
        this.__butonIcon = new PriUIFontAwesomeIcon();

        super();

        this.icon = this.__butonIcon;
    }

    private function get_iconType():FontAwesomeIconType return this.__butonIcon.iconType;
    private function set_iconType(value:FontAwesomeIconType):FontAwesomeIconType {
        this.__butonIcon.iconType = value;
        return value;
    }

}