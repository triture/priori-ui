package priori.ui.app;

import priori.ui.style.PriUIIntent;
import priori.ui.style.PriUISize;
import priori.ui.style.PriUIDensity;
import priori.ui.event.PriUIEvent;
import priori.ui.style.PriUIStyle;
import priori.ui.style.ControllerStyle;
import priori.ui.style.PriUIContainerType;
import priori.ui.interfaces.IPriUIStyle;
import priori.scene.view.PriSceneView;

class PriUIScene extends PriSceneView implements IPriUIStyle {
    
    @:noCompletion private var controllerStyle:ControllerStyle;
    public var style(get, set):PriUIStyle;
    public var styleContainerType(get, set):PriUIContainerType;
    public var styleDensity(get, set):PriUIDensity;
    public var styleIntent(get, set):PriUIIntent;
    public var styleSize(get, set):PriUISize;
    
    public function new(data:Dynamic) {
        this.controllerStyle = new ControllerStyle(this);
        
        super(data);

        this.addEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyle);
    }

    private function onChangeStyle(e:PriUIEvent):Void this.updateStyle();
    
    private function get_style():PriUIStyle return this.controllerStyle.getStyle();
    private function set_style(value:PriUIStyle):PriUIStyle return this.controllerStyle.setStyle(value);

    private function get_styleContainerType():PriUIContainerType return this.controllerStyle.getType();
    private function set_styleContainerType(value:PriUIContainerType):PriUIContainerType return this.controllerStyle.setType(value);

    private function get_styleDensity():PriUIDensity return this.controllerStyle.getDensity();
    private function set_styleDensity(value:PriUIDensity):PriUIDensity return this.controllerStyle.setDesity(value);

    private function get_styleIntent():PriUIIntent return this.controllerStyle.getIntent();
    private function set_styleIntent(value:PriUIIntent):PriUIIntent return this.controllerStyle.setIntent(value);

    private function get_styleSize():PriUISize return this.controllerStyle.getSize();
    private function set_styleSize(value:PriUISize):PriUISize return this.controllerStyle.setSize(value);

    private function updateStyle():Void {
        if (this.styleContainerType != PriUIContainerType.NONE) {
            this.bgColor = this.styleContainerType.getBackgroundSwatch(this.style).baseColor;
        }
    }
}