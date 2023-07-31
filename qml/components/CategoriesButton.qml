import QtQuick
import Felgo

Item {
    id: root

    width: dp(65)
    height: contentCol.height

    property bool isSelected: false
    property url iconSource
    property string btnText

    signal clicked()

    Column {
        id: contentCol
        spacing: dp(1)
        width: parent.width
        height: childrenRect.height

        AppButton {
            minimumWidth: parent.width
            minimumHeight: minimumWidth
            radius: width/2
            backgroundColor: Theme.colors.backgroundColor
            backgroundColorPressed: Theme.colors.backgroundColor
            borderColor: root.isSelected ? Theme.colors.secondaryTextColor : Theme.colors.secondaryBackgroundColor
            borderColorPressed: Theme.colors.secondaryTextColor
            borderWidth: dp(3)
            horizontalMargin: 0

            AppImage {
                anchors {
                    fill: parent
                    margins: dp(12)
                }
                fillMode: Image.PreserveAspectFit
                source: root.iconSource
            }

            onClicked: {
                root.clicked()
            }
        }

        AppText {
            text: root.btnText
            width: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            //fontSize: dp(8)
            horizontalAlignment: Text.AlignHCenter
            color: root.isSelected ? Theme.colors.secondaryTextColor : Theme.colors.backgroundColor
        }
    }
}
