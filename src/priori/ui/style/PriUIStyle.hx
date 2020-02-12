package priori.ui.style;

import priori.style.font.PriFontStyleVariant;
import priori.style.font.PriFontStyleWeight;
import haxe.ds.StringMap;
import priori.event.PriEventDispatcher;
import priori.ui.event.PriUIEvent;

class PriUIStyle extends PriEventDispatcher {

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
        this.onSecondary = new PriUIColorSwatch(0xFFFFFF);
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

        this.fontHeaderBigger = new PriUIFont(24, PriFontStyleWeight.NORMAL, PriFontStyleVariant.NORMAL);
        this.fontHeaderSmaller = new PriUIFont(18, PriFontStyleWeight.THICK600, PriFontStyleVariant.NORMAL);
        this.fontSubtitleBigger = new PriUIFont(16, PriFontStyleWeight.NORMAL, PriFontStyleVariant.NORMAL);
        this.fontSubtitleSmaller = new PriUIFont(14, PriFontStyleWeight.THICK600, PriFontStyleVariant.NORMAL);
        this.fontBodyBigger = new PriUIFont(16, PriFontStyleWeight.NORMAL, PriFontStyleVariant.NORMAL);
        this.fontBodySmaller = new PriUIFont(14, PriFontStyleWeight.NORMAL, PriFontStyleVariant.NORMAL);
        this.fontButton = new PriUIFont(14, PriFontStyleWeight.THICK600, PriFontStyleVariant.SMALL_CAPS);
        this.fontCaption = new PriUIFont(12, PriFontStyleWeight.NORMAL, PriFontStyleVariant.NORMAL);
        this.fontOverline = new PriUIFont(10, PriFontStyleWeight.NORMAL, PriFontStyleVariant.SMALL_CAPS);
    }

    private function updateColor(key:String, value:PriUIColorSwatch):PriUIColorSwatch {
        if (value == null) return value;
        this.colorMap.set(key, value);
        this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
        return value;
    }

    private function setFont(key:String, value:PriUIFont):PriUIFont {
        if (value == null) return value;
        this.fontStyleMap.set(key, value);
        this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
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

    private function set_fontFamily(value:String):String {
        if (value == null) return value;
        else {
            this.fontFamily = value;
            this.dispatchEvent(new PriUIEvent(PriUIEvent.CHANGE_STYLE_EVENT));
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