package;

import priori.ui.text.PriUILabel;
import priori.style.border.PriBorderStyle;
import motion.Actuate;
import priori.geom.PriColor;
import priori.ui.container.PriUIContainer;
import priori.app.PriApp;
import priori.ui.style.PriUIColorSwatch;
import priori.ui.style.PriUIStyle;
import priori.ui.container.PriUISurface;
import priori.ui.container.PriUIContainerType;

class PrioriUIDemo extends PriApp {

    static public function main() new PrioriUIDemo();
    
    var colors:Array<PriUIContainer> = [];
    var rowTests:RowTests;
    var columnTests:ColumnTests;

    public function new() {
        super();
    }

    override private function setup():Void {

        var label:PriUILabel = new PriUILabel();
        label.x = 10;
        label.y = 10;
        label.text = 'Hello World';
        this.addChild(label);

        var s:PriUISurface = new PriUISurface();
        s.x = 550;
        s.y = 400;
        s.width = 150;
        s.corners = [5];
        this.addChild(s);

        haxe.Timer.delay(
            function ():Void {
                s.addChild(label);

                haxe.Timer.delay(
                    function ():Void {
                        s.type = PriUIContainerType.ERROR;
                    }, 3000
                );

            }, 3000
        );

        this.rowTests = new RowTests();
        this.addChild(this.rowTests);

        this.columnTests = new ColumnTests();
        this.addChild(this.columnTests);

        var style:PriUIStyle = new PriUIStyle();
        
        for (color in PriUIColorSwatch.LIGHT_REFERENCE) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = PriColor.fromString(color.toHexString());
        }

        for (color in style.primary.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
            if (color == style.primary.baseColor) this.colors[this.colors.length-1].border = new PriBorderStyle().setColor(0xff0000);
        }

        for (color in style.secondary.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
            if (color == style.secondary.baseColor) this.colors[this.colors.length-1].border = new PriBorderStyle().setColor(0xff0000);
        }

        for (color in style.primaryAlt.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
            if (color == style.primaryAlt.baseColor) this.colors[this.colors.length-1].border = new PriBorderStyle().setColor(0xff0000);
        }

        for (color in style.secondaryAlt.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
            if (color == style.secondaryAlt.baseColor) this.colors[this.colors.length-1].border = new PriBorderStyle().setColor(0xff0000);
        }

        for (color in style.background.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
            if (color == style.background.baseColor) this.colors[this.colors.length-1].border = new PriBorderStyle().setColor(0xff0000);
        }

        for (color in style.error.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
            if (color == style.error.baseColor) this.colors[this.colors.length-1].border = new PriBorderStyle().setColor(0xff0000);
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

        this.rowTests.width = this.width/2;
        this.rowTests.height = this.height;
        this.rowTests.right = 0;

        this.columnTests.width = this.width/2;
        this.columnTests.height = this.height;
        this.columnTests.right = 0;
    }

}