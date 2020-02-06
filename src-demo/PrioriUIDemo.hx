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
import priori.ui.container.PriUIBoard;
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
        

        haxe.Timer.delay(
            function ():Void {
                
                trace('green');
                this.style.caution = new PriUIColorSwatch(0x00ff00, 10);
                
                haxe.Timer.delay(
                    function ():Void {
                        trace('blue');
                        this.style.caution = new PriUIColorSwatch(0x0000ff, 10);

                    }, 2000
                );

            }, 6000
        );

        this.rowTests = new RowTests();
        // this.addChild(this.rowTests);

        this.columnTests = new ColumnTests();
        // this.addChild(this.columnTests);

        this.builderTest = new BuilderTest();
        this.addChild(this.builderTest);

        var style:PriUIStyle = new PriUIStyle();
        
        for (color in style.primary.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
        }

        for (color in style.primaryAlt.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
        }

        for (color in style.secondary.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
        }

        for (color in style.secondaryAlt.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
        }

        for (color in style.subtle.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
        }

        for (color in style.highlight.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
        }

        // backgrounds

        for (color in style.container.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
        }

        for (color in style.board.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
        }

        for (color in style.overlay.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
        }

        for (color in style.element.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
        }

        // moods

        for (color in style.danger.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
        }

        for (color in style.caution.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
        }

        for (color in style.success.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
        }

        for (color in style.information.getScale()) {
            this.colors.push(new PriUIContainer());
            this.colors[this.colors.length-1].bgColor = color;
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
        var cols:Int = 3;

        for (i in 0 ... this.colors.length) {
            var item = this.colors[i];

            item.width = item.height = 50;
            item.x = 100 + (i%cols * 50);
            item.y = 100 + (Math.floor(i/cols))*50;
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