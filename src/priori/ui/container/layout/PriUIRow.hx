package priori.ui.container.layout;

class PriUIRow extends PriUILayout {

    override private function paint():Void {
        super.paint();
        
        var lastx:Float = 0;
        var maxHeight:Float = 0;
        var totalWidth:Float = 0;
        var totalHeight:Float = 0;
        var spaceX:Float = 0;

        for (i in 0 ... this.numChildren) {
            maxHeight = Math.max(maxHeight, this.getChild(i).height);
            totalWidth += this.getChild(i).width;
            totalHeight += this.getChild(i).height;
        }

        if (this.heightAutoSize == PriUIAutoSizeType.FIT) this.height = maxHeight;
        if (this.widthAutoSize == PriUIAutoSizeType.FIT) this.width = totalWidth;

        switch (this.horizontalAlign) {
            case PriUIHorizontalAlignmentType.RIGHT : lastx = this.width - totalWidth;
            case PriUIHorizontalAlignmentType.CENTER : lastx = (this.width - totalWidth) / 2;
            case PriUIHorizontalAlignmentType.SPACE_BETWEEN : spaceX = (this.width - totalWidth) / (this.numChildren - 1);
            case PriUIHorizontalAlignmentType.SPACE_AROUND : {
                spaceX = (this.width - totalWidth) / this.numChildren;
                lastx = spaceX/2;
            }
            case PriUIHorizontalAlignmentType.SPACE_EVENLY : {
                spaceX = (this.width - totalWidth) / (this.numChildren + 1);
                lastx = spaceX;
            }
            case _ : lastx = 0;
        }
        
        for (i in 0 ... this.numChildren) {
            
            switch (this.verticalAlign) {
                case PriUIVerticalAlignmentType.TOP : this.getChild(i).y = 0;
                case PriUIVerticalAlignmentType.BOTTOM : this.getChild(i).maxY = this.height;
                case _ : this.getChild(i).centerY = this.height/2;
            }

            this.getChild(i).x = lastx;
            lastx = this.getChild(i).maxX + spaceX;
        }
        
    }

}