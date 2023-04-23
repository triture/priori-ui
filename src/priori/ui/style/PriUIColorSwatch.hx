package priori.ui.style;

import priori.geom.PriColor;

class PriUIColorSwatch {

    @:isVar public var baseColor(default, null):PriColor;
    @:isVar public var colorRotation(default, null):Float;
    
    public var color(get, null):PriColor;
    public var brighter(get, null):PriColor;
    public var darker(get, null):PriColor;

    private var scale:Array<PriColor>;
    private var grayScale:Array<PriColor>;

    public function new(baseColor:PriColor, colorRotation:Float = 0.0) {
        this.baseColor = baseColor;
        this.colorRotation = colorRotation;
    }

    public function isEqual(value:PriUIColorSwatch):Bool {
        if (value == null) return false;
        return (
            value.baseColor == this.baseColor &&
            value.colorRotation == this.colorRotation
        );
    }

    public function clone():PriUIColorSwatch return new PriUIColorSwatch(this.baseColor, this.colorRotation);

    private function get_brighter():PriColor return this.getScale()[2];
    private function get_darker():PriColor return this.getScale()[0];
    private function get_color():PriColor return this.getScale()[1];
    
    public function getColor(shade:PriUIShade):PriColor {
        return switch (shade) {
            case PriUIShade.BRIGHTER : this.brighter;
            case PriUIShade.DARKER : this.darker;
            case PriUIShade.DEFAULT : this.color;
        }
    }

    public function darken(amount:Float):PriColor return this.baseColor == null ? 0x000000 : new TinyColor(this.baseColor.toString()).darken(amount*100).toHexString();
    public function brighten(amount:Float):PriColor return this.baseColor == null ? 0x000000 : new TinyColor(this.baseColor.toString()).brighten(amount*100).toHexString();

    private function set_colorRotation(value:Float):Float {
        this.colorRotation = value;
        
        this.scale = null;
        this.grayScale = null;

        return value;
    }

    public function getScale():Array<PriColor> {
        if (this.scale != null) return this.scale.copy();
        if (this.baseColor == null) return [null, null, null];

        var result:Array<PriColor> = [];
        this.scale = result;

        var color:TinyColor;

        // darker
        color = new TinyColor(this.baseColor.toString()).spin(this.colorRotation*-1);
        
        color.darken(color.isDark() ? 10 : 10);
        if (color.toHsl().s > 0.1) color.saturate(7);
        result.push(color.toHexString());

        // basecolor
        result.push(this.baseColor);

        // brighter
        color = new TinyColor(this.baseColor.toString()).spin(this.colorRotation);
        
        color.lighten(color.isLight() ? 18 : 10);
        if (color.toHsl().s > 0.1) color.saturate(7);
        result.push(color.toHexString());
        

        return result.copy();
    }

    public function getGrayScale():Array<PriColor> {
        if (this.grayScale != null) return this.grayScale.copy();
        
        var color:Array<PriColor> = this.getScale();
        var result:Array<PriColor> = [];

        for (item in color) 
            result.push(item == null ? null : PriColor.fromString(new TinyColor(item.toString()).greyscale().toHexString()));

        this.grayScale = result.copy();

        return result;
    }

    public function isLight():Bool return this.baseColor == null ? false : new TinyColor(this.baseColor.toString()).isLight();
    public function isDark():Bool return this.baseColor == null ? false : new TinyColor(this.baseColor.toString()).isDark();

}

@:native("tinycolor")
private extern class TinyColor
{
    public function new(?color:Dynamic, ?opts:Dynamic);
    
    public function isValid():Bool;

    //String Representations
    public function toHsv():HSV;
    public function toHsvString():String;
    public function toHsl():HSL;
    public function toHslString():String;
    public function toHex(?allow3Char:Bool):String;         // ffffff
    public function toHexString(?allow3Char:Bool):String;   // #ffffff
    public function toHex8():String;
    public function toHex8String():String;
    public function toRgb():RGB;
    public function toRgbString():String;
    public function toPercentageRgb():RGB;
    public function toPercentageRgbString():String;
    public function toName():Dynamic;
    public function toFilter(?secondColor:Bool):String;
    public function toString(format:String):String;

    public function clone():TinyColor;

    public function getAlpha():Float;
    public function setAlpha(value:Float):Void;
    public function getBrightness():Int;
    public function isLight():Bool;
    public function isDark():Bool;
    public function getLuminance():Float;

    public function lighten(?amount:Float):TinyColor;   // 0 to 100
    public function brighten(?amount:Float):TinyColor;    // 0 to 100
    public function darken(?amount:Float):TinyColor;      // 0 to 100
    public function desaturate(?amount:Int):TinyColor;  // 0 to 100
    public function saturate(?amount:Int):TinyColor;    // 0 to 100
    public function greyscale():TinyColor;

    public static function fromRatio(?color:Dynamic, ?opts:Dynamic):TinyColor;
    public static function equals(?color1:Dynamic, ?color2:Dynamic):Bool;
    public static function random():TinyColor;

    public static function complement():TinyColor;

    public function spin(amount:Float):TinyColor;
    
    public static function triad():Array<TinyColor>;
    public static function tetrad():Array<TinyColor>;
    public static function splitcomplement():Array<TinyColor>;
    public static function analogous():Array<TinyColor>;
    public function monochromatic():Array<TinyColor>;
    
    public static function readability(color1:TinyColor, color2:TinyColor):Float; // contrast ratio
    public static function readable(color1:TinyColor, color2:TinyColor):Bool;
    public static function mostReadable(baseColor:Dynamic, colorList:Array<Dynamic>):TinyColor;

    public static function isReadable(color1:Dynamic, color2:Dynamic, object:ReadableObject = null):Bool;

    public static var names:Colors;
}

@:enum
private abstract ReadableLevel(String) {
    var AA = "AA";
    var AAA = "AAA";
}

private typedef ReadableObject = {
    @:optional var level:ReadableLevel;
    @:optional var size:ReadableSize;
}

@:enum
private abstract ReadableSize(String) {
    var SMALL = "small";
    var LARGE = "large";
}

private typedef RGB = 
{
    r:Float,
    g:Float,
    b:Float,
    a:Float
}

// hue, saturation, value
private typedef HSV = {
    h:Float,
    s:Float,
    v:Float,
    a:Float
}

// hue, saturation, lightness
private typedef HSL = {
    h:Float,
    s:Float,
    l:Float,
    a:Float
}

private typedef Colors = 
{
    aliceblue:String,
    antiquewhite:String,
    aqua:String,
    aquamarine:String,
    azure:String,
    beige:String,
    bisque:String,
    black:String,
    blanchedalmond:String,
    blue:String,
    blueviolet:String,
    brown:String,
    burlywood:String,
    burntsienna:String,
    cadetblue:String,
    chartreuse:String,
    chocolate:String,
    coral:String,
    cornflowerblue:String,
    cornsilk:String,
    crimson:String,
    cyan:String,
    darkblue:String,
    darkcyan:String,
    darkgoldenrod:String,
    darkgray:String,
    darkgreen:String,
    darkgrey:String,
    darkkhaki:String,
    darkmagenta:String,
    darkolivegreen:String,
    darkorange:String,
    darkorchid:String,
    darkred:String,
    darksalmon:String,
    darkseagreen:String,
    darkslateblue:String,
    darkslategray:String,
    darkslategrey:String,
    darkturquoise:String,
    darkviolet:String,
    deeppink:String,
    deepskyblue:String,
    dimgray:String,
    dimgrey:String,
    dodgerblue:String,
    firebrick:String,
    floralwhite:String,
    forestgreen:String,
    fuchsia:String,
    gainsboro:String,
    ghostwhite:String,
    gold:String,
    goldenrod:String,
    gray:String,
    green:String,
    greenyellow:String,
    grey:String,
    honeydew:String,
    hotpink:String,
    indianred:String,
    indigo:String,
    ivory:String,
    khaki:String,
    lavender:String,
    lavenderblush:String,
    lawngreen:String,
    lemonchiffon:String,
    lightblue:String,
    lightcoral:String,
    lightcyan:String,
    lightgoldenrodyellow:String,
    lightgray:String,
    lightgreen:String,
    lightgrey:String,
    lightpink:String,
    lightsalmon:String,
    lightseagreen:String,
    lightskyblue:String,
    lightslategray:String,
    lightslategrey:String,
    lightsteelblue:String,
    lightyellow:String,
    lime:String,
    limegreen:String,
    linen:String,
    magenta:String,
    maroon:String,
    mediumaquamarine:String,
    mediumblue:String,
    mediumorchid:String,
    mediumpurple:String,
    mediumseagreen:String,
    mediumslateblue:String,
    mediumspringgreen:String,
    mediumturquoise:String,
    mediumvioletred:String,
    midnightblue:String,
    mintcream:String,
    mistyrose:String,
    moccasin:String,
    navajowhite:String,
    navy:String,
    oldlace:String,
    olive:String,
    olivedrab:String,
    orange:String,
    orangered:String,
    orchid:String,
    palegoldenrod:String,
    palegreen:String,
    paleturquoise:String,
    palevioletred:String,
    papayawhip:String,
    peachpuff:String,
    peru:String,
    pink:String,
    plum:String,
    powderblue:String,
    purple:String,
    red:String,
    rosybrown:String,
    royalblue:String,
    saddlebrown:String,
    salmon:String,
    sandybrown:String,
    seagreen:String,
    seashell:String,
    sienna:String,
    silver:String,
    skyblue:String,
    slateblue:String,
    slategray:String,
    slategrey:String,
    snow:String,
    springgreen:String,
    steelblue:String,
    tan:String,
    teal:String,
    thistle:String,
    tomato:String,
    turquoise:String,
    violet:String,
    wheat:String,
    white:String,
    whitesmoke:String,
    yellow:String,
    yellowgreen:String
}