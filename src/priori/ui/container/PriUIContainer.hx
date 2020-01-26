package priori.ui.container;

import priori.event.PriEvent;
import priori.ui.pallete.ColorPallete;
import priori.style.shadow.PriShadowStyle;
import priori.view.builder.PriBuilder;
import priori.ui.event.PriUIEvent;

class PriUIContainer extends PriBuilder {

    @:isVar public var pallete(get, set):ColorPallete;
    
    @:noCompletion private var _palleteCache:ColorPallete;
    @:noCompletion private var _z:Float = 0;

    public var z(get, set):Float;

    public function new() {
        super();
        this.addEventListener(PriUIEvent.CHANGE_PALLETE_EVENT, this.onChangePallete);
        this.updatePallete();
    }

    private function onChangePalleteColor(e:PriUIEvent) {
        this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_PALLETE_EVENT, true, false));
    }

    private function onChangePallete(e:PriUIEvent):Void {
        this._palleteCache = null;
        this.updatePallete();
    }

    private function updatePallete():Void {

    }
    
    private function get_pallete():ColorPallete {
        if (this.pallete == null) {
            if (this._palleteCache != null) return _palleteCache;
            else if (this.parent != null && Std.is(this.parent, PriUIContainer)) {
                var parent:PriUIContainer = cast this.parent;
                this._palleteCache = parent.pallete;
            }

            if (this._palleteCache == null) this._palleteCache = new ColorPallete();
            
            return _palleteCache;
        }

        return this.pallete;
    }

    private function set_pallete(value:ColorPallete):ColorPallete {
        if (this.pallete != value) {
            if (this.pallete != null) this.pallete.removeEventListener(PriUIEvent.CHANGE_PALLETE_EVENT, this.onChangePalleteColor);

            this.pallete = value;

            this.pallete.addEventListener(PriUIEvent.CHANGE_PALLETE_EVENT, this.onChangePalleteColor);
            this.onChangePalleteColor(null);
        }

        return value;
    }

    @:noCompletion
    override private function ___onAdded(e:PriEvent):Void {
        this._palleteCache = null;
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
        this.removeEventListener(PriUIEvent.CHANGE_PALLETE_EVENT, this.onChangePallete);
        this.pallete.removeEventListener(PriUIEvent.CHANGE_PALLETE_EVENT, this.onChangePalleteColor);
        if (this._palleteCache != null) this._palleteCache.removeEventListener(PriUIEvent.CHANGE_PALLETE_EVENT, this.onChangePalleteColor);
        
        this._palleteCache = null;

        super.kill();
    }
}