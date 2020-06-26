package priori.ui.button;

import priori.ui.container.layout.PriUIVerticalAlignmentType;
import priori.ui.style.PriUIIntent;
import priori.ui.text.PriUILabel;
import priori.ui.container.PriUIContainer;
import priori.geom.PriGeomPoint;
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

    private var buttons:Array<PriUIContainer>;

    private var col:PriUIColumn;


    public function new() {
        super();
    }

    override public function onCloseOverlay():Void {
        this.reference = null;
        super.onCloseOverlay();
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

            var global:PriGeomPoint = this.reference.localToGlobal(new PriGeomPoint(this.reference.maxX, this.reference.y));

            this.maxX = global.x;
            this.y = global.y;
        }

    }

    public function addSeparator(separatorHeight:Float = 8):PriUIButtonMenu {
        var col:PriUIColumn = new PriUIColumn();
        col.left = 0;
        col.right = 0;
        col.height = separatorHeight;

        var line:PriUIContainer = new PriUIContainer();
        line.styleDisplayType = PriUIDisplayType.PRIMARY;
        line.height = 1.5;
        line.left = 10;
        line.right = 10;

        col.addChild(line);

        this.buttons.push(col);
        this.col.addChild(col);
        this.updateDisplay();

        return this;
    }

    public function addSection(title:String):PriUIButtonMenu {

        var col:PriUIColumn = new PriUIColumn();
        col.verticalAlign = PriUIVerticalAlignmentType.BOTTOM;
        col.paddingTop = 10;
        col.paddingBottom = 0;
        col.left = 0;
        col.right = 0;
        col.heightAutoSize = PriUIAutoSizeType.FIT;

        var label:PriUILabel = new PriUILabel();
        label.styleIntent = PriUIIntent.SUBTITLE;
        label.text = title;
        label.left = 10;
        label.right = 10;
        label.autoSize = false;
        label.multiLine = true;

        col.addChild(label);

        this.buttons.push(col);
        this.col.addChild(col);
        this.updateDisplay();

        return this;
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
