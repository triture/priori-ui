package scenes;

import priori.ui.style.PriUIIntent;
import priori.ui.style.PriUIStyle;
import priori.ui.app.PriUIScene;
import priori.ui.style.PriUIDisplayType;
import priori.ui.container.PriUIBoard;
import priori.ui.text.PriUILabel;
import priori.ui.bar.PriUIAppBar;

class HomeScene extends PriUIScene {
    
    override private function setup():Void {
        
        var label:PriUILabel = new PriUILabel();
        label.x = 10;
        label.y = 10;
        label.text = 'Hello World';
        this.addChild(label);
        
        var s:PriUIBoard = new PriUIBoard();
        s.x = 550;
        s.y = 400;
        s.width = 150;
        s.corners = [5];
        this.addChild(s);

        var bar:PriUIAppBar = new PriUIAppBar();
        this.addChild(bar);
        
        haxe.Timer.delay(
            function ():Void {
                s.addChild(label);

                haxe.Timer.delay(
                    function ():Void {
                        trace('default caution orange');
                        s.styleDisplayType = PriUIDisplayType.CAUTION;


                        haxe.Timer.delay(
                            function ():Void {
                                trace('default caution orange');
                                this.style = new PriUIStyle();
                                
                                haxe.Timer.delay(
                                    function ():Void {
                                        trace('current none - app has blue as caution');
                                        this.style = null;
                                        
                                    }, 2000
                                );

                            }, 6000
                        );

                    }, 2000
                );

            }, 2000
        );
    }
    
}