package scenes;

import priori.ui.container.PriUIContainerType;
import priori.ui.container.PriUISurface;
import priori.ui.text.PriUILabel;
import priori.scene.view.PriSceneView;

class HomeScene extends PriSceneView {
    
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
    }

    override private function paint():Void {
        
    }
}