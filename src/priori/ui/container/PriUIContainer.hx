package priori.ui.container;

import priori.ui.style.PriUIEmphasis;
import priori.ui.style.PriUISize;
import priori.ui.style.PriUIIntent;
import priori.ui.style.PriUIDensity;
import priori.ui.style.PriUIShade;
import priori.event.PriEvent;
import priori.ui.style.PriUIStyle;
import priori.style.shadow.PriShadowStyle;
import priori.view.builder.PriBuilder;
import priori.ui.event.PriUIEvent;
import priori.ui.style.PriUIDisplayType;
import priori.ui.interfaces.IPriUIStyle;
import priori.ui.style.ControllerStyle;

class PriUIContainer extends PriBuilder implements IPriUIStyle {

    private var controllerStyle:ControllerStyle;

    public var style(get, set):PriUIStyle;
    public var styleDensity(get, set):PriUIDensity;
    public var styleDisplayType(get, set):PriUIDisplayType;
    public var styleIntent(get, set):PriUIIntent;
    public var styleSize(get, set):PriUISize;
    public var styleShade(get, set):PriUIShade;
    public var styleEmphasis(get, set):PriUIEmphasis;

    @:noCompletion private var _z:Float = 0;

    public var z(get, set):Float;

    public function new() {
        this.controllerStyle = new ControllerStyle(this);

        super();

        this.addEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyle);
        this.addEventListener(PriUIEvent.UPDATE_DISPLAY, this.onRequestUpdateDisplay);
        this.updateStyle();
    }

    public function getParentStyle():PriUIStyle {
        if (this.parent == null || !Std.is(this.parent, IPriUIStyle)) {
            return new PriUIStyle();
        } else {
            var ps:IPriUIStyle = cast this.parent;
            return ps.style;
        }
    }

    @:noCompletion
    override private function ___onResize(e:PriEvent):Void {
        super.___onResize(e);
        if (this.parent != null) this.parent.dispatchEvent(new PriUIEvent(PriUIEvent.UPDATE_DISPLAY));
    }

    private function onRequestUpdateDisplay(e:PriUIEvent):Void this.updateDisplay();
    
    override public function addChildList(childList:Array<Dynamic>):Void {
        super.addChildList(childList);
        this.updateDisplay();
    }

    override public function removeChildList(childList:Array<Dynamic>):Void {
        super.removeChildList(childList);
        this.updateDisplay();
    }
    
    private function get_style():PriUIStyle return this.controllerStyle.getStyle();
    private function set_style(value:PriUIStyle):PriUIStyle return this.controllerStyle.setStyle(value);

    private function get_styleDisplayType():PriUIDisplayType return this.controllerStyle.getType();
    private function set_styleDisplayType(value:PriUIDisplayType):PriUIDisplayType return this.controllerStyle.setType(value);

    private function get_styleDensity():PriUIDensity return this.controllerStyle.getDensity();
    private function set_styleDensity(value:PriUIDensity):PriUIDensity return this.controllerStyle.setDesity(value);

    private function get_styleIntent():PriUIIntent return this.controllerStyle.getIntent();
    private function set_styleIntent(value:PriUIIntent):PriUIIntent return this.controllerStyle.setIntent(value);

    private function get_styleSize():PriUISize return this.controllerStyle.getSize();
    private function set_styleSize(value:PriUISize):PriUISize return this.controllerStyle.setSize(value);

    private function onChangeStyleData(e:PriUIEvent) this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT, true, false));
    private function onChangeStyle(e:PriUIEvent):Void this.updateStyle();

    private function get_styleShade():PriUIShade return this.controllerStyle.getShade();
    private function set_styleShade(value:PriUIShade):PriUIShade return this.controllerStyle.setShade(value);

    private function get_styleEmphasis():PriUIEmphasis return this.controllerStyle.getEmphasis();
    private function set_styleEmphasis(value:PriUIEmphasis):PriUIEmphasis return this.controllerStyle.setEmphasis(value);

    private function updateStyle():Void this.controllerStyle.updateBackground();

    @:noCompletion
    override private function ___onAdded(e:PriEvent):Void {
        this.controllerStyle.broadcastChanges();
        super.___onAdded(e);
    }

    override private function updateDepth():Void {
        if (this.parent != null) {
            this.dh.depth = this.dh.parent.dh.depth - 1;

            this.dh.styles.set("z-index", Std.string(this.dh.depth + Math.floor(this._z)));
            if (this.dh.elementBorder != null) this.dh.elementBorder.style.zIndex = Std.string(this.dh.depth + Math.floor(this._z));

            this.__updateStyle();
        }
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
        this.controllerStyle.kill();
        super.kill();
    }
}