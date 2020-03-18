package priori.ui.app;

import priori.ui.overlay.PriUIOverlayManager;
import priori.ui.style.PriUIEmphasis;
import priori.ui.style.PriUIIntent;
import priori.ui.style.PriUISize;
import priori.ui.style.PriUIDensity;
import priori.ui.event.PriUIEvent;
import priori.ui.style.PriUIStyle;
import priori.ui.style.PriUIShade;
import priori.ui.style.ControllerStyle;
import priori.ui.style.PriUIDisplayType;
import priori.ui.interfaces.IPriUIStyle;
import priori.scene.view.PriSceneView;

class PriUIScene extends PriSceneView implements IPriUIStyle {
    
    @:noCompletion private var controllerStyle:ControllerStyle;
    public var style(get, set):PriUIStyle;
    public var styleDisplayType(get, set):PriUIDisplayType;
    public var styleDensity(get, set):PriUIDensity;
    public var styleIntent(get, set):PriUIIntent;
    public var styleSize(get, set):PriUISize;
    public var styleShade(get, set):PriUIShade;
    public var styleEmphasis(get, set):PriUIEmphasis;

    public function new(data:Dynamic) {
        this.controllerStyle = new ControllerStyle(this);
        PriUIOverlayManager.use().closeAllOverlays();
        super(data);

        this.addEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyle);
    }

    private function onChangeStyle(e:PriUIEvent):Void this.updateStyle();
    
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

    private function get_styleShade():PriUIShade return this.controllerStyle.getShade();
    private function set_styleShade(value:PriUIShade):PriUIShade return this.controllerStyle.setShade(value);

    private function get_styleEmphasis():PriUIEmphasis return this.controllerStyle.getEmphasis();
    private function set_styleEmphasis(value:PriUIEmphasis):PriUIEmphasis return this.controllerStyle.setEmphasis(value);

    private function updateStyle():Void this.controllerStyle.updateBackground();
}