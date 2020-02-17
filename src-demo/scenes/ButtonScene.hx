package scenes;

import priori.ui.app.PriUIScene;

@priori('
<priori>
    <imports>
        <priori.ui.container.layout.PriUIColumn alias="Col" />
        <priori.ui.bar.PriUIAppBar />
        <priori.ui.button.PriUIButton />
    </imports>

    <view>
        <Col left="0" right="0" top="0" bottom="0" verticalAlign="TOP" gap="20">
            <PriUIAppBar text="Button" id="bar"/>
            <Col id="col" left="0" right="0" gap="20" heightAutoSize="FIT" clipping="${false}">
                <PriUIButton styleEmphasis="HIGH" label="High Emphasis" />
                <PriUIButton styleEmphasis="MEDIUM" label="Medium Emphasis" />
                <PriUIButton styleEmphasis="LOW" label="Low Emphasis" />
            </Col>
        </Col>
    </view>

</priori>
')
class ButtonScene extends PriUIScene {
    
    override private function setup():Void {
        
        

    }
}