import QtQuick
import Felgo

Item {
    id:root

    width: childrenRect.width
    height: childrenRect.height

    property var iconType
    property var iconText
    property color iconColor: Theme.colors.textColor
    property color textColor: Theme.colors.textColor

    Column {
        spacing: dp(5)
        AppIcon {
            iconType: root.iconType
            size: dp(16)
            anchors.horizontalCenter: parent.horizontalCenter
            color: root.iconColor
        }
        AppText {
            text: root.iconText
            fontSize: sp(7)
            anchors.horizontalCenter: parent.horizontalCenter
            color: textColor
        }
    }
}
