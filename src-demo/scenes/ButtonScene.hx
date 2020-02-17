package scenes;

import priori.ui.app.PriUIScene;
import priori.fontawesome.FontAwesomeIconType;

@priori('
<priori>
    <imports>
        <priori.ui.container.layout.PriUIColumn alias="Col" />
        <priori.ui.container.layout.PriUIRow alias="Row" />
        <priori.ui.container.PriUIFlex alias="Flex" />
        <priori.ui.bar.PriUIAppBar />
        <priori.ui.button.PriUIButtonFontAwesome alias="ButtonIcon" />
        <priori.ui.button.PriUIButton alias="Button" />
        <priori.ui.container.PriUISpace alias="Space" />
    </imports>

    <view>
        <Col left="0" right="0" top="0" bottom="0" verticalAlign="TOP" gap="20">
            <PriUIAppBar text="Button" id="bar"/>
            <Flex left="0" right="0">
                <Row left="0" right="0" top="0" bottom="0" >
                    <Flex top="0" bottom="0" styleDisplayType="PRIMARY">
                        <Col left="0" right="0" gap="20" heightAutoSize="FIT" clipping="${false}">
                            <Button styleEmphasis="HIGH" label="High Emphasis" />
                            <Button styleEmphasis="MEDIUM" label="Medium Emphasis" />
                            <Button styleEmphasis="LOW" label="Low Emphasis" />

                            <Space height="20" />

                            <ButtonIcon iconType="${FontAwesomeIconType.STAR}" styleEmphasis="HIGH" label="High Emphasis" />
                            <ButtonIcon iconType="${FontAwesomeIconType.STAR}" styleEmphasis="MEDIUM" label="Medium Emphasis" />
                            <ButtonIcon iconType="${FontAwesomeIconType.STAR}" styleEmphasis="LOW" label="Low Emphasis" />
                        </Col>
                    </Flex>
                    <Flex top="0" bottom="0" styleDisplayType="SECONDARY">
                        <Col left="0" right="0" gap="20" heightAutoSize="FIT" clipping="${false}">
                            <Button styleEmphasis="HIGH" label="High Emphasis" />
                            <Button styleEmphasis="MEDIUM" label="Medium Emphasis" />
                            <Button styleEmphasis="LOW" label="Low Emphasis" />
                            
                            <Space height="20" />
                            
                            <ButtonIcon iconType="${FontAwesomeIconType.STAR}" styleEmphasis="HIGH" label="High Emphasis" />
                            <ButtonIcon iconType="${FontAwesomeIconType.STAR}" styleEmphasis="MEDIUM" label="Medium Emphasis" />
                            <ButtonIcon iconType="${FontAwesomeIconType.STAR}" styleEmphasis="LOW" label="Low Emphasis" />
                        </Col>
                    </Flex>
                </Row>
            </Flex>
        </Col>
    </view>

</priori>
')
class ButtonScene extends PriUIScene {
    
    override private function setup():Void {
        
        

    }
}