package priori.ui.button;

import priori.ui.interfaces.IPriUiButton;
import priori.view.PriDisplay;
import priori.app.PriApp;
import priori.event.PriTapEvent;
import priori.event.PriFocusEvent;
import priori.event.PriEvent;
import priori.geom.PriColor;
import priori.types.PriTransitionType;
import priori.event.PriMouseEvent;
import priori.style.border.PriBorderStyle;
import priori.ui.style.PriUIShade;
import priori.ui.style.PriUIColorSwatch;
import priori.ui.style.PriUIStyle;
import priori.ui.style.PriUIDisplayType;
import priori.ui.style.PriUIEmphasis;
import priori.ui.style.PriUIIntent;
import priori.ui.container.PriUIContainer;
import priori.ui.container.PriUISquare;

@priori('
<priori>
    <view>
        <private:priori.ui.text.PriUILabel id="displayLabel" text="Hello" />
    </view>
</priori>
')
class PriUIButton extends PriUIContainer implements IPriUiButton {

    private var __tc:TapController;

    @:isVar public var icon(get, set):PriUISquare;
    @:isVar public var iconAlign(get, set):PriUIButtonIconAlignment = PriUIButtonIconAlignment.LEFT;
    @:isVar public var action(get, set):Void->Void;
    @:isVar public var floatOnHigherEmphasis(get, set):Bool = true;
    @:isVar public var autoSize(default, set):Bool = true;

    public var label(get, set):String;
    
    public function new() {
        super();

        this.__tc = new TapController(this, this.updateStyle);

        this.styleIntent = PriUIIntent.BUTTON;
        this.styleEmphasis = PriUIEmphasis.HIGH;

        this.allowTransition(PriTransitionType.BACKGROUND_COLOR, 0.2);
        
    }

    private function set_autoSize(value:Bool):Bool {
        this.autoSize = value;
        this.displayLabel.autoSize = value;
        this.updateDisplay();
        return value;
    }

    private function get_iconAlign():PriUIButtonIconAlignment return this.iconAlign;
    private function set_iconAlign(value:PriUIButtonIconAlignment):PriUIButtonIconAlignment {
        if (value == null) return value;
        this.iconAlign = value;
        this.updateDisplay();
        return value;
    }

    private function get_floatOnHigherEmphasis():Bool return this.floatOnHigherEmphasis;
    private function set_floatOnHigherEmphasis(value:Bool):Bool {
        if (value == null) return value;
        this.floatOnHigherEmphasis = value;
        this.updateStyle();
        return value;
    }

    private function get_icon():PriUISquare return this.icon;
    private function set_icon(value:PriUISquare):PriUISquare {
        var old:PriUISquare = this.icon;
        this.icon = value;

        if (value == null && old != null) {
            this.removeChild(old);
        } else if (value != old) {
            if (old != null) this.removeChild(old);
            this.addChild(value);
        }

        this.updateDisplay();

        return value;
    }

    public function executeAction():Void if (this.action != null) this.action();
    private function __onTapButton(e:PriTapEvent):Void this.executeAction();

    private function get_label():String return this.displayLabel.text;
    private function set_label(value:String):String {
        if (value == this.displayLabel.text || value == null) return value;

        this.displayLabel.text = value;
        this.updateDisplay();

        return value;
    }

    private function get_action():Void->Void return this.action;
    private function set_action(value:Void->Void):Void->Void {
        if (this.action == null && value != null) {
            this.addEventListener(PriTapEvent.TAP, this.__onTapButton);
        } else if (this.action != null && value == null) {
            this.removeEventListener(PriTapEvent.TAP, this.__onTapButton);
        }

        this.action = value;
        return value;
    }
    
    override private function setup():Void {}

    private function paintWithoutIcon(space:Int, densityValue:Float):Void {
        this.height = this.displayLabel.height + this.displayLabel.height * densityValue * 2;

        this.corners = [4];

        this.displayLabel.startBatchUpdate();
        this.displayLabel.visible = true;

        this.displayLabel.x = space;
        this.displayLabel.centerY = this.height/2 + 1;
        this.displayLabel.endBatchUpdate();

        if (this.autoSize) this.width = this.displayLabel.maxX + space;
    }

    private function paintWithoutLabel(space:Int, densityValue:Float):Void {
        this.displayLabel.visible = false;

        this.icon.size = this.displayLabel.height * 1.2;
        this.height = this.icon.size + this.icon.size * densityValue * 2;
        this.width = this.height;

        this.corners = [400];

        this.icon.centerX = this.width/2;
        this.icon.centerY = this.height/2;
    }

    override private function paint():Void {
        
        var densityValue:Float = switch (this.styleDensity) {
            case DEFAULT: PriUIStyle.DENSITY_DEFAULT_WEIGHT;
            case COMPACT: PriUIStyle.DENSITY_COMPACT_WEIGHT;
        }

        var space:Int = 18;

        if (this.icon == null) {
            this.paintWithoutIcon(space, densityValue);

        } else if (this.icon != null && this.label.length > 0) {
            
            this.height = this.displayLabel.height + this.displayLabel.height * densityValue * 2;
            this.corners = [4];

            this.displayLabel.startBatchUpdate();
            this.displayLabel.visible = true;

            this.icon.size = this.displayLabel.height * 1.1;
            this.icon.centerY = this.height/2;

            var idealWidth:Float = this.width;
            if (this.autoSize) {
                idealWidth = this.displayLabel.width + this.icon.size + space * 3;

                this.preventRepaint = true;
                this.width = idealWidth;
                this.preventRepaint = false;

            } else {
                this.displayLabel.width = this.width - space*3 - this.icon.size;
            }

            switch (this.iconAlign) {
                case PriUIButtonIconAlignment.LEFT : {
                    this.icon.x = space;
                    this.displayLabel.x = this.icon.maxX + space;
                }
                case PriUIButtonIconAlignment.RIGHT : {
                    this.icon.maxX = idealWidth - space;
                    this.displayLabel.x = space;
                }
            }

            this.displayLabel.centerY = this.height/2 + 1;
            this.displayLabel.endBatchUpdate();

        } else if (this.icon != null && this.label.length == 0) {
            this.paintWithoutLabel(space, densityValue);
        }
        
    }

    override private function updateStyle():Void {
        
        var type:PriUIDisplayType = this.styleDisplayType;
        
        if (type != PriUIDisplayType.NONE) {

            var style:PriUIStyle = this.style;
            var shade:PriUIShade = this.styleShade;

            this.startBatchUpdate();

            switch (this.styleEmphasis) {

                case PriUIEmphasis.LOW : {
                    this.z = 0;
                    
                    var bgColor:PriColor = type.getBackgroundSwatch(style).getColor(shade);
                    var fgColor:PriColor = 0xFFFFFF;
                    var overColor:PriColor = fgColor.mix(bgColor, this.__tc.isFocused ? 0.3 : 0.1);

                    this.bgColor = this.__tc.isOver || this.__tc.isFocused
                        ? overColor
                        : null
                    ;

                    var textStyle:PriUIStyle = style.clone();
                    textStyle.swatchInversion();

                    if (textStyle.onPrimary.isLight()) textStyle.onPrimary = new PriUIColorSwatch(textStyle.onPrimary.darken(0.3));
                    if (textStyle.onSecondary.isLight()) textStyle.onSecondary = new PriUIColorSwatch(textStyle.onSecondary.darken(0.3));

                    this.displayLabel.style = textStyle;

                    if (this.icon != null) this.icon.style = textStyle;

                    this.border = null;
                }
                
                case PriUIEmphasis.MEDIUM : {
                    this.z = 0;
                    
                    var bgColor:PriColor = type.getBackgroundSwatch(style).getColor(shade);
                    var fgColor:PriColor = 0xFFFFFF;
                    var overColor:PriColor = fgColor.mix(bgColor, this.__tc.isFocused ? 0.3 : 0.1);

                    this.bgColor = this.__tc.isOver || this.__tc.isFocused
                        ? overColor
                        : null
                    ;
                    
                    var textStyle:PriUIStyle = style.clone();
                    textStyle.swatchInversion();
                    this.displayLabel.style = textStyle;

                    if (this.icon != null) this.icon.style = textStyle;

                    this.border = new PriBorderStyle().setWidth(1).setColor(bgColor);
                }

                case PriUIEmphasis.HIGH : {
                    this.z = this.floatOnHigherEmphasis ? 2.5 : 0;

                    var bgColor:PriColor = type.getBackgroundSwatch(style).getColor(shade);
                    var fgColor:PriColor = type.getForegroundSwatch(style).getColor(shade);
                    var overColor:PriColor = bgColor.mix(fgColor, this.__tc.isFocused ? 0.3 : 0.1);

                    this.bgColor = this.__tc.isOver || this.__tc.isFocused
                        ? overColor
                        : bgColor
                    ;

                    this.displayLabel.style = style;
                    if (this.icon != null) this.icon.style = style;

                    this.border = null;
                }

            }
            this.endBatchUpdate();

        }
    }

    override public function kill():Void {
        this.__tc.kill();

        super.kill();
    }
}

private class TapController {
    
    public var isDown:Bool = false;
    public var isOver:Bool = false;
    public var isFocused:Bool = false;

    private var o:PriDisplay;
    private var doUpdate:Void->Void;

    public function new(display:PriDisplay, doUpdate:Void->Void) {
        this.o = display;
        this.doUpdate = doUpdate;
       
        this.o.focusable = true;

        this.initializeEvents();
    }

    private function initializeEvents():Void {
        this.o.addEventListener(PriMouseEvent.MOUSE_OVER, this.onOverIn);
        this.o.addEventListener(PriMouseEvent.MOUSE_OUT, this.onOverOut);
        
        this.o.addEventListener(PriTapEvent.TAP_DOWN, this.onDown);
        this.o.addEventListener(PriTapEvent.TOUCH_DOWN, this.onDown);
        
        this.o.addEventListener(PriFocusEvent.FOCUS_IN, this.onFocusIn);
        this.o.addEventListener(PriFocusEvent.FOCUS_OUT, this.onFocusOut);
    }

    private function onOverIn(e:PriEvent):Void {
        if (!this.isOver) {
            this.isOver = true;
            this.doUpdate();
        }
    }

    private function onOverOut(e:PriEvent):Void {
        if (this.isOver) {
            this.isOver = false;
            this.doUpdate();
        }
    }

    private function onFocusIn(e:PriEvent):Void {
        if (!this.isFocused) {
            this.isFocused = true;
            this.doUpdate();
        }
    }

    private function onFocusOut(e:PriEvent):Void {
        this.o.removeFocus();

        if (this.isFocused) {
            this.isFocused = false;
            this.doUpdate();
        }
    }

    private function onDown(e:PriEvent):Void {
        if (!this.isDown) {
            this.isDown = true;
            this.isFocused = true;
            
            PriApp.g().addEventListener(PriTapEvent.TOUCH_UP, this.onUp);
            PriApp.g().addEventListener(PriTapEvent.TAP_UP, this.onUp);

            this.doUpdate();
        }
    }

    private function onUp(e:PriEvent):Void {
        if (this.isDown) {
            this.isDown = false;

            PriApp.g().setFocus();

            haxe.Timer.delay(
                function():Void {
                    if (this.o.disabled || !this.o.hasApp()) this.isOver = false;
                    if (this.doUpdate != null) this.doUpdate();
                },
                100
            );
        }

        PriApp.g().removeEventListener(PriTapEvent.TAP_UP, this.onUp);
        PriApp.g().removeEventListener(PriTapEvent.TOUCH_UP, this.onUp);
    }

    public function kill():Void {
        this.o.removeEventListener(PriMouseEvent.MOUSE_OVER, this.onOverIn);
        this.o.removeEventListener(PriMouseEvent.MOUSE_OUT, this.onOverOut);
        
        this.o.removeEventListener(PriTapEvent.TAP_DOWN, this.onDown);
        this.o.removeEventListener(PriTapEvent.TOUCH_DOWN, this.onDown);

        this.o.removeEventListener(PriFocusEvent.FOCUS_IN, this.onFocusIn);
        this.o.removeEventListener(PriFocusEvent.FOCUS_OUT, this.onFocusOut);

        PriApp.g().removeEventListener(PriTapEvent.TAP_UP, this.onUp);
        PriApp.g().removeEventListener(PriTapEvent.TOUCH_UP, this.onUp);

        this.o = null;
        this.doUpdate = null;
    }
}