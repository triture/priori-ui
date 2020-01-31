package priori.ui.container.layout;

class PriUILayout extends PriUIContainer {
    
    @:isVar public var verticalAlign(default, set):PriUIVerticalAlignmentType = PriUIVerticalAlignmentType.CENTER;
    @:isVar public var horizontalAlign(default, set):PriUIHorizontalAlignmentType = PriUIHorizontalAlignmentType.CENTER;
    @:isVar public var widthAutoSize(default, set):PriUIAutoSizeType = PriUIAutoSizeType.FIXED;
    @:isVar public var heightAutoSize(default, set):PriUIAutoSizeType = PriUIAutoSizeType.FIXED;
    @:isVar public var gap(default, set):Float = 0;

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