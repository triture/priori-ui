package priori.ui.list;

import priori.ui.container.PriUISpace;

class PriUIListChild<T> extends PriUISpace {

    @:isVar public var data(default, set):T;

    public function new() {
        super();
    }

    private function updateData():Void {

    }

    private function set_data(value:T):T {
        if (value == this.data) return value;

        this.data = value;
        this.updateData();
        this.updateDisplay();
        return value;
    }
}
