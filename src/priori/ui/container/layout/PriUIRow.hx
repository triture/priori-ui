package priori.ui.container.layout;

import priori.view.builder.PriBuilder;
import priori.view.PriDisplay;

class PriUIRow extends PriUILayout {

    override private function paint():Void {
        super.paint();
        
        var n:Int = this.numChildren;
        if (n == 0) return;

        var s = this.getInitialValues(true);
        this.updateFlexs(s, true);
        this.updateAutoSize(s, true);

        switch (this.horizontalAlign) {
            case PriUIHorizontalAlignmentType.RIGHT : s.lastPos = this.width - s.usedSpace - this.__paddingRight;
            case PriUIHorizontalAlignmentType.CENTER : s.lastPos = (this.width - s.usedSpace) / 2;
            case PriUIHorizontalAlignmentType.SPACE_BETWEEN : {
                s.spaceBetween = (this.width - s.usedSpace - this.__paddingLeft - this.__paddingRight) / (n - 1);
                s.lastPos = this.__paddingLeft;
            }
            case PriUIHorizontalAlignmentType.SPACE_AROUND : {
                s.spaceBetween = (this.width - s.usedSpace - this.__paddingLeft - this.__paddingRight) / n;
                s.lastPos = s.spaceBetween/2 + this.__paddingLeft;
            }
            case PriUIHorizontalAlignmentType.SPACE_EVENLY : {
                s.spaceBetween = (this.width - s.usedSpace - this.__paddingLeft - this.__paddingRight) / (n + 1);
                s.lastPos = s.spaceBetween + this.__paddingLeft;
            }
            case _ : s.lastPos = this.__paddingLeft;
        }
        
        for (i in 0 ... n) {
            
            var child:PriDisplay = this.getChild(i);
            var touch:Bool = true;
            
            if (Std.is(child, PriBuilder)) {
                var cpb:PriBuilder = cast child;
                if (cpb.top != null || cpb.bottom != null) touch = false;
            }

            if (touch) {
                switch (this.verticalAlign) {
                    case PriUIVerticalAlignmentType.TOP : child.y = this.__paddingTop;
                    case PriUIVerticalAlignmentType.BOTTOM : child.maxY = this.height - this.__paddingBottom;
                    case _ : child.centerY = this.height/2;
                }
            }

            child.x = s.lastPos;
            s.lastPos = child.maxX + s.spaceBetween + this.gap;
        }
        
    }

}