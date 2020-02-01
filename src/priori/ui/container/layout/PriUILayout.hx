package priori.ui.container.layout;

class PriUILayout extends PriUIContainer {
    
    @:isVar public var verticalAlign(default, set):PriUIVerticalAlignmentType = PriUIVerticalAlignmentType.CENTER;
    @:isVar public var horizontalAlign(default, set):PriUIHorizontalAlignmentType = PriUIHorizontalAlignmentType.CENTER;
    @:isVar public var widthAutoSize(default, set):PriUIAutoSizeType = PriUIAutoSizeType.FIXED;
    @:isVar public var heightAutoSize(default, set):PriUIAutoSizeType = PriUIAutoSizeType.FIXED;
    @:isVar public var gap(default, set):Float = 0;

    public var paddingTop(get, set):Float;
    public var paddingBottom(get, set):Float;
    public var paddingLeft(get, set):Float;
    public var paddingRight(get, set):Float;
    public var paddingVertical(get, set):Float;
    public var paddingHorizontal(get, set):Float;
    public var padding(get, set):Float;

    private var __paddingTop:Float = 0;
    private var __paddingBottom:Float = 0;
    private var __paddingLeft:Float = 0;
    private var __paddingRight:Float = 0;

    private function get_padding():Float return Math.min(this.paddingVertical, this.paddingHorizontal);
    private function set_padding(value:Float):Float {
        if (value == null) return value;
        if (value != this.__paddingTop || value != this.__paddingBottom || value != this.__paddingLeft || value != this.__paddingRight) {
            this.__paddingTop = Math.max(0, value);
            this.__paddingBottom = Math.max(0, value);
            this.__paddingLeft = Math.max(0, value);
            this.__paddingRight = Math.max(0, value);
            this.updateDisplay();
        }
        return value;
    }

    private function get_paddingVertical():Float return Math.min(this.__paddingTop, this.__paddingBottom);
    private function set_paddingVertical(value:Float):Float {
        if (value == null) return value;
        if (value != this.__paddingTop || value != this.__paddingBottom) {
            this.__paddingTop = Math.max(0, value);
            this.__paddingBottom = Math.max(0, value);
            this.updateDisplay();
        }
        return value;
    }

    private function get_paddingHorizontal():Float return Math.min(this.__paddingLeft, this.__paddingRight);
    private function set_paddingHorizontal(value:Float):Float {
        if (value == null) return value;
        if (value != this.__paddingLeft || value != this.__paddingRight) {
            this.__paddingLeft = Math.max(0, value);
            this.__paddingRight = Math.max(0, value);
            this.updateDisplay();
        }
        return value;
    }

    private function get_paddingTop():Float return this.__paddingTop;
    private function set_paddingTop(value:Float):Float {
        if (value == null || value == this.__paddingTop) return value;
        this.__paddingTop = Math.max(0, value);
        this.updateDisplay();
        return value;
    }

    private function get_paddingBottom():Float return this.__paddingBottom;
    private function set_paddingBottom(value:Float):Float {
        if (value == null || value == this.__paddingBottom) return value;
        this.__paddingBottom = Math.max(0, value);
        this.updateDisplay();
        return value;
    }

    private function get_paddingLeft():Float return this.__paddingLeft;
    private function set_paddingLeft(value:Float):Float {
        if (value == null || value == this.__paddingLeft) return value;
        this.__paddingLeft = Math.max(0, value);
        this.updateDisplay();
        return value;
    }

    private function get_paddingRight():Float return this.__paddingRight;
    private function set_paddingRight(value:Float):Float {
        if (value == null || value == this.__paddingRight) return value;
        this.__paddingRight = Math.max(0, value);
        this.updateDisplay();
        return value;
    }

    private function set_gap(value:Float):Float {
        if (value == null) return value;
        this.gap = value;
        this.updateDisplay();
        return value;
    }

    private function set_widthAutoSize(value:PriUIAutoSizeType):PriUIAutoSizeType {
        if (value == null) return value;
        this.widthAutoSize = value;
        this.updateDisplay();
        return value;
    }

    private function set_heightAutoSize(value:PriUIAutoSizeType):PriUIAutoSizeType {
        if (value == null) return value;
        this.heightAutoSize = value;
        this.updateDisplay();
        return value;
    }

    private function set_verticalAlign(value:PriUIVerticalAlignmentType):PriUIVerticalAlignmentType {
        if (value == null) return value;
        this.verticalAlign = value;
        this.updateDisplay();
        return value;
    }

    private function set_horizontalAlign(value:PriUIHorizontalAlignmentType):PriUIHorizontalAlignmentType {
        if (value == null) return value;
        this.horizontalAlign = value;
        this.updateDisplay();
        return value;
    }
}