package;

import priori.event.PriEvent;
import priori.ui.container.PriUIContainer;

@priori(
'
<priori>
    <imports>
        <priori.ui.container.layout.PriUIColumn />
        <priori.ui.container.layout.PriUIRow />
        <priori.ui.container.PriUIFlex />
    </imports>
    <view>
        <p:bgColor value="#f3f3f3" />

        <!--
        <PriUIRow left="0" right="0" height="300" gap="10">
            <PriUIColumn width="100" height="300" bgColor="#cccccc" verticalAlign="SPACE_AROUND" >
                <PriUIContainer bgColor="#FF0000" width="40" height="40" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="60" height="60" />
                <PriUIFlex bgColor="#FF00FF" width="40" height="40" />
            </PriUIColumn>

            <PriUIColumn x="100" width="100" height="300" bgColor="#cccccc" verticalAlign="SPACE_AROUND" >
                <PriUIContainer bgColor="#FF0000" width="40" height="40" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="60" height="60" />
                <PriUIFlex bgColor="#FF00FF" width="40" height="40" />
            </PriUIColumn>
        </PriUIRow>
        -->
        
        <PriUIRow left="0" right="0" height="150" gap="10">
            <PriUIColumn top="0" bottom="0" height="60" bgColor="#cccccc">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIColumn>
            <PriUIColumn top="0" bottom="0" height="60" bgColor="#cccccc" verticalAlign="TOP">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIColumn>
            <PriUIColumn top="0" bottom="0" height="60" bgColor="#cccccc" verticalAlign="BOTTOM">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIColumn>
            <PriUIColumn top="0" bottom="0" height="60" bgColor="#cccccc" horizontalAlign="LEFT">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIColumn>
            <PriUIColumn top="0" bottom="0" height="60" bgColor="#cccccc" horizontalAlign="RIGHT">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIColumn>
            <PriUIColumn top="0" bottom="0" height="60" bgColor="#cccccc" gap="3">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIColumn>
            <PriUIColumn top="0" bottom="0" height="60" bgColor="#cccccc" widthAutoSize="FIT" heightAutoSize="FIT" gap="10">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIColumn>
            <PriUIColumn top="0" bottom="0" height="60" bgColor="#cccccc" widthAutoSize="FIT" heightAutoSize="FIT" padding="10">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIColumn>
            <PriUIColumn top="0" bottom="0" height="60" bgColor="#cccccc" verticalAlign="TOP" widthAutoSize="FIT" heightAutoSize="FIT" padding="10">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIColumn>
            <PriUIColumn top="0" bottom="0" height="60" bgColor="#cccccc" verticalAlign="BOTTOM" widthAutoSize="FIT" heightAutoSize="FIT" padding="10">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIColumn>
            <PriUIColumn top="0" bottom="0" height="60" bgColor="#cccccc" horizontalAlign="LEFT" widthAutoSize="FIT" heightAutoSize="FIT" padding="10">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIColumn>
            <PriUIColumn top="0" bottom="0" height="60" bgColor="#cccccc" horizontalAlign="RIGHT" widthAutoSize="FIT" heightAutoSize="FIT" padding="10">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIColumn>
        </PriUIRow>
<!--
        <PriUIColumn top="0" bottom="0" width="150" x="160" gap="10">
            <PriUIRow left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_BETWEEN">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIRow>
            <PriUIRow left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_AROUND">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIRow>
            <PriUIRow left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_EVENLY">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIRow>

            <PriUIRow left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_BETWEEN" padding="10">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIRow>
            <PriUIRow left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_AROUND" padding="10">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIRow>
            <PriUIRow left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_EVENLY" padding="10">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIRow>
            
            <PriUIRow left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_BETWEEN" padding="10" widthAutoSize="FIT">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIRow>
            <PriUIRow left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_AROUND" padding="10" widthAutoSize="FIT">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIRow>
            <PriUIRow left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_EVENLY" padding="10" widthAutoSize="FIT">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIRow>

            <PriUIRow left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_BETWEEN" padding="10" widthAutoSize="FIT" gap="10">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIRow>
            <PriUIRow left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_AROUND" padding="10" widthAutoSize="FIT" gap="10">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIRow>
            <PriUIRow left="0" right="0" height="60" bgColor="#cccccc" horizontalAlign="SPACE_EVENLY" padding="10" widthAutoSize="FIT" gap="10">
                <PriUIContainer bgColor="#FF0000" width="30" height="30" />
                <PriUIContainer bgColor="#00FF00" width="40" height="40" />
                <PriUIContainer bgColor="#0000FF" width="20" height="20" />
                <PriUIContainer bgColor="#FF00FF" width="10" height="10" />
            </PriUIRow>

        </PriUIColumn>
        -->
    </view>
</priori>
'
)
class ColumnTests extends PriUIContainer {
    
}