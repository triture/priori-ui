package scenes;

import priori.ui.style.PriUIContainerType;
import priori.ui.style.PriUIDensity;
import priori.ui.style.PriUIIntent;
import priori.ui.container.layout.PriUIAutoSizeType;
import priori.ui.style.PriUIStyle;
import priori.ui.container.PriUIFlex;
import priori.ui.container.layout.PriUIRow;
import priori.ui.style.PriUIColorSwatch;
import priori.ui.app.PriUIScene;
import priori.ui.bar.PriUIAppBar;

@priori('
<priori>
    <imports>
        <priori.ui.container.layout.PriUIColumn alias="Col" />
        <priori.ui.container.layout.PriUIRow />
        <priori.ui.container.PriUIFlex alias="Flex" />
    </imports>

    <view>
        <Col left="0" right="0" top="0" bottom="0" verticalAlign="TOP" gap="20">
            <PriUIAppBar text="Overline" id="bar"/>
            <Col id="col" left="0" right="0" heightAutoSize="FIT" />
        </Col>
    </view>

</priori>
')
class ColorScene extends PriUIScene {

    override private function setup():Void {

        var style:PriUIStyle = new PriUIStyle();
        
        var swatches:Array<PriUIColorSwatch> = [
            style.primary,
            style.primaryAlt,
            style.secondary,
            style.secondaryAlt,
            style.subtle,
            style.highlight,
            style.container,
            style.board,
            style.overlay,
            style.element,
            style.danger,
            style.caution,
            style.success,
            style.information
        ];

        var items:Array<PriUIRow> = [];

        for (swatch in swatches) items.push(this.getRow(swatch));
        
        this.col.addChildList(items);

    }
    
    private function getRow(color:PriUIColorSwatch):PriUIRow {
        var row:PriUIRow = new PriUIRow();
        
        row.heightAutoSize = PriUIAutoSizeType.FIT;
        row.width = 150;
        
        for (c in color.getScale()) {
            var f:PriUIFlex = new PriUIFlex();
            f.styleContainerType = PriUIContainerType.NONE;
            f.height = 32;
            f.bgColor = c;

            row.addChild(f);
        }

        return row;
    }
}