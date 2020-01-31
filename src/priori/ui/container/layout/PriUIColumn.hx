package priori.ui.container.layout;

class PriUIColumn extends PriUILayout {

    override private function paint():Void {
        super.paint();
        
        var lasty:Float = 0;
        var maxWidth:Float = 0;
        var totalHeight:Float = 0;
        var space:Float = 0;

        for (i in 0 ... this.numChildren) {
            maxWidth = Math.max(maxWidth, this.getChild(i).width);
            totalHeight += this.getChild(i).height;
        }

        if (this.heightAutoSize == PriUIAutoSizeType.FIT) this.height = totalHeight;
        if (this.widthAutoSize == PriUIAutoSizeType.FIT) this.width = maxWidth;

        switch (this.verticalAlign) {
            case PriUIVerticalAlignmentType.BOTTOM : lasty = this.height - totalHeight;
            case PriUIVerticalAlignmentType.CENTER : lasty = (this.height - totalHeight) / 2;
            case PriUIVerticalAlignmentType.SPACE_BETWEEN : space = (this.height - totalHeight) / (this.numChildren - 1);
            case PriUIVerticalAlignmentType.SPACE_AROUND : {
                space = (this.height - totalHeight) / this.numChildren;
                lasty = space/2;
            }
            case PriUIVerticalAlignmentType.SPACE_EVENLY : {
                space = (this.height - totalHeight) / (this.numChildren + 1);
                lasty = space;
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
            lasty = this.getChild(i).maxY + space;
        }
    }

}