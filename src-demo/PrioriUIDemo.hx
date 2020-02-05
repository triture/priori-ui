package;

import priori.ui.app.PriUIApp;
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

@priori('
<priori>
    <includes>
        <image id="logo" path="logo/logo.png" />
    </includes>
    <routes>
        <route scene="scenes.HomeScene" route="home" />
    </routes>
    <imports>
        <priori.ui.container.layout.PriUIColumn alias="Col" />
        <priori.ui.container.layout.PriUIRow alias="Row" />
        <priori.ui.container.PriUIFlex alias="Flex" />
        <priori.ui.container.PriUIContainer alias="Container" />
    </imports>
    <view>
        <!--<Container left="0" right="0" bgColor="0x0000ff" />-->
    </view>
</priori>
')
class PrioriUIDemo extends PriUIApp {

    static public function main() new PrioriUIDemo();
    
    var colors:Array<PriUIContainer> = [];
    var rowTests:RowTests;
    var columnTests:ColumnTests;
    var builderTest:BuilderTest;

    public function new() {
        super();
    }

    override private function setup():Void {

        this.rowTests = new RowTests();
        // this.addChild(this.rowTests);

        this.columnTests = new ColumnTests();
        // this.addChild(this.columnTests);

        this.builderTest = new BuilderTest();
        this.addChild(this.builderTest);

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

        for (color in style.surface.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
            if (color == style.surface.baseColor) this.colors[this.colors.length-1].border = new PriBorderStyle().setColor(0xff0000);
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

        this.builderTest.width = this.width/2;
        this.builderTest.height = this.height;
        this.builderTest.maxX = this.width;

        
    }

}