package priori.ui.list;

import priori.event.PriEvent;
import priori.view.PriDisplay;
import priori.ui.container.PriUIScrollableContainer;
import priori.ui.container.PriUISpace;

class PriUIList<T> extends PriUISpace {

    @:isVar public var rowHeight(default, set):Float = 40;
    @:isVar public var data(default, set):Array<T> = [];
    @:isVar public var childClass(default, set):Class<PriUIListChild<T>>;

    private var scroller:PriUIScrollableContainer;
    private var scrollerSpacer:PriDisplay;

    private var childPool:Array<PriUIListChild<T>> = [];

    public function new() {
        super();
    }

    override private function setup():Void {

        this.scrollerSpacer = new PriDisplay();
        this.scrollerSpacer.width = 1;
        this.scrollerSpacer.alpha = 0;

        this.scroller = new PriUIScrollableContainer();
        this.scroller.addEventListener(PriEvent.SCROLL, this.onScroll);
        this.scroller.addChildList(
            [
                this.scrollerSpacer
            ]
        );

        this.addChildList(
            [
                this.scroller
            ]
        );
    }

    override private function paint():Void {

        this.scroller.width = this.width;
        this.scroller.height = this.height;

        this.updateList();
    }

    private function set_rowHeight(value:Float):Float {
        if (value == null) return value;

        this.rowHeight = value;
        this.updateList();
        return value;
    }

    private function set_data(value:Array<T>):Array<T> {
        this.data = value == null ? [] : value;
        this.updateList();
        return value;
    }

    private function set_childClass(value:Class<PriUIListChild<T>>):Class<PriUIListChild<T>> {
        if (value == null) return value;

        this.childClass = value;

        this.resetChildPool();
        this.updateList();

        return value;
    }

    private function onScroll(e:PriEvent):Void {
        this.updatePoolChildPosition();
    }

    private function updateList():Void {
        this.updateFakeScrollSize();
        this.updatePool();
        this.updatePoolChildSizes();
        this.updatePoolChildPosition();
    }

    private function updateFakeScrollSize():Void {
        var itemHeight:Float = Math.fround(this.rowHeight);

        this.scrollerSpacer.height = itemHeight * this.data.length;
    }

    private function updatePool():Void {
        var itemsNeeded:Int = this.getTotalItemsNeeded();

        if (this.childPool.length > itemsNeeded) this.removeExceedPoolItems(itemsNeeded);
        else if (itemsNeeded > this.childPool.length) this.createNewPoolItems(itemsNeeded);
    }

    inline private function getTotalItemsNeeded():Int {
        var currentHeight:Float = this.height;
        var itemHeight:Float = Math.fround(this.rowHeight);

        return Math.floor(Math.min(this.data.length, currentHeight/itemHeight + 2));
    }

    inline private function removeExceedPoolItems(itemsNeeded:Int):Void {
        var itemsToRemove = this.childPool.splice(itemsNeeded, this.childPool.length);
        this.scroller.removeChildList(itemsToRemove);
        for (item in itemsToRemove) item.kill();
    }

    inline private function createNewPoolItems(itemsNeeded:Int):Void {
        var newItemsNeeded:Int = itemsNeeded - this.childPool.length;
        var newItems:Array<PriUIListChild<T>> = [];

        for (i in 0 ... newItemsNeeded) {
            var item = this.factoryNewItem();
            newItems.push(item);
            this.childPool.push(item);
        }

        this.scroller.addChildList(newItems);
    }

    inline private function factoryNewItem():PriUIListChild<T> {
        var instance:PriUIListChild<T> = Type.createInstance(
            this.childClass == null ? PriUIListChild : this.childClass,
            []
        );
        return instance;
    }

    private function resetChildPool():Void {
        if (this.childPool.length == 0) return;

        this.scroller.removeChildList(this.childPool);

        for (item in this.childPool) item.kill();

        this.childPool = [];
    }

    private function updatePoolChildSizes():Void {
        var itemHeight:Float = Math.fround(this.rowHeight);
        var itemWidth:Float = this.scroller.width;

        for (item in this.childPool) {
            item.startBatchUpdate();

            item.width = itemWidth;
            item.height = itemHeight;

            item.endBatchUpdate();
        }
    }

    private function updatePoolChildPosition():Void {
        if (this.childPool.length == 0) return;

        var totalItems:Int = this.data == null ? 0 : this.data.length;

        var itemHeight:Float = Math.fround(this.rowHeight);
        var currentScrollPosition:Float = this.scroller.scrollY;
        var maxScrollPosition:Float = this.scroller.maxScrollY;

        var initialPosition:Int = Math.floor(currentScrollPosition / itemHeight);
        var initialIndex:Int = initialPosition % this.childPool.length;

        var currentPosition:Int = initialPosition;

        for (i in initialIndex ... this.childPool.length) {
            this.updateItem(this.childPool[i], currentPosition, totalItems, itemHeight);
            currentPosition ++;
        }

        for (i in 0 ... initialIndex) {
            this.updateItem(this.childPool[i], currentPosition, totalItems, itemHeight);
            currentPosition ++;
        }
    }

    private function updateItem(item:PriUIListChild<T>, currentPosition:Int, totalItems:Int, itemHeight:Float):Void {
        item.startBatchUpdate();

        if (currentPosition >= totalItems) {
            item.visible = false;
            item.y = 0;
        } else {
            item.visible = true;
            item.y = currentPosition * itemHeight;
            item.x = 0;
            item.data = this.data[currentPosition];
        }

        item.endBatchUpdate();
    }

}
