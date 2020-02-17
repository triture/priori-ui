package priori.ui.container;

class PriUISquare extends PriUISpace {

    public var size(get, set):Float;

    override public function set_width(value:Float):Float {
        super.set_height(value);
        return super.set_width(value);
    }

    override public function set_height(value:Float):Float {
        super.set_width(value);
        return super.set_height(value);
    }

    private function get_size():Float return this.width;
    private function set_size(value:Float):Float {
        super.set_width(value);
        super.set_height(value);
        return value;
    }
}