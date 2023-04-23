package priori.ui.dialog;

import priori.ui.style.PriUIIntent;
import priori.ui.style.PriUIStyle;
import priori.ui.container.layout.PriUIHorizontalAlignmentType;
import priori.ui.container.layout.PriUIAutoSizeType;
import priori.ui.container.layout.PriUIRow;
import priori.ui.style.PriUIEmphasis;
import priori.ui.style.PriUIDisplayType;
import priori.ui.button.PriUIButton;
import priori.ui.text.PriUILabel;
import priori.ui.overlay.PriUIOverlay;

class AskOverlay extends PriUIOverlay {

    @:isVar public var text(default, set):String;

    private var message:PriUILabel;
    private var buttons:Array<PriUIButton>;

    private var row:PriUIRow;

    public function new() {
        super();
    }

    private function set_text(value:String):String {
        if (value == null) return value;

        this.text = value;
        this.message.text = value;

        this.updateDisplay();

        return value;
    }

    public function addButton(label:String, onClick:Void->Void, emphasis:PriUIEmphasis = PriUIEmphasis.LOW, displayType:PriUIDisplayType = PriUIDisplayType.PRIMARY):AskOverlay {
        var button:PriUIButton = new PriUIButton();
        button.label = label;
        button.action = onClick;
        button.styleEmphasis = emphasis;
        button.styleDisplayType = displayType;

        this.buttons.push(button);

        this.row.addChild(button);

        return this;
    }

    override private function setup():Void {
        this.buttons = [];

        this.message = new PriUILabel();
        this.message.styleIntent = PriUIIntent.SUBTITLE;
        this.message.autoSize = false;
        this.message.multiLine = true;

        this.row = new PriUIRow();
        this.row.gap = 10;
        this.row.horizontalAlign = PriUIHorizontalAlignmentType.RIGHT;
        this.row.heightAutoSize = PriUIAutoSizeType.FIT;

        this.addChildList(
            [
                this.message,
                this.row
            ]
        );
    }

    override private function paint():Void {

        var containerHeight:Float = 0;

        var space:Int = 20;

        this.message.x = space;
        this.message.y = space;
        this.message.width = this.width - this.message.x - space;

        this.row.x = space;
        this.row.y = this.message.maxY + space;
        this.row.width = this.width - space * 2;

        containerHeight = this.message.maxY + space;

        if (this.buttons.length > 0) {
            containerHeight = this.row.maxY + space;
        }

        this.height = containerHeight;

        if (this.parent != null) {
            this.centerX = this.parent.width/2;
            this.centerY = this.parent.height/2;
        }

    }

}
