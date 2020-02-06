package priori.ui.app;

import priori.scene.PriSceneManager;
import priori.scene.view.PriPreloaderView;
import priori.ui.event.PriUIEvent;
import priori.ui.interfaces.IPriUIStyle;
import priori.ui.style.PriUIStyle;
import priori.ui.container.PriUIContainerType;
import priori.app.PriApp;
import priori.ui.style.ControllerStyle;

@:autoBuild(priori.view.builder.PriBuilderMacros.build())
@:autoBuild(priori.ui.macros.PriMacroUIApp.build())
class PriUIApp extends PriApp implements IPriUIStyle {

    @:noCompletion private var __delayedStart:Bool = true;

    @:noCompletion private var controllerStyle:ControllerStyle;
    @:isVar public var style(get, set):PriUIStyle;
    @:isVar public var type(get, set):PriUIContainerType;

    public var customPreloader:Class<PriPreloaderView>;

    public function new() {
        this.controllerStyle = new ControllerStyle(this);

        super();

        this.style = new PriUIStyle();
        
        this.addEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyle);
        this.type = PriUIContainerType.CONTAINER;

        this.__priAppInclude();

        PriSceneManager.use().preload(
            this.customPreloader,
            this.__on_preloader_error,
            this.__on_preloader_success
        );
    }

    public function onLoad():Void {}
    public function onError():Void {}

    override private function startApplication():Void {
        if (!__delayedStart) {
            this.__priBuilderSetup();
            this.__priBuilderPaint();
            super.startApplication();
        }
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

    @:noCompletion private function __priBuilderSetup():Void {}
    @:noCompletion private function __priBuilderPaint():Void {}
    @:noCompletion private function __priAppInclude():Void {}
    @:noCompletion private function __priAppRoutes():Void {}
    
    @:noCompletion private function __on_preloader_error():Void {}
    @:noCompletion private function __on_preloader_success():Void {
        this.__delayedStart = false;
        this.__priAppRoutes();
        this.onLoad();
        this.startApplication();
        
        PriSceneManager.singleton().navigateToCurrent();
    }

}