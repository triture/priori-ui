package priori.ui.style;

import priori.ui.style.PriUIContainerType;
import priori.view.PriDisplay;
import priori.ui.event.PriUIEvent;
import priori.ui.interfaces.IPriUIStyle;

class ControllerStyle {

    private var type:PriUIContainerType;
    private var style:PriUIStyle;
    private var density:PriUIDensity;

    private var _styleCache:PriUIStyle;

    private var o:PriDisplay;

    public function new(reference:PriDisplay) {
        this.o = reference;
    }

    public function getDensity():PriUIDensity {
        if (this.density == null) {
            if (this.o.parent == null) return PriUIDensity.DEFAULT;
            else if (Std.is(this.o.parent, IPriUIStyle)) {
                var c:IPriUIStyle = cast this.o.parent;
                return c.styleDensity;
            } else return PriUIDensity.DEFAULT;
        } else return this.density;
    }

    public function setDesity(value:PriUIDensity):Void {
        this.density = value;
        this.onChangeStyleData(null);
    }

    public function getType():PriUIContainerType {
        if (this.type == null) return PriUIContainerType.NONE;
        else return this.type;
    }

    public function setType(value:PriUIContainerType):Void {
        this.type = value;
        this.onChangeStyleData(null);
    }

    public function getStyle():PriUIStyle {
        if (this.style == null) {
            
            var parentStyle:PriUIStyle = null;

            if (this.o.parent != null && Std.is(this.o.parent, IPriUIStyle)) {
                var parent:IPriUIStyle = cast this.o.parent;
                
                parentStyle = parent.style;

                if (parentStyle != this._styleCache) {
                    this.clearCache();

                    this._styleCache = parent.style;
                    this._styleCache.addEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyleData);
                }
            }

            if (parentStyle == null) {
                this._styleCache = new PriUIStyle();
                this._styleCache.addEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyleData);
            }
            
            return _styleCache;
        }

        return this.style;
    }

    public function setStyle(value:PriUIStyle):Void {
        if (this.style != value) {
            if (this.style != null) this.style.removeEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyleData);
            
            this.clearCache();

            this.style = value;
            
            if (value != null) this.style.addEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyleData);

            this.onChangeStyleData(null);
        }
    }

    private function onChangeStyleData(e:PriUIEvent) {
        this.clearCache();
        if (this.o != null) this.o.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT, true, false));
    }

    public function clearCache():Void {
        if (this._styleCache != null) this._styleCache.removeEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyleData);
        this._styleCache = null;
    }

    public function kill():Void {
        if (this.style != null) this.style.removeEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyleData);
        this.clearCache();
        this.o = null;
    }

    public function isInsideContainerType():PriUIContainerType {
        if (this.o.parent == null) return PriUIContainerType.NONE;
        else if (Std.is(this.o.parent, IPriUIStyle)) {
            var c:IPriUIStyle = cast this.o.parent;
            if (c.styleContainerType == PriUIContainerType.NONE) return c.isInsideContainerType();
            else return c.styleContainerType;
        }
        
        return PriUIContainerType.NONE;
    }

}