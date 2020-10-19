package priori.ui.dialog;

import priori.ui.container.PriUISpace;
import priori.view.PriLineHorizontal;
import priori.event.PriEvent;
import priori.ui.style.PriUIDisplayType;
import priori.ui.style.PriUIEmphasis;
import priori.ui.style.PriUIIntent;
import priori.ui.container.layout.PriUIAutoSizeType;
import priori.ui.container.layout.PriUIHorizontalAlignmentType;
import priori.ui.container.layout.PriUIColumn;
import priori.ui.container.layout.PriUIRow;
import priori.ui.button.PriUIButton;
import priori.ui.text.PriUILabel;
import priori.ui.input.PriUIInputText;
import priori.ui.overlay.PriUIOverlay;

class GenericOverlay extends PriUIOverlay {

    @:isVar public var text(default, set):String = '';

    private var message:PriUILabel;
    private var buttons:Array<PriUIButton>;

    private var line:PriLineHorizontal;
    private var row:PriUIRow;

    @:isVar public var idealWidth(default, set):Float = 850;
    @:isVar public var idealHeight(default, set):Float = 680;
    @:isVar public var autoHeight(default, set):Bool = true;

    @:isVar public var content(default, set):PriUISpace;

    public function new() {
        super();
    }

    private function set_idealWidth(value:Float):Float {
        this.idealWidth = value;
        this.updateDisplay();
        return value;
    }

    private function set_idealHeight(value:Float):Float {
        this.idealHeight = value;
        this.updateDisplay();
        return value;
    }

    private function set_autoHeight(value:Bool):Bool {
        this.autoHeight = value;
        this.updateDisplay();
        return value;
    }

    private function set_text(value:String):String {
        if (value == null) return value;

        this.text = value;
        this.message.text = value;

        this.updateDisplay();

        return value;
    }

    private function set_content(value:PriUISpace):PriUISpace {
        if (this.content == value) return value;
        else {
            if (this.content != null) {
                this.content.removeEventListener(PriEvent.RESIZE, this.onContentResize);
                this.removeChild(this.content);
                this.content = null;
            }

            this.content = value;

            if (value != null) {
                value.addEventListener(PriEvent.RESIZE, this.onContentResize);
                this.addChild(value);
            }

            this.updateDisplay();
        }

        return value;
    }

    private function onContentResize(e:PriEvent):Void this.updateDisplay();

    public function addButton(label:String, onClick:Void->Void, emphasis:PriUIEmphasis = PriUIEmphasis.LOW, displayType:PriUIDisplayType = PriUIDisplayType.PRIMARY):GenericOverlay {
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

        this.line = new PriLineHorizontal();
        this.line.lineColor = 0xf3f3f3;

        this.addChildList(
            [
                this.message,
                this.row,
                this.line
            ]
        );
    }

    override private function paint():Void {
        var space:Int = 20;

        this.preventRepaint = true;

        if (this.parent != null) {
            if (this.left == null && this.right == null) {
                var pw:Float = this.parent.width;

                this.width = Math.min((pw - space * 2), this.idealWidth);
                this.centerX = pw/2;
            }

            this.message.x = space;
            this.message.y = space;
            this.message.width = this.width - this.message.x - space;

            this.row.x = space;
            this.row.maxY = this.height - space;
            this.row.width = this.width - space * 2;

            var topSpace:Float = this.text.length == 0 ? 0 : this.message.maxY + space;
            var bottomSpace:Float = this.buttons.length == 0 ? 0 : this.row.height + space * 2;

            if (this.content != null) {
                this.content.x = 0;
                this.content.y = topSpace;
                this.content.width = this.width - this.content.x;
            }

            if (this.top == null && this.bottom == null) {
                var ph:Float = this.parent.height;

                if (this.autoHeight) {
                    this.height = (this.content != null ? this.content.height : 0) + topSpace + bottomSpace;
                } else {
                    this.height = Math.min((ph - space * 2), this.idealHeight);
                    if (this.content != null) this.content.height = this.height - topSpace - bottomSpace;
                }

                this.centerY = ph/2;
            };

            this.line.visible = (bottomSpace > 0);
            this.line.width = this.width;
            this.line.y = this.height - bottomSpace;
        }

        this.preventRepaint = false;

    }

}
