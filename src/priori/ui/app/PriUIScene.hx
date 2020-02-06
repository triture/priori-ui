package priori.ui.app;

import priori.ui.event.PriUIEvent;
import priori.ui.style.PriUIStyle;
import priori.ui.style.ControllerStyle;
import priori.ui.container.PriUIContainerType;
import priori.ui.interfaces.IPriUIStyle;
import priori.scene.view.PriSceneView;

class PriUIScene extends PriSceneView implements IPriUIStyle {
    
    @:noCompletion private var controllerStyle:ControllerStyle;
    @:isVar public var style(get, set):PriUIStyle;
    @:isVar public var type(get, set):PriUIContainerType;

    public function new(data:Dynamic) {
        this.controllerStyle = new ControllerStyle(this);
        
        super(data);

        this.addEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyle);
    }

    private function onChangeStyle(e:PriUIEvent):Void this.updateStyle();

    public function isInsideContainerType():PriUIContainerType return this.controllerStyle.isInsideContainerType();

    private function get_type():PriUIContainerType return this.controllerStyle.getType();
    private function set_type(value:PriUIContainerType):PriUIContainerType {
        this.controllerStyle.setType(value);
        return type;
    }

    private function get_style():PriUIStyle return this.controllerStyle.getStyle();
    private function set_style(value:PriUIStyle):PriUIStyle {
        this.controllerStyle.setStyle(value);
        return value;
    }

    private function updateStyle():Void {
        if (this.type != PriUIContainerType.NONE) {
            this.bgColor = this.type.getBackgroundSwatch(this.style).baseColor;
        }
    }
}