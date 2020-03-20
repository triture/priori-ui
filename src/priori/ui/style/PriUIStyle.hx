package priori.ui.style;

import priori.app.PriApp;
import priori.style.font.PriFontStyleVariant;
import priori.style.font.PriFontStyleWeight;
import haxe.ds.StringMap;
import priori.event.PriEventDispatcher;
import priori.ui.event.PriUIEvent;

class PriUIStyle extends PriEventDispatcher {

    static public var DENSITY_DEFAULT_WEIGHT(default, set):Float = 0.55;
    static public var DENSITY_COMPACT_WEIGHT(default, set):Float = 0.27;
    
    private var colorMap:StringMap<PriUIColorSwatch> = new StringMap<PriUIColorSwatch>();
    private var fontStyleMap:StringMap<PriUIFont> = new StringMap<PriUIFont>();
    
    public var primary(get, set):PriUIColorSwatch;
    public var primaryAlt(get, set):PriUIColorSwatch;
    public var secondary(get, set):PriUIColorSwatch;
    public var secondaryAlt(get, set):PriUIColorSwatch;
    public var subtle(get, set):PriUIColorSwatch;
    public var highlight(get, set):PriUIColorSwatch;
    public var container(get, set):PriUIColorSwatch;
    public var board(get, set):PriUIColorSwatch;
    public var overlay(get, set):PriUIColorSwatch;
    public var element(get, set):PriUIColorSwatch;
    public var danger(get, set):PriUIColorSwatch;
    public var caution(get, set):PriUIColorSwatch;
    public var success(get, set):PriUIColorSwatch;
    public var information(get, set):PriUIColorSwatch;
    
    public var onPrimary(get, set):PriUIColorSwatch;
    public var onSecondary(get, set):PriUIColorSwatch;
    public var onContainer(get, set):PriUIColorSwatch;
    public var onBoard(get, set):PriUIColorSwatch;
    public var onOverlay(get, set):PriUIColorSwatch;
    public var onElement(get, set):PriUIColorSwatch;
    public var onSubtle(get, set):PriUIColorSwatch;
    public var onHighlight(get, set):PriUIColorSwatch;
    public var onDanger(get, set):PriUIColorSwatch;
    public var onCaution(get, set):PriUIColorSwatch;
    public var onSuccess(get, set):PriUIColorSwatch;
    public var onInformation(get, set):PriUIColorSwatch;
    
    @:isVar public var fontFamily(default, set):String = "'Open Sans', sans-serif";

    public var fontHeaderBigger(get, set):PriUIFont;
    public var fontHeaderSmaller(get, set):PriUIFont;
    public var fontSubtitleBigger(get, set):PriUIFont;
    public var fontSubtitleSmaller(get, set):PriUIFont;
    public var fontBodyBigger(get, set):PriUIFont;
    public var fontBodySmaller(get, set):PriUIFont;
    public var fontButton(get, set):PriUIFont;
    public var fontCaption(get, set):PriUIFont;
    public var fontOverline(get, set):PriUIFont;

    public function isEqual(value:PriUIStyle):Bool {
        if (value == null) return false;
        else if (value == this) return true;
        else return (
            this.primary.isEqual(value.primary) &&
            this.primaryAlt.isEqual(value.primaryAlt) &&
            this.secondary.isEqual(value.secondary) &&
            this.secondaryAlt.isEqual(value.secondaryAlt) &&
            this.subtle.isEqual(value.subtle) &&
            this.highlight.isEqual(value.highlight) &&
            this.container.isEqual(value.container) &&
            this.board.isEqual(value.board) &&
            this.overlay.isEqual(value.overlay) &&
            this.element.isEqual(value.element) &&
            this.danger.isEqual(value.danger) &&
            this.caution.isEqual(value.caution) &&
            this.success.isEqual(value.success) &&
            this.information.isEqual(value.information) &&

            this.onPrimary.isEqual(value.onPrimary) &&
            this.onSecondary.isEqual(value.onSecondary) &&
            this.onContainer.isEqual(value.onContainer) &&
            this.onBoard.isEqual(value.onBoard) &&
            this.onOverlay.isEqual(value.onOverlay) &&
            this.onElement.isEqual(value.onElement) &&
            this.onSubtle.isEqual(value.onSubtle) &&
            this.onHighlight.isEqual(value.onHighlight) &&
            this.onDanger.isEqual(value.onDanger) &&
            this.onCaution.isEqual(value.onCaution) &&
            this.onSuccess.isEqual(value.onSuccess) &&
            this.onInformation.isEqual(value.onInformation) &&

            this.fontHeaderBigger.isEqual(value.fontHeaderBigger) &&
            this.fontHeaderSmaller.isEqual(value.fontHeaderSmaller) &&
            this.fontSubtitleBigger.isEqual(value.fontSubtitleBigger) &&
            this.fontSubtitleSmaller.isEqual(value.fontSubtitleSmaller) &&
            this.fontBodyBigger.isEqual(value.fontBodyBigger) &&
            this.fontBodySmaller.isEqual(value.fontBodySmaller) &&
            this.fontButton.isEqual(value.fontButton) &&
            this.fontCaption.isEqual(value.fontCaption) &&
            this.fontOverline.isEqual(value.fontOverline) &&

            this.fontFamily == value.fontFamily
        );
    }

    public function new() {
        super();

        this.primary = new PriUIColorSwatch(0x2D384D, 5);
        this.primaryAlt = new PriUIColorSwatch(0x635D67, -40);

        this.secondary = new PriUIColorSwatch(0xFFC400, 0);
        this.secondaryAlt = new PriUIColorSwatch(0xE1BC2A, 5);
        
        this.subtle = new PriUIColorSwatch(0xF3F4F5, 5);
        this.highlight = new PriUIColorSwatch(0x7520b5, 5);
        
        this.container = new PriUIColorSwatch(0xFFFFFF, 10);
        this.board = new PriUIColorSwatch(0xF3F4F5, 10);
        this.overlay = new PriUIColorSwatch(0xFFFFFF, 10);
        this.element = new PriUIColorSwatch(0xF5F5F5, 10);
        
        this.danger = new PriUIColorSwatch(0xB00020, 10);
        this.caution = new PriUIColorSwatch(0xFFC400, 10);
        this.success = new PriUIColorSwatch(0x648348, 10);
        this.information = new PriUIColorSwatch(0x354fb7, 5);
        
        this.onPrimary = new PriUIColorSwatch(0xFFFFFF);
        this.onSecondary = new PriUIColorSwatch(0x2D384D);
        this.onContainer = new PriUIColorSwatch(0x000000);
        this.onBoard = new PriUIColorSwatch(0x000000);
        this.onOverlay = new PriUIColorSwatch(0x000000);
        this.onElement = new PriUIColorSwatch(0x000000);
        this.onSubtle = new PriUIColorSwatch(0x000000);
        this.onHighlight = new PriUIColorSwatch(0xFFFFFF);
        this.onDanger = new PriUIColorSwatch(0xFFFFFF);
        this.onCaution = new PriUIColorSwatch(0xFFFFFF);
        this.onSuccess = new PriUIColorSwatch(0xFFFFFF);
        this.onInformation = new PriUIColorSwatch(0xFFFFFF);

        // font definitions

        this.fontHeaderBigger = new PriUIFont(20.4, PriFontStyleWeight.NORMAL, PriFontStyleVariant.NORMAL);
        this.fontHeaderSmaller = new PriUIFont(16.0, PriFontStyleWeight.THICK600, PriFontStyleVariant.NORMAL);
        this.fontSubtitleBigger = new PriUIFont(16, PriFontStyleWeight.NORMAL, PriFontStyleVariant.NORMAL);
        this.fontSubtitleSmaller = new PriUIFont(14, PriFontStyleWeight.THICK600, PriFontStyleVariant.NORMAL);
        this.fontBodyBigger = new PriUIFont(14.0, PriFontStyleWeight.NORMAL, PriFontStyleVariant.NORMAL);
        this.fontBodySmaller = new PriUIFont(12.5, PriFontStyleWeight.NORMAL, PriFontStyleVariant.NORMAL);
        this.fontButton = new PriUIFont(12, PriFontStyleWeight.THICK600, PriFontStyleVariant.ALL_CAPS);
        this.fontCaption = new PriUIFont(11.0, PriFontStyleWeight.NORMAL, PriFontStyleVariant.NORMAL);
        this.fontOverline = new PriUIFont(9.0, PriFontStyleWeight.NORMAL, PriFontStyleVariant.ALL_CAPS, 1.4);
    }

    static private function set_DENSITY_COMPACT_WEIGHT(value:Float):Float {
        if (value == null || value < 0) return value;
        DENSITY_COMPACT_WEIGHT = value;
        PriApp.g().dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT, true));
        return value;
    }

    static private function set_DENSITY_DEFAULT_WEIGHT(value:Float):Float {
        if (value == null || value < 0) return value;
        DENSITY_DEFAULT_WEIGHT = value;
        PriApp.g().dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT, true));
        return value;
    }

    private function updateColor(key:String, value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;

        var old = this.colorMap.get(key);
        this.colorMap.set(key, value);
        if (!value.isEqual(old)) this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));

        return value;
    }

    private function setFont(key:String, value:PriUIFont):PriUIFont {
        if (value == null) return value;

        var old = this.fontStyleMap.get(key);
        this.fontStyleMap.set(key, value);
        if (!value.isEqual(old)) this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));

        return value;
    }

    inline private function getFont(key:String):PriUIFont return this.fontStyleMap.get(key);
    

    public function clone():PriUIStyle {
        var result:PriUIStyle = new PriUIStyle();

        result.primary = this.primary.clone();
        result.primaryAlt = this.primaryAlt.clone();
        result.secondary = this.secondary.clone();
        result.secondaryAlt = this.secondaryAlt.clone();
        result.subtle = this.subtle.clone();
        result.highlight = this.highlight.clone();
        result.container = this.container.clone();
        result.board = this.board.clone();
        result.overlay = this.overlay.clone();
        result.element = this.element.clone();
        result.danger = this.danger.clone();
        result.caution = this.caution.clone();
        result.success = this.success.clone();
        result.information = this.information.clone();
        result.onPrimary = this.onPrimary.clone();
        result.onSecondary = this.onSecondary.clone();
        result.onContainer = this.onContainer.clone();
        result.onBoard = this.onBoard.clone();
        result.onOverlay = this.onOverlay.clone();
        result.onElement = this.onElement.clone();
        result.onSubtle = this.onSubtle.clone();
        result.onHighlight = this.onHighlight.clone();
        result.onDanger = this.onDanger.clone();
        result.onCaution = this.onCaution.clone();
        result.onSuccess = this.onSuccess.clone();
        result.onInformation = this.onInformation.clone();

        result.fontFamily = this.fontFamily;

        result.fontHeaderBigger = this.fontHeaderBigger.clone();
        result.fontHeaderSmaller = this.fontHeaderSmaller.clone();
        result.fontSubtitleBigger = this.fontSubtitleBigger.clone();
        result.fontSubtitleSmaller = this.fontSubtitleSmaller.clone();
        result.fontBodyBigger = this.fontBodyBigger.clone();
        result.fontBodySmaller = this.fontBodySmaller.clone();
        result.fontButton = this.fontButton.clone();
        result.fontCaption = this.fontCaption.clone();
        result.fontOverline = this.fontOverline.clone();

        return result;
    }

    public function swatchInversion():Void {
        var c = this.clone();

        this.onPrimary = c.primary.clone();
        this.onSecondary = c.secondary.clone();
        this.onContainer = c.container.clone();
        this.onBoard = c.board.clone();
        this.onOverlay = c.overlay.clone();
        this.onElement = c.element.clone();
        this.onSubtle = c.subtle.clone();
        this.onHighlight = c.highlight.clone();
        this.onDanger = c.danger.clone();
        this.onCaution = c.caution.clone();
        this.onSuccess = c.success.clone();
        this.onInformation = c.information.clone();

        this.primary = c.onPrimary.clone();
        this.primaryAlt = c.onPrimary.clone();
        this.secondary = c.onSecondary.clone();
        this.secondaryAlt = c.onSecondary.clone();
        this.subtle = c.onSubtle.clone();
        this.highlight = c.onHighlight.clone();
        this.container = c.onContainer.clone();
        this.board = c.onBoard.clone();
        this.overlay = c.onOverlay.clone();
        this.element = c.onElement.clone();
        this.danger = c.onDanger.clone();
        this.caution = c.onCaution.clone();
        this.success = c.onSuccess.clone();
        this.information = c.onInformation.clone();
    }

    private function set_fontFamily(value:String):String {
        if (value == null) return value;
        else {
            var old = this.fontFamily;

            this.fontFamily = value;

            if (old != this.fontFamily) this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        }

        return value;
    }

    private function get_fontHeaderBigger():PriUIFont return this.getFont('header1');
    private function set_fontHeaderBigger(value:PriUIFont):PriUIFont return this.setFont('header1', value);

    private function get_fontHeaderSmaller():PriUIFont return this.getFont('header2');
    private function set_fontHeaderSmaller(value:PriUIFont):PriUIFont return this.setFont('header2', value);

    private function get_fontSubtitleBigger():PriUIFont return this.getFont('subtitle1');
    private function set_fontSubtitleBigger(value:PriUIFont):PriUIFont return this.setFont('subtitle1', value);

    private function get_fontSubtitleSmaller():PriUIFont return this.getFont('subtitle2');
    private function set_fontSubtitleSmaller(value:PriUIFont):PriUIFont return this.setFont('subtitle2', value);

    private function get_fontBodyBigger():PriUIFont return this.getFont('body1');
    private function set_fontBodyBigger(value:PriUIFont):PriUIFont return this.setFont('body1', value);

    private function get_fontBodySmaller():PriUIFont return this.getFont('body2');
    private function set_fontBodySmaller(value:PriUIFont):PriUIFont return this.setFont('body2', value);

    private function get_fontButton():PriUIFont return this.getFont('button');
    private function set_fontButton(value:PriUIFont):PriUIFont return this.setFont('button', value);

    private function get_fontCaption():PriUIFont return this.getFont('caption');
    private function set_fontCaption(value:PriUIFont):PriUIFont return this.setFont('caption', value);

    private function get_fontOverline():PriUIFont return this.getFont('overline');
    private function set_fontOverline(value:PriUIFont):PriUIFont return this.setFont('overline', value);

    private function get_board():PriUIColorSwatch return this.colorMap.get('board');
    private function set_board(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('board', value);

    private function get_container():PriUIColorSwatch return this.colorMap.get('container');
    private function set_container(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('container', value);

    private function get_overlay():PriUIColorSwatch return this.colorMap.get('overlay');
    private function set_overlay(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('overlay', value);

    private function get_element():PriUIColorSwatch return this.colorMap.get('element');
    private function set_element(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('element', value);

    private function get_primary():PriUIColorSwatch return this.colorMap.get('primary');
    private function set_primary(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('primary', value);

    private function get_primaryAlt():PriUIColorSwatch return this.colorMap.get('primaryAlt');
    private function set_primaryAlt(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('primaryAlt', value);

    private function get_secondary():PriUIColorSwatch return this.colorMap.get('secondary');
    private function set_secondary(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('secondary', value);

    private function get_secondaryAlt():PriUIColorSwatch return this.colorMap.get('secondaryAlt');
    private function set_secondaryAlt(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('secondaryAlt', value);

    private function get_onBoard():PriUIColorSwatch return this.colorMap.get('onBoard');
    private function set_onBoard(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('onBoard', value);

    private function get_onContainer():PriUIColorSwatch return this.colorMap.get('onContainer');
    private function set_onContainer(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('onContainer', value);

    private function get_onOverlay():PriUIColorSwatch return this.colorMap.get('onOverlay');
    private function set_onOverlay(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('onOverlay', value);

    private function get_onElement():PriUIColorSwatch return this.colorMap.get('onElement');
    private function set_onElement(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('onElement', value);

    private function get_onPrimary():PriUIColorSwatch return this.colorMap.get('onPrimary');
    private function set_onPrimary(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('onPrimary', value);

    private function get_onSecondary():PriUIColorSwatch return this.colorMap.get('onSecondary');
    private function set_onSecondary(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('onSecondary', value);

    private function get_danger():PriUIColorSwatch return this.colorMap.get('danger');
    private function set_danger(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('danger', value);
    
    private function get_onDanger():PriUIColorSwatch return this.colorMap.get('onDanger');
    private function set_onDanger(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('onDanger', value);
   
    private function get_caution():PriUIColorSwatch return this.colorMap.get('caution');
    private function set_caution(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('caution', value);
   
    private function get_onCaution():PriUIColorSwatch return this.colorMap.get('onCaution');
    private function set_onCaution(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('onCaution', value);
    
    private function get_success():PriUIColorSwatch return this.colorMap.get('success');
    private function set_success(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('success', value);
    
    private function get_onSuccess():PriUIColorSwatch return this.colorMap.get('onSuccess');
    private function set_onSuccess(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('onSuccess', value);
    
    private function get_information():PriUIColorSwatch return this.colorMap.get('information');
    private function set_information(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('information', value);

    private function get_onInformation():PriUIColorSwatch return this.colorMap.get('onInformation');
    private function set_onInformation(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('onInformation', value);

    private function get_subtle():PriUIColorSwatch return this.colorMap.get('subtle');
    private function set_subtle(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('subtle', value);

    private function get_onSubtle():PriUIColorSwatch return this.colorMap.get('onSubtle');
    private function set_onSubtle(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('onSubtle', value);
  
    private function get_onHighlight():PriUIColorSwatch return this.colorMap.get('onHighlight');
    private function set_onHighlight(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('onHighlight', value);

    private function get_highlight():PriUIColorSwatch return this.colorMap.get('highlight');
    private function set_highlight(value:PriUIColorSwatch):PriUIColorSwatch return this.updateColor('highlight', value);

}