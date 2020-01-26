package;

import priori.style.border.PriBorderStyle;
import motion.Actuate;
import priori.geom.PriColor;
import priori.ui.container.PriUIContainer;
import priori.app.PriApp;
import priori.ui.pallete.ColorSwatch;
import priori.ui.pallete.ColorPallete;

class PrioriUIDemo extends PriApp {

    static public function main() new PrioriUIDemo();
    
    var colors:Array<PriUIContainer> = [];

    public function new() {
        super();
    }

    override private function setup():Void {

        var pallete:ColorPallete = new ColorPallete();
        
        for (color in ColorSwatch.LIGHT_REFERENCE) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = PriColor.fromString(color.toHexString());
        }

        for (color in pallete.primary.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
            if (color == pallete.primary.baseColor) this.colors[this.colors.length-1].border = new PriBorderStyle().setColor(0xff0000);
        }

        for (color in pallete.secondary.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
            if (color == pallete.secondary.baseColor) this.colors[this.colors.length-1].border = new PriBorderStyle().setColor(0xff0000);
        }

        for (color in pallete.primaryAlt.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
            if (color == pallete.primaryAlt.baseColor) this.colors[this.colors.length-1].border = new PriBorderStyle().setColor(0xff0000);
        }

        for (color in pallete.secondaryAlt.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
            if (color == pallete.secondaryAlt.baseColor) this.colors[this.colors.length-1].border = new PriBorderStyle().setColor(0xff0000);
        }

        for (color in pallete.background.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
            if (color == pallete.background.baseColor) this.colors[this.colors.length-1].border = new PriBorderStyle().setColor(0xff0000);
        }

        this.addChildList(this.colors);

        this.startTween();
    }

    private function startTween():Void {

        var index:Int = Math.floor(Math.random() * this.colors.length);

        Actuate.tween(
            this.colors[index],
            0.5,
            {
                z : 12
            }
        ).onComplete(function ():Void {
            Actuate.tween(
                this.colors[index],
                0.5,
                {
                    z : 0
                }
            ).onComplete(function ():Void {
                
                this.startTween();

            }).delay(0.5);
        }).delay(0.5);
    }

    override public function paint():Void {
        var cols:Int = 7;

        for (i in 0 ... this.colors.length) {
            var item = this.colors[i];

            item.width = item.height = 50;
            item.x = 100 + (i%7 * 50);
            item.y = 100 + (Math.floor(i/7))*50;
        }
    }

}