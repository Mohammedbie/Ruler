import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Ruler Example!!")

    Row {
        x: 100
        y: 100
        Rectangle {
            width: 200
            height: 200

            border.color: "blue"

            Text {
                id: name
                text: qsTr("text")
                width: 100
                height: 100
                anchors.centerIn: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Image {
                id: img
                source: "qrc:/sample.jpg"
                anchors.top: name.bottom
                sourceSize.width: 100
            }
        }

        Rectangle {
            width: 20
            height: 50
            border.color: "red"
            Text {
                text: "Hello Ruler!"
            }
        }

    }


    ItemMeasurer {

    }
}
