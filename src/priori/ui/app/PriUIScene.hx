package priori.ui.app;

import priori.ui.style.PriUIDensity;
import priori.ui.event.PriUIEvent;
import priori.ui.style.PriUIStyle;
import priori.ui.style.ControllerStyle;
import priori.ui.style.PriUIType;
import priori.ui.interfaces.IPriUIStyle;
import priori.scene.view.PriSceneView;

class PriUIScene extends PriSceneView implements IPriUIStyle {
    
    @:noCompletion private var controllerStyle:ControllerStyle;
    public var style(get, set):PriUIStyle;
    public var type(get, set):PriUIType;
    public var density(get, set):PriUIDensity;
    
    public function new(data:Dynamic) {
        this.controllerStyle = new ControllerStyle(this);
        
        super(data);

        this.addEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyle);
    }

    private function onChangeStyle(e:PriUIEvent):Void this.updateStyle();

    public function isInsideContainerType():PriUIType return this.controllerStyle.isInsideContainerType();

    private function get_style():PriUIStyle return this.controllerStyle.getStyle();
    private function set_style(value:PriUIStyle):PriUIStyle {
        this.controllerStyle.setStyle(value);
        return value;
    }

    private function get_type():PriUIType return this.controllerStyle.getType();
    private function set_type(value:PriUIType):PriUIType {
        this.controllerStyle.setType(value);
        return value;
    }

    private function get_density():PriUIDensity return this.controllerStyle.getDensity();
    private function set_density(value:PriUIDensity):PriUIDensity {
        this.controllerStyle.setDesity(value);
        return value;
    }

    private function updateStyle():Void {
        if (this.type != PriUIType.NONE) {
            this.bgColor = this.type.getBackgroundSwatch(this.style).baseColor;
        }
    }
}