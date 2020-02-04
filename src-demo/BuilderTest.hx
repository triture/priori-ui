package;

import priori.ui.container.PriUIContainer;

@priori('
<priori>
    <imports>
        <priori.ui.container.layout.PriUIColumn alias="Col" />
        <priori.ui.container.layout.PriUIRow alias="Row" />
        <priori.ui.container.PriUIFlex alias="Flex" />
        <priori.ui.container.PriUIContainer alias="Container" />
    </imports>
    <view>
        <p:bgColor value="#f3f3f3"/>

        <Container left="100" top="100" right="100" bottom="100" bgColor="#ffff00" >
            <Container left="0" right="0" top="0" bgColor="#00ff00" />
            <Container left="0" right="0" bottom="0" bgColor="#00ff00" />
            <Container left="0" top="0" bottom="0" bgColor="#00ff00" />
            <Container right="0" top="0" bottom="0" bgColor="#00ff00" />

            <Container left="0" top="0" bgColor="#ff0000" />
            <Container right="0" top="0" bgColor="#ff0000" />
            <Container right="0" bottom="0" bgColor="#ff0000" />
            <Container left="0" bottom="0" bgColor="#ff0000" />

            <Col left="110" top="110" right="110" bottom="110" bgColor="#0000ff" gap="10" >
                <Container bgColor="#ffff00" />
                <Container bgColor="#ffff00" />
                <Container bgColor="#ffff00" />
            </Col>

        </Container>

    </view>
</priori>
')
class BuilderTest extends PriUIContainer {
    
}