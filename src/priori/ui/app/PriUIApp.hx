package priori.ui.app;

import priori.ui.style.PriUISize;
import priori.ui.style.PriUIIntent;
import priori.ui.style.PriUIDensity;
import priori.ui.style.PriUIShade;
import priori.scene.PriSceneManager;
import priori.scene.view.PriPreloaderView;
import priori.ui.event.PriUIEvent;
import priori.ui.interfaces.IPriUIStyle;
import priori.ui.style.PriUIStyle;
import priori.ui.style.PriUIContainerType;
import priori.app.PriApp;
import priori.ui.style.ControllerStyle;

@:autoBuild(priori.view.builder.PriBuilderMacros.build())
@:autoBuild(priori.ui.macros.PriMacroUIApp.build())
class PriUIApp extends PriApp implements IPriUIStyle {

    @:noCompletion private var __delayedStart:Bool = true;

    @:noCompletion private var controllerStyle:ControllerStyle;
    public var style(get, set):PriUIStyle;
    public var styleContainerType(get, set):PriUIContainerType;
    public var styleDensity(get, set):PriUIDensity;
    public var styleIntent(get, set):PriUIIntent;
    public var styleSize(get, set):PriUISize;
    public var styleShade(get, set):PriUIShade;

    public var customPreloader:Class<PriPreloaderView>;

    public function new() {
        this.controllerStyle = new ControllerStyle(this);

        super();

        this.style = new PriUIStyle();
        
        this.addEventListener(PriUIEvent.CHANGE_STYLE_EVENT, this.onChangeStyle);
        this.styleContainerType = PriUIContainerType.CONTAINER;

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

    private function get_styleShade():PriUIShade return this.controllerStyle.getShade();
    private function set_styleShade(value:PriUIShade):PriUIShade return this.controllerStyle.setShade(value);

    private function updateStyle():Void this.controllerStyle.updateBackground();
    
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