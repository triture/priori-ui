package;

import priori.ui.container.PriUIContainer;

@priori(
'
<priori>
    <imports>
        <priori.ui.container.layout.PriUIColumn alias="Col" />
        <priori.ui.container.layout.PriUIRow alias="Row" />
        <priori.ui.container.PriUIFlex alias="Flex" />
        <priori.ui.container.PriUIContainer alias="Container" />
    </imports>
    <view>
        <p:bgColor value="#f3f3f3" />

        <Row top="0" bottom="0" left="0" right="0" bgColor="0xffff00" gap="10">
            <Col top="0" bottom="0" width="150" gap="10">
                <Row left="0" right="0" height="60" bgColor="#cccccc">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" verticalAlign="TOP">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" verticalAlign="BOTTOM">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="LEFT">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="RIGHT">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" gap="3">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" widthAutoSize="FIT" heightAutoSize="FIT" gap="10">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" widthAutoSize="FIT" heightAutoSize="FIT" padding="10">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" verticalAlign="TOP" widthAutoSize="FIT" heightAutoSize="FIT" padding="10">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" verticalAlign="BOTTOM" widthAutoSize="FIT" heightAutoSize="FIT" padding="10">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="LEFT" widthAutoSize="FIT" heightAutoSize="FIT" padding="10">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="RIGHT" widthAutoSize="FIT" heightAutoSize="FIT" padding="10">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
            </Col>

            <Col top="0" bottom="0" width="150" gap="10">
                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_BETWEEN">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_AROUND">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_EVENLY">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>

                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_BETWEEN" padding="10">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_AROUND" padding="10">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_EVENLY" padding="10">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                
                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_BETWEEN" padding="10" widthAutoSize="FIT">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_AROUND" padding="10" widthAutoSize="FIT">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_EVENLY" padding="10" widthAutoSize="FIT">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>

                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_BETWEEN" padding="10" widthAutoSize="FIT" gap="10">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_AROUND" padding="10" widthAutoSize="FIT" gap="10">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_EVENLY" padding="10" widthAutoSize="FIT" gap="10">
                    <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                    <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                    <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                    <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
                </Row>
            </Col>

            <Col top="0" bottom="0" width="250" gap="10">
                <Row left="0" right="0" height="60" bgColor="#cccccc">
                    <Container bgColor="#FF0000" width="30" height="30" />
                    <Flex bgColor="#00FF00" width="40" height="40" />
                    <Flex bgColor="#0000FF" width="20" height="20" />
                    <Container bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc">
                    <Container bgColor="#FF0000" width="30" height="30" />
                    <Flex bgColor="#00FF00" width="40" height="40" weight="2" />
                    <Flex bgColor="#0000FF" width="20" height="20" />
                    <Container bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" gap="10">
                    <Container bgColor="#FF0000" width="30" height="30" />
                    <Flex bgColor="#00FF00" width="40" height="40" />
                    <Flex bgColor="#0000FF" width="20" height="20" />
                    <Container bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" gap="10" padding="10">
                    <Container bgColor="#FF0000" width="30" height="30" />
                    <Flex bgColor="#00FF00" width="40" height="40" />
                    <Flex bgColor="#0000FF" width="20" height="20" />
                    <Container bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" gap="10" padding="10" verticalAlign="TOP">
                    <Container bgColor="#FF0000" width="30" height="30" />
                    <Flex bgColor="#00FF00" width="40" height="40" />
                    <Flex bgColor="#0000FF" width="20" height="20" />
                    <Container bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" gap="10" padding="10" verticalAlign="BOTTOM">
                    <Container bgColor="#FF0000" width="30" height="30" />
                    <Flex bgColor="#00FF00" width="40" height="40" />
                    <Flex bgColor="#0000FF" width="20" height="20" />
                    <Container bgColor="#FF00FF" width="10" height="10" />
                </Row>
                <Row left="0" right="0" height="60" bgColor="#cccccc" gap="10" heightAutoSize="FIT">
                    <Container bgColor="#FF0000" width="30" height="30" />
                    <Flex bgColor="#00FF00" width="40" height="40" />
                    <Flex bgColor="#0000FF" width="20" height="20" />
                    <Container bgColor="#FF00FF" width="10" height="10" />
                </Row>
            </Col>
        </Row>
    </view>
</priori>
'
)
class RowTests extends PriUIContainer {
    
}