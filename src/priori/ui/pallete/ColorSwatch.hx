package priori.ui.pallete;

import priori.geom.PriColor;

class ColorSwatch {

    static public var LIGHT_REFERENCE:Array<TinyColor> = generateLight();

    @:isVar public var baseColor(default, set):PriColor;
    
    public var colorDark1(get, null):PriColor;
    public var colorDark2(get, null):PriColor;
    public var colorDark3(get, null):PriColor;
    public var centerColor(get, null):PriColor;
    public var colorBrighter1(get, null):PriColor;
    public var colorBrighter2(get, null):PriColor;
    public var colorBrighter3(get, null):PriColor;

    private var tc:TinyColor;
    private var scale:Array<PriColor>;
    private var grayScale:Array<PriColor>;

    public function new(baseColor:PriColor) {
        this.baseColor = baseColor;
    }

    private function get_colorBrighter3():PriColor return this.getScale()[6];
    private function get_colorBrighter2():PriColor return this.getScale()[5];
    private function get_colorBrighter1():PriColor return this.getScale()[4];
    private function get_centerColor():PriColor return this.getScale()[3];
    private function get_colorDark1():PriColor return this.getScale()[2];
    private function get_colorDark2():PriColor return this.getScale()[1];
    private function get_colorDark3():PriColor return this.getScale()[0];
    

    private function set_baseColor(value:PriColor):PriColor {
        if (value == null) return value;

        this.baseColor = value;
        this.tc = new TinyColor(baseColor.toString());
        
        this.scale = null;
        this.grayScale = null;
        
        return value;
    }

    private static function generateLight():Array<TinyColor> {
        var result:Array<TinyColor> = [null, null, null, new TinyColor('#808080'), null, null, null];
        
        var tc:TinyColor = new TinyColor('#808080');
        for (i in 0 ... 3) result[i + 4] = tc.lighten(13).clone();

        tc = new TinyColor('#808080');
        for (i in 0 ... 3) result[2 - i] = tc.darken(13).clone();

        return result;
    };

    public function getIndexReference(color:PriColor):Int {
        var base:TinyColor = new TinyColor(color.toString());
        var lastIndex:Int = null;
        var lastRatio:Float = null;
        
        for (i in 0 ... LIGHT_REFERENCE.length) {
            var newRatio:Float = TinyColor.readability(base, LIGHT_REFERENCE[i]);
            trace(newRatio, lastIndex, lastRatio);
            if (lastIndex == null || (lastRatio - 1) > (newRatio - 1)) {
                lastIndex = i;
                lastRatio = newRatio;
            }
        }

        return lastIndex;
    }

    public function getScale():Array<PriColor> {
        if (this.scale != null) return this.scale.copy();

        var indexStart:Int = this.getIndexReference(this.baseColor);
        var result:Array<PriColor> = [0, 0, 0, 0, 0, 0, 0];
        result[indexStart] = this.baseColor;

        trace(indexStart);

        var color:TinyColor = new TinyColor(this.baseColor.toString());

        for (i in (indexStart+1) ... 7) {
            var color:TinyColor = color.lighten(13);
            if (color.toHsl().s > 0.1) color.saturate(5);
            result[i] = PriColor.fromString(color.toHexString());
        }

        color = new TinyColor(this.baseColor.toString());

        for (i in 0 ... indexStart) {
            var color:TinyColor = color.darken(13);
            if (color.toHsl().s > 0.1) color.saturate(5);
            result[indexStart - i - 1] = PriColor.fromString(color.toHexString());
        }
        
        this.scale = result.copy();

        return result;
    }

    public function getGrayScale():Array<PriColor> {
        if (this.grayScale != null) return this.grayScale.copy();

        var color:Array<PriColor> = this.getScale();
        var result:Array<PriColor> = [];

        for (item in color) 
            result.push(PriColor.fromString(new TinyColor(item.toString()).greyscale().toHexString()));

        this.grayScale = result.copy();

        return result;
    }

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
    public function brighten(?amount:Int):TinyColor;    // 0 to 100
    public function darken(?amount:Int):TinyColor;      // 0 to 100
    public function desaturate(?amount:Int):TinyColor;  // 0 to 100
    public function saturate(?amount:Int):TinyColor;    // 0 to 100
    public function greyscale():TinyColor;

    public static function fromRatio(?color:Dynamic, ?opts:Dynamic):TinyColor;
    public static function equals(?color1:Dynamic, ?color2:Dynamic):Bool;
    public static function random():TinyColor;

    public static function complement():TinyColor;
    
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

private typedef HSV = {
    h:Float,
    s:Float,
    v:Float,
    a:Float
}

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