package priori.ui.button;

import priori.ui.style.PriUISize;
import priori.ui.style.PriUIDensity;
import priori.fontawesome.FontAwesomeIconType;
import priori.view.PriDisplay;
import priori.ui.container.layout.PriUIAutoSizeType;
import priori.ui.container.layout.PriUIColumn;
import priori.ui.icon.PriUIFontAwesomeIcon;
import priori.ui.style.PriUIDisplayType;
import priori.ui.style.PriUIEmphasis;
import priori.ui.overlay.PriUIOverlay;

class PriUIButtonMenu extends PriUIOverlay{

    public var reference:PriDisplay;
    private var buttons:Array<PriUIButtonFontAwesome>;

    private var col:PriUIColumn;


    public function new() {
        super();
    }

    override private function setup():Void {

        this.buttons = [];

        this.col = new PriUIColumn();
        this.col.left = 0;
        this.col.right = 0;
        this.col.heightAutoSize = PriUIAutoSizeType.FIT;
        this.col.gap = 5;

        this.addChildList(
            [
                this.col
            ]
        );

    }

    override private function paint():Void {

        this.height = this.col.height;

        if (this.reference != null) {
            this.maxX = this.reference.maxX;
            this.y = this.reference.y;
        }

    }


    public function addButton(label:String, icon:FontAwesomeIconType, onClick:Void->Void):PriUIButtonMenu {

        var button:PriUIButtonFontAwesome = new PriUIButtonFontAwesome();
        button.iconType = icon;
        button.autoSize = false;
        button.left = 0;
        button.right = 0;
        button.label = label;
        button.action = function():Void {
            this.close();
            onClick();
        };

        button.styleEmphasis = PriUIEmphasis.LOW;
        button.styleDisplayType = PriUIDisplayType.PRIMARY;

        this.buttons.push(button);

        this.col.addChild(button);
        this.updateDisplay();

        return this;
    }


}
