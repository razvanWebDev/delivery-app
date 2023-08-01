import QtQuick
import Felgo

Item {
    id:root

    width: childrenRect.width
    height: childrenRect.height

    property var iconType
    property var iconText

    Column {
        AppIcon {
            iconType: root.iconType
            size: dp(16)
            anchors.horizontalCenter: parent.horizontalCenter
        }
        AppText {
            text: root.iconText
            fontSize: sp(7)
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }

}
