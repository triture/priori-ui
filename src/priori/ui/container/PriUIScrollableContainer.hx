package priori.ui.container;

import priori.event.PriTapEvent;
import priori.system.PriDeviceSystem;
import priori.system.PriDeviceBrowser;
import js.html.TouchEvent;
import priori.event.PriEvent;
import priori.event.PriMouseEvent;
import priori.system.PriDevice;
import priori.ui.interfaces.IPriUIStyle;

class PriUIScrollableContainer extends PriUISpace implements IPriUIStyle {

    @:isVar public var scroller(default, set):Bool;
    @:isVar public var scrollerX(default, set):Bool;
    @:isVar public var scrollerY(default, set):Bool;

    public var scrollY(get, set):Float;
    public var scrollX(get, set):Float;

    public var maxScrollY(get, null):Float;
    public var maxScrollX(get, null):Float;

    private var __touched:Bool;
    private var __mouseIsOver:Bool;

    private var __lastXScroll:Int = 0;
    private var __lastYScroll:Int = 0;

    public function new() {
        super();

        this.__touched = false;
        this.__mouseIsOver = false;
        this.scrollerY = true;

        this.addEventListener(PriMouseEvent.MOUSE_OVER, onOver);
        this.addEventListener(PriMouseEvent.MOUSE_OUT, onOut);

        this.addEventListener(PriEvent.ADDED_TO_APP, this.__onAddedToApp);

        if (this.dh.jselement.addEventListener != null) {

            this.dh.jselement.addEventListener('touchstart', this.__onTouchStart, true);
            this.dh.jselement.addEventListener('touchend', this.__onTouchEnd, true);
            this.dh.jselement.addEventListener('scroll', this.__onScrollUpdater, true);


        } else this.dh.jselement.onscroll = this.__onScrollUpdater;

    }

    private function __onTouchStart(e:TouchEvent):Void {
        this.__touched = true;
        this.updateScrollerByTouch();
    }

    private function __onTouchEnd(e:TouchEvent):Void {

    }

    private function __onScrollUpdater():Void {
        this.__lastXScroll = this.dh.jselement.scrollLeft;
        this.__lastYScroll = this.dh.jselement.scrollTop;
    }

    private function __onAddedToApp(e:PriEvent):Void {
        this.dh.jselement.scrollLeft = this.__lastXScroll;
        this.dh.jselement.scrollTop = this.__lastYScroll;
    }

    private function onOver(e:PriMouseEvent):Void {
        this.__mouseIsOver = true;
        this.__touched = false;
        this.updateScrollerView();
    }

    private function onOut(e:PriMouseEvent):Void {
        this.__mouseIsOver = false;
        this.__touched = false;
        this.updateScrollerView();
    }

    private function updateScrollerByTouch():Void {

        if (this.__touched) {
            if (this.scrollerX && this.scrollerY) {
                this.dh.styles.set("overflow-x", "scroll");
                this.dh.styles.set("overflow-y", "scroll");
                this.dh.styles.set("-webkit-overflow-scrolling", "touch");

            } else if (this.scrollerX) {
                this.dh.styles.set("overflow-x", "scroll");
                this.dh.styles.remove("overflow-y");
                this.dh.styles.set("-webkit-overflow-scrolling", "touch");

            } else if (this.scrollerY) {
                this.dh.styles.remove("overflow-x");
                this.dh.styles.set("overflow-y", "scroll");
                this.dh.styles.set("-webkit-overflow-scrolling", "touch");
            } else {
                this.dh.styles.set("overflow-x", "hidden");
                this.dh.styles.set("overflow-y", "hidden");
                this.dh.styles.remove("-webkit-overflow-scrolling");
            }
        }

        this.__updateStyle();
    }

    private function updateScrollerView():Void {
        if (this.__touched) return;

        var canUpdate:Bool = true;

        if (PriDevice.browser() == PriDeviceBrowser.MOZILLA) {
            /* TODO
            / esta é uma solucao temporaria para um problema que faz com que
            / a caixa de selecao de um Select seja fechada quando modificar o overflow
            / por que a lista de itens causa um mouseleave no objeto pai
            */
            if (this.getElement().find("select:focus").length > 0) canUpdate = false;
        }

        if (canUpdate) {
            if (this.__mouseIsOver) {
                if (this.scrollerX && this.scrollerY) {
                    this.dh.styles.set("overflow-x", "auto");
                    this.dh.styles.set("overflow-y", "auto");
                } else if (this.scrollerX) {
                    this.dh.styles.set("overflow-x", "auto");
                    this.dh.styles.remove("overflow-y");
                } else if (this.scrollerY) {
                    this.dh.styles.remove("overflow-x");
                    this.dh.styles.set("overflow-y", "auto");
                } else {
                    this.dh.styles.set("overflow-x", "hidden");
                    this.dh.styles.set("overflow-y", "hidden");
                }
            } else {
                this.dh.styles.set("overflow-x", "hidden");
                this.dh.styles.set("overflow-y", "hidden");
            }

            this.__updateStyle();
        }
    }


    override private function get_clipping():Bool return true;
    override private function set_clipping(value:Bool) return value;


    private function set_scrollerX(value:Bool) {
        this.scrollerX = value;
        if (this.__mouseIsOver) this.updateScrollerView();
        if (this.__touched) this.updateScrollerByTouch();

        return value;
    }

    private function set_scrollerY(value:Bool) {
        this.scrollerY = value;
        if (this.__mouseIsOver) this.updateScrollerView();
        if (this.__touched) this.updateScrollerByTouch();

        return value;
    }

    private function set_scroller(value:Bool) {
        this.scrollerX = value;
        this.scrollerY = value;
        return value;
    }


    private function get_scrollY():Float return this.dh.jselement.scrollTop;
    private function set_scrollY(value:Float) {
        this.dh.jselement.scrollTop = cast value;
        return value;
    }

    private function get_scrollX():Float return this.dh.jselement.scrollLeft;
    private function set_scrollX(value:Float) {
        this.dh.jselement.scrollLeft = cast value;
        return value;
    }

    private function get_maxScrollY():Float {
        var result:Float = this.dh.jselement.scrollHeight;
        if (result == null || Math.isNaN(result)) return 0;

        return Math.max(0, result - this.height);
    }

    private function get_maxScrollX():Float {
        var result:Float = this.dh.jselement.scrollWidth;
        if (result == null || Math.isNaN(result)) return 0;

        return Math.max(0, result - this.width);
    }

    override public function kill():Void {
        this.removeEventListener(PriEvent.ADDED_TO_APP, this.__onAddedToApp);
        super.kill();
    }

}