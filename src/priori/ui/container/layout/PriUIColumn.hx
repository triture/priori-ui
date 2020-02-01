package priori.ui.container.layout;

class PriUIColumn extends PriUILayout {

    override private function paint():Void {
        super.paint();

        if (this.numChildren == 0) return;
        
        var lasty:Float = 0;
        var maxWidth:Float = 0;
        var totalHeight:Float = 0;
        var gapHeight:Float = this.gap * (this.numChildren-1);
        var spaceY:Float = 0;

        var totalWeight:Float = 0;
        var flexRef:Array<PriUIFlex> = [];

        for (i in 0 ... this.numChildren) {
            maxWidth = Math.max(maxWidth, this.getChild(i).width);
            
            if (Std.is(this.getChild(i), PriUIFlex)) {
                flexRef.push(cast this.getChild(i));
                totalWeight += flexRef[flexRef.length-1].weight;
            } else {
                totalHeight += this.getChild(i).height;
            }
        }

        totalHeight += gapHeight;

        if (flexRef.length > 0) {
            var emptySpace:Float = this.height - totalHeight;
            for (flex in flexRef) {
                flex.height = emptySpace * (flex.weight/totalWeight);
                totalHeight += flex.height;
            }
        }

        if (this.heightAutoSize == PriUIAutoSizeType.FIT) this.height = totalHeight;
        if (this.widthAutoSize == PriUIAutoSizeType.FIT) this.width = maxWidth;

        switch (this.verticalAlign) {
            case PriUIVerticalAlignmentType.BOTTOM : lasty = this.height - totalHeight;
            case PriUIVerticalAlignmentType.CENTER : lasty = (this.height - totalHeight) / 2;
            case PriUIVerticalAlignmentType.SPACE_BETWEEN : spaceY = (this.height - totalHeight) / (this.numChildren - 1);
            case PriUIVerticalAlignmentType.SPACE_AROUND : {
                spaceY = (this.height - totalHeight) / this.numChildren;
                lasty = spaceY/2;
            }
            case PriUIVerticalAlignmentType.SPACE_EVENLY : {
                spaceY = (this.height - totalHeight) / (this.numChildren + 1);
                lasty = spaceY;
            }
            case _ : lasty = 0;
        }
        
        for (i in 0 ... this.numChildren) {
            
            switch (this.horizontalAlign) {
                case PriUIHorizontalAlignmentType.LEFT : this.getChild(i).x = 0;
                case PriUIHorizontalAlignmentType.RIGHT : this.getChild(i).maxX = this.width;
                case _ : this.getChild(i).centerX = this.width/2;
            }

            this.getChild(i).y = lasty;
            lasty = this.getChild(i).maxY + spaceY + this.gap;
        }
    }

}