package priori.ui.container.layout;

class PriUIRow extends PriUILayout {

    override private function paint():Void {
        super.paint();
        
        if (this.numChildren == 0) return;

        var lastx:Float = 0;
        var maxHeight:Float = 0;
        var totalWidth:Float = 0;
        var gapWidth:Float = this.gap * (this.numChildren-1);
        var spaceX:Float = 0;

        var totalWeight:Float = 0;
        var flexRef:Array<PriUIFlex> = [];

        for (i in 0 ... this.numChildren) {
            maxHeight = Math.max(maxHeight, this.getChild(i).height);
            
            if (Std.is(this.getChild(i), PriUIFlex)) {
                flexRef.push(cast this.getChild(i));
                totalWeight += flexRef[flexRef.length-1].weight;
            } else {
                totalWidth += this.getChild(i).width;
            }
        }

        totalWidth += gapWidth;

        if (flexRef.length > 0) {
            var emptySpace:Float = this.width - totalWidth - this.__paddingLeft - this.__paddingRight;
            for (flex in flexRef) {
                flex.width = emptySpace * (flex.weight/totalWeight);
                totalWidth += flex.width;
            }
        }

        if (this.heightAutoSize == PriUIAutoSizeType.FIT) this.height = maxHeight + this.__paddingTop + this.__paddingBottom;
        if (this.widthAutoSize == PriUIAutoSizeType.FIT) this.width = totalWidth + this.__paddingLeft + this.__paddingRight;

        switch (this.horizontalAlign) {
            case PriUIHorizontalAlignmentType.RIGHT : lastx = this.width - totalWidth - this.__paddingRight;
            case PriUIHorizontalAlignmentType.CENTER : lastx = (this.width - totalWidth) / 2;
            case PriUIHorizontalAlignmentType.SPACE_BETWEEN : {
                spaceX = (this.width - totalWidth - this.__paddingLeft - this.__paddingRight) / (this.numChildren - 1);
                lastx = this.__paddingLeft;
            }
            case PriUIHorizontalAlignmentType.SPACE_AROUND : {
                spaceX = (this.width - totalWidth - this.__paddingLeft - this.__paddingRight) / this.numChildren;
                lastx = spaceX/2 + this.__paddingLeft;
            }
            case PriUIHorizontalAlignmentType.SPACE_EVENLY : {
                spaceX = (this.width - totalWidth - this.__paddingLeft - this.__paddingRight) / (this.numChildren + 1);
                lastx = spaceX + this.__paddingLeft;
            }
            case _ : lastx = this.__paddingLeft;
        }
        
        for (i in 0 ... this.numChildren) {
            
            switch (this.verticalAlign) {
                case PriUIVerticalAlignmentType.TOP : this.getChild(i).y = this.__paddingTop;
                case PriUIVerticalAlignmentType.BOTTOM : this.getChild(i).maxY = this.height - this.__paddingBottom;
                case _ : this.getChild(i).centerY = this.height/2;
            }

            this.getChild(i).x = lastx;
            lastx = this.getChild(i).maxX + spaceX + this.gap;
        }
        
    }

}