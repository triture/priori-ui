package priori.ui.container.layout;

import priori.view.builder.PriBuilder;
import priori.view.PriDisplay;

class PriUIColumn extends PriUILayout {

    override private function paint():Void {
        super.paint();

        var n:Int = this.numChildren;
        if (n == 0) return;

        var s = this.getInitialValues(false);
        this.updateFlexs(s, false);
        this.updateAutoSize(s, false);

        switch (this.verticalAlign) {
            case PriUIVerticalAlignmentType.BOTTOM : s.lastPos = this.height - s.usedSpace - this.__paddingBottom;
            case PriUIVerticalAlignmentType.CENTER : s.lastPos = this.__paddingTop + (this.height - s.usedSpace - this.__paddingTop - this.__paddingBottom) / 2;
            case PriUIVerticalAlignmentType.SPACE_BETWEEN : {
                s.spaceBetween = (this.height - s.usedSpace - this.__paddingTop - this.__paddingBottom) / (n - 1);
                s.lastPos = this.__paddingTop;
            }
            case PriUIVerticalAlignmentType.SPACE_AROUND : {
                s.spaceBetween = (this.height - s.usedSpace - this.__paddingTop - this.__paddingBottom) / n;
                s.lastPos = s.spaceBetween/2 + this.__paddingTop;
            }
            case PriUIVerticalAlignmentType.SPACE_EVENLY : {
                s.spaceBetween = (this.height - s.usedSpace - this.__paddingTop - this.__paddingBottom) / (n + 1);
                s.lastPos = s.spaceBetween + this.__paddingTop;
            }
            case _ : s.lastPos = this.__paddingTop;
        }

        for (i in 0 ... n) {

            var child:PriDisplay = this.getChild(i);
            var touch:Bool = true;
            
            if (Std.is(child, PriBuilder)) {
                var cpb:PriBuilder = cast child;
                if (cpb.left != null || cpb.right != null) touch = false;
            }
            
            if (touch) {
                switch (this.horizontalAlign) {
                    case PriUIHorizontalAlignmentType.LEFT : child.x = this.__paddingLeft;
                    case PriUIHorizontalAlignmentType.RIGHT : child.maxX = this.width - this.__paddingRight;
                    case _ : child.centerX = this.width/2;
                }
            }

            child.y = s.lastPos;
            s.lastPos = child.maxY + s.spaceBetween + this.__gap;
        }
    }

}