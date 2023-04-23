package priori.ui.icon;

import priori.fontawesome.FontAwesomeIcon;
import priori.fontawesome.FontAwesomeIconType;
import priori.ui.container.PriUISquare;

class PriUIFontAwesomeIcon extends PriUISquare {
    
    public var iconType(get, set):FontAwesomeIconType;
    public var iconSize(get, set):Float;
    @:isVar public var margin(default, set):Float = 0;

    private var icon:FontAwesomeIcon;

    public function new() {
        super();
        this.clipping = false;
        this.iconType = FontAwesomeIconType.QUESTION;

        this.size = 26;
    }

    override private function paint():Void {
        if (this.icon != null) {
            this.icon.startBatchUpdate();
            this.icon.centerX = this.width / 2;
            this.icon.centerY = this.height / 2;

            var s = this.style;

            this.icon.color = this.styleDisplayType.getColorKit(s).overColor.baseColor;
            this.icon.endBatchUpdate();
        }
    }

    private function set_margin(value:Float):Float {
        this.margin = value;
        this.size = this.iconSize + (value*2);
        return value;
    }

    private function get_iconSize():Float return this.icon.size;
    private function set_iconSize(value:Float):Float {
        this.size = value + (this.margin*2);
        return value;
    }

    override private function set_size(value:Float):Float {
        this.icon.size = value - (this.margin * 2);
        return super.set_size(value);
    }

    private function get_iconType():FontAwesomeIconType return this.icon.icon;
    private function set_iconType(value:FontAwesomeIconType):FontAwesomeIconType {
        if (value == null) return value;
        
        if (this.icon == null) {
            this.icon = new FontAwesomeIcon(value);
            this.addChild(this.icon);
            this.updateDisplay();
        }

        if (this.icon.icon != value) this.icon.icon = value;

        return value;
    }

    override private function updateStyle():Void {
        this.updateDisplay();
    }

}