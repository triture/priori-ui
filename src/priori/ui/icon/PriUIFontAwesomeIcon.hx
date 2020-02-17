package priori.ui.icon;

import priori.ui.style.PriUIStyle;
import priori.fontawesome.FontAwesomeIcon;
import priori.fontawesome.FontAwesomeIconType;
import priori.ui.container.PriUISquare;

class PriUIFontAwesomeIcon extends PriUISquare {
    
    public var iconType(get, set):FontAwesomeIconType;

    private var icon:FontAwesomeIcon;

    public function new() {
        super();
        this.clipping = false;
        this.iconType = FontAwesomeIconType.QUESTION;
    }

    override private function set_size(value:Float):Float {
        this.icon.size = value;
        return super.set_size(value);
    }

    private function get_iconType():FontAwesomeIconType return this.icon.icon;
    private function set_iconType(value:FontAwesomeIconType):FontAwesomeIconType {
        if (value == null) return value;
        
        if (this.icon == null) {
            this.icon = new FontAwesomeIcon(value);
            this.addChild(this.icon);
        }

        if (this.icon.icon != value) {
            this.icon.icon = value;
        }

        return value;
    }

    override private function updateStyle():Void {
        if (this.icon != null) {
            var style:PriUIStyle = this.style;
            this.icon.color = this.styleDisplayType.getForegroundSwatch(style).baseColor;
        }
    };
}