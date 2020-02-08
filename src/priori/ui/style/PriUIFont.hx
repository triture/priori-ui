package priori.ui.style;

import priori.geom.PriColor;
import priori.style.font.PriFontStyle;
import priori.style.font.PriFontStyleWeight;
import priori.style.font.PriFontStyleVariant;

class PriUIFont {
    
    @:isVar public var weight(default, null):PriFontStyleWeight;
    @:isVar public var size(default, null):Float;
    @:isVar public var variant(default, null):PriFontStyleVariant;

    public function new(size:Float, weight:PriFontStyleWeight, variant:PriFontStyleVariant) {
        this.size = size;
        this.weight = weight;
        this.variant = variant;
    }

    public function clone():PriUIFont return new PriUIFont(this.size, this.weight, this.variant);

    public function getFontStyle(font:String, color:PriColor):PriFontStyle {
        return new PriFontStyle()
            .setFamily(font)
            .setColor(color)
            .setWeight(this.weight)
            .setVariant(this.variant);
    }
}