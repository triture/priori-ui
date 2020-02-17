package priori.ui.style;

import priori.ui.style.PriUIDisplayType;
import priori.view.PriDisplay;
import priori.ui.event.PriUIEvent;
import priori.ui.interfaces.IPriUIStyle;

class ControllerStyle {

    private var type:PriUIDisplayType;
    private var style:PriUIStyle;
    private var density:PriUIDensity;
    private var intent:PriUIIntent;
    private var size:PriUISize;
    private var shade:PriUIShade;
    private var emphasis:PriUIEmphasis;

    private var _styleCache:PriUIStyle;

    private var o:PriDisplay;

    public function new(reference:PriDisplay) {
        this.type = PriUIDisplayType.INHERIT;
        this.o = reference;
    }

    public function getSize():PriUISize {
        if (this.size == null) {
            if (this.o.parent == null) return PriUISize.SMALLER;
            else if (Std.is(this.o.parent, IPriUIStyle)) {
                var c:IPriUIStyle = cast this.o.parent;
                return c.styleSize;
            } else return PriUISize.SMALLER;
        } else return this.size;
    }

    public function setSize(value:PriUISize):PriUISize {
        this.size = value;
        this.broadcastChanges();
        return value;
    }

    public function getIntent():PriUIIntent {
        if (this.intent == null) {
            if (this.o.parent == null) return PriUIIntent.BODY;
            else if (Std.is(this.o.parent, IPriUIStyle)) {
                var c:IPriUIStyle = cast this.o.parent;
                return c.styleIntent;
            } else return PriUIIntent.BODY;
        } else return this.intent;
    }

    public function setIntent(value:PriUIIntent):PriUIIntent {
        this.intent = value;
        this.broadcastChanges();
        return value;
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

    public function setDesity(value:PriUIDensity):PriUIDensity {
        this.density = value;
        this.broadcastChanges();
        return value;
    }

    public function getEmphasis():PriUIEmphasis {
        if (this.emphasis == null) {
            if (this.o.parent == null) return PriUIEmphasis.HIGH;
            else if (Std.is(this.o.parent, IPriUIStyle)) {
                var c:IPriUIStyle = cast this.o.parent;
                return c.styleEmphasis;
            } else return PriUIEmphasis.HIGH;
        } else return this.emphasis;
    }

    public function setEmphasis(value:PriUIEmphasis):PriUIEmphasis {
        this.emphasis = value;
        this.broadcastChanges();
        return value;
    }

    // parent type must be ignored when value is NONE
    // getType() never result INHERIT value event when is explicity declared
    public function getType():PriUIDisplayType {
        if (this.type == null || this.type == PriUIDisplayType.INHERIT) {
            if (this.o.parent == null) return PriUIDisplayType.NONE;
            else if (Std.is(this.o.parent, IPriUIStyle)) {
                var c:IPriUIStyle = cast this.o.parent;
                return c.styleDisplayType;
            } else return PriUIDisplayType.NONE;
        } else return this.type;
    }

    public function setType(value:PriUIDisplayType):PriUIDisplayType {
        var v = value == null ? PriUIDisplayType.INHERIT : value;
        
        if (v != this.type) {
            this.type = v;
            this.broadcastChanges();
        }
        
        return value;
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

    public function setStyle(value:PriUIStyle):PriUIStyle {
        if (this.style != value) {
            if (this.style != null) this.style.removeEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyleData);
            
            this.clearCache();

            this.style = value;
            
            if (value != null) this.style.addEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyleData);

            this.broadcastChanges();
        }
        return value;
    }

    public function getShade():PriUIShade {
        if (this.shade == null) {
            if (this.o.parent == null) return PriUIShade.DEFAULT;
            else if (Std.is(this.o.parent, IPriUIStyle)) {
                var c:IPriUIStyle = cast this.o.parent;
                return c.styleShade;
            } else return PriUIShade.DEFAULT;
        } else return this.shade;
    }

    public function setShade(value:PriUIShade):PriUIShade {
        this.shade = value;
        this.broadcastChanges();
        return value;
    }

    public function broadcastChanges():Void this.onChangeStyleData(null);

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

    public function updateBackground():Void {
        if (this.getType() != PriUIDisplayType.NONE) {
            this.o.bgColor = this.getType().getBackgroundSwatch(this.getStyle()).getColor(this.getShade());
        }
    }

}