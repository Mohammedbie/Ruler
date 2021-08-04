import QtQuick 2.12
import QtQuick.Shapes 1.12

Shape {
    id: shape
    property real startX: 0
    property real startY: 0
    property real endX: 0
    property real endY: 0
    property real endsHeight: 20
    property int vertical: endY!=startY?1:0
    property int horizontal: endX!=startX?1:0
    readonly property bool isRuler: true
    width: horizontal==1?endX-startX<0?startX-endX:endX-startX:endsHeight
    height: horizontal==1?endsHeight:endY-startY<0?startY-endY:endY-startY

    ShapePath {
        id: shapePath
        strokeWidth: 1
        strokeColor: "black"
        fillColor: "transparent"
        startX: shape.startX-(endsHeight/2)*shape.vertical; startY: shape.startY-(endsHeight/2)*shape.horizontal
        PathLine { x: shape.startX+(endsHeight/2)*shape.vertical; y: shape.startY+(endsHeight/2)*shape.horizontal}
        PathLine { x: shape.startX; y: shape.startY }
        PathLine { x: shape.endX; y: shape.endY }
        PathLine { x: shape.endX-(endsHeight/2)*shape.vertical; y: shape.endY-(endsHeight/2)*shape.horizontal }
        PathLine { x: shape.endX+(endsHeight/2)*shape.vertical; y: shape.endY+(endsHeight/2)*shape.horizontal }
    }


    Text {
        id: measure
        text: (shape.horizontal==1?shape.width:shape.height)+"px"
        width: shape.width
        height: shape.height
        fontSizeMode: Text.Fit
        minimumPixelSize: 1
        font.pixelSize: 72
        x: shape.startX-(endsHeight/2)*shape.vertical
        y: shape.startY-(endsHeight/2)*shape.horizontal
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        Rectangle {
            id: textRectangle
            width: measure.contentWidth
            height: measure.contentHeight
            anchors.centerIn: measure
            z: measure.z-1
        }
    }

}
