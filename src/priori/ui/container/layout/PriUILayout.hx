package priori.ui.container.layout;

class PriUILayout extends PriUIContainer {
    
    @:isVar public var verticalAlign(default, set):PriUIVerticalAlignmentType = PriUIVerticalAlignmentType.CENTER;
    @:isVar public var horizontalAlign(default, set):PriUIHorizontalAlignmentType = PriUIHorizontalAlignmentType.CENTER;
    @:isVar public var widthAutoSize(default, set):PriUIAutoSizeType = PriUIAutoSizeType.FIXED;
    @:isVar public var heightAutoSize(default, set):PriUIAutoSizeType = PriUIAutoSizeType.FIXED;

    private function set_widthAutoSize(value:PriUIAutoSizeType):PriUIAutoSizeType {
        this.widthAutoSize = value;
        this.updateDisplay();
        return value;
    }

    private function set_heightAutoSize(value:PriUIAutoSizeType):PriUIAutoSizeType {
        this.heightAutoSize = value;
        this.updateDisplay();
        return value;
    }

    private function set_verticalAlign(value:PriUIVerticalAlignmentType):PriUIVerticalAlignmentType {
        this.verticalAlign = value;
        this.updateDisplay();
        return value;
    }

    private function set_horizontalAlign(value:PriUIHorizontalAlignmentType):PriUIHorizontalAlignmentType {
        this.horizontalAlign = value;
        this.updateDisplay();
        return value;
    }
}