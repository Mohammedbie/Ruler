import QtQuick 2.0

Item {
    anchors.fill: parent

    Component.onCompleted: {
          setupRulers(parent,[]);
    }

    function setupRulers(parentItem,horizontalLines)
    {
        for (var i = 0; i < parentItem.children.length; i++)
        {
            if(parentItem.children[i]===this || parentItem.children[i].isRuler || parentItem.children[i].isBoundingRect)
                continue;

            var cords = parentItem.mapToItem(null, parentItem.children[i].x, parentItem.children[i].y);

            var component = Qt.createComponent("Ruler.qml");
            if (component.status === Component.Ready) {
               var verticalPadding = 20;
                horizontalLines.sort(function(a, b) {
                  return b - a;
                });

               for (var y of horizontalLines)
               {
                   if(y === cords.y-verticalPadding)
                   {
                       verticalPadding += 30;
                   }
               }
               component.createObject(parent, {startX: cords.x, startY: cords.y-verticalPadding,endX:cords.x+parentItem.children[i].width,endY:cords.y-verticalPadding});
               component.createObject(parent, {startX: cords.x-20, startY: cords.y,endX:cords.x-20,endY:cords.y+parentItem.children[i].height});
               horizontalLines.push(cords.y-verticalPadding);
            }



            if(parentItem.children[i].children.length>0)
                setupRulers(parentItem.children[i],horizontalLines);
        }
    }

}
