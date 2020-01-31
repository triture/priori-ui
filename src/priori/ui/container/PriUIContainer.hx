package priori.ui.container;

import priori.event.PriEvent;
import priori.ui.style.PriUIStyle;
import priori.style.shadow.PriShadowStyle;
import priori.view.builder.PriBuilder;
import priori.ui.event.PriUIEvent;
import priori.ui.container.PriUIContainerType;

class PriUIContainer extends PriBuilder {

    @:isVar public var style(get, set):PriUIStyle;
    @:isVar public var type(get, set):PriUIContainerType;

    @:noCompletion private var _styleCache:PriUIStyle;
    @:noCompletion private var _z:Float = 0;

    public var z(get, set):Float;

    public function new() {
        super();
        this.addEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyle);
        this.updateStyle();
    }

    override public function addChildList(childList:Array<Dynamic>):Void {
        super.addChildList(childList);
        this.updateDisplay();
    }

    override public function removeChildList(childList:Array<Dynamic>):Void {
        super.removeChildList(childList);
        this.updateDisplay();
    }

    private function set_type(value:PriUIContainerType):PriUIContainerType {
        this.type = value;
        this.onChangeStyleData(null);
        return type;
    }

    private function get_type():PriUIContainerType {
        if (this.type == null) return PriUIContainerType.NONE;
        else return this.type;
    }

    private function onChangeStyleData(e:PriUIEvent) {
        this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT, true, false));
    }

    private function onChangeStyle(e:PriUIEvent):Void {
        this._styleCache = null;
        this.updateStyle();
    }

    private function updateStyle():Void {
        if (this.type != PriUIContainerType.NONE) {
            this.bgColor = this.type.getBackgroundSwatch(this.style).baseColor;
        }
    }

    private function isInsideContainerType():PriUIContainerType {
        if (this.parent == null) return PriUIContainerType.NONE;
        else if (Std.is(this.parent, PriUIContainer)) {
            var c:PriUIContainer = cast this.parent;
            if (c.type == PriUIContainerType.NONE) return c.isInsideContainerType();
            else return c.type;
        }
        
        return PriUIContainerType.NONE;
    }
    
    private function get_style():PriUIStyle {
        if (this.style == null) {
            if (this._styleCache != null) return _styleCache;
            else if (this.parent != null && Std.is(this.parent, PriUIContainer)) {
                var parent:PriUIContainer = cast this.parent;
                this._styleCache = parent.style;
            }

            if (this._styleCache == null) this._styleCache = new PriUIStyle();
            
            return _styleCache;
        }

        return this.style;
    }

    private function set_style(value:PriUIStyle):PriUIStyle {
        if (this.style != value) {
            if (this.style != null) this.style.removeEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyleData);

            this.style = value;
            
            this.style.addEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyleData);
            this.onChangeStyleData(null);
        }

        return value;
    }

    @:noCompletion
    override private function ___onAdded(e:PriEvent):Void {
        this._styleCache = null;
        super.___onAdded(e);
    }

    override private function updateDepth():Void {
        this.dh.depth = this.dh.parent.dh.depth - 1;

        this.dh.styles.set("z-index", Std.string(this.dh.depth + Math.floor(this._z)));
        if (this.dh.elementBorder != null) this.dh.elementBorder.style.zIndex = Std.string(this.dh.depth + Math.floor(this._z));
        
        this.__updateStyle();
    }

    private function get_z():Float return this._z;
    private function set_z(value:Float):Float {
        var val:Float = value;
        
        if (value == null || value < 0.1) val = 0;
        else val = value;

        if (val == this.z) return value;
        else this._z = val;

        this.dh.styles.set("z-index", Std.string(this.dh.depth + Math.floor(this._z)));
        if (this.dh.elementBorder != null) this.dh.elementBorder.style.zIndex = Std.string(this.dh.depth + Math.floor(this._z));
        
        if (val > 0) {
            // hard shadow
            var keyLight:PriShadowStyle = new PriShadowStyle()
                .setVerticalOffset(0.2 + val * 0.9)
                .setBlur(0.2 + val * 0.8 + (val*val) * 0.04)
                .setOpacity((val + 14 + val * 0.4 - (val*val*0.05)) / 100)
                .setSpread(0.3 - val * 0.1);

            // soft shadow
            var ambientLight:PriShadowStyle = new PriShadowStyle()
                .setVerticalOffset(0)
                .setBlur(val * 2)
                .setOpacity((val + 5 + val * 0.11 - (val*val*0.03)) / 100)
                .setSpread(0);

            this.shadow = [keyLight, ambientLight];
        } else {
            this.shadow = null;
        }

        return value;
    }

    override public function kill() {
        this.removeEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyle);
        this.style.removeEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyleData);
        if (this._styleCache != null) this._styleCache.removeEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyleData);
        
        this._styleCache = null;

        super.kill();
    }
}