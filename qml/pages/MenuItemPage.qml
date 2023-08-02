import QtQuick
import Felgo

AppPage {

    property url imageSource
    property string title
    property string ingredients
    property string price
    property string portionSize
    property int portionsNumber: 1

    AppFlickable {
        anchors.fill: parent
        contentHeight: contentCol.height


        Column {
            id: contentCol
            width: parent.width
            spacing: dp(50)

            AppImage {
                width: parent.width
                fillMode: Image.PreserveAspectFit
                source: Qt.resolvedUrl(imageSource)
            }

            Column {
                width: parent.width
                AppText {
                    text: qsTr(title)
                    fontSize: dp(22)
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    width: parent.width - defaultPadding * 2
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                AppText {
                    text: qsTr("%1$").arg(price)
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                }
            }

            AppText {
                text: qsTr("%1 (%2)").arg(ingredients).arg(portionSize)
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                width: parent.width - defaultPadding * 2
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }


            Column {
                width: parent.width - defaultPadding * 2
                anchors.horizontalCenter: parent.horizontalCenter

                AppText {
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    text: qsTr("Comments")
                    color: "black"
                }

                AppTextField {
                    width: parent.width
                    radius: dp(5)
                    borderColor: "black"
                    borderWidth: dp(1)
                    textColor: "black"
                    anchors.horizontalCenter: parent.horizontalCenter
                    selectionColor: Theme.colors.secondaryTextColor
                    leftPadding: dp(15)
                    rightPadding: dp(15)
                }
            }

            Item {
                width: parent.width - defaultPadding * 2
                height: dp(100)
                anchors.horizontalCenter: parent.horizontalCenter

                Row {
                    id: cuantities
                    x: defaultPadding
                    spacing: dp(25)
                    AppIcon {
                        size: dp(40)
                        iconType: IconType.minuscircle
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if(portionsNumber > 0){
                                    portionsNumber--
                                }
                            }
                        }
                    }
                    AppText {
                        text: portionsNumber
                        fontSize: sp(30)
                        y: -dp(5)
                    }

                    AppIcon {
                        size: dp(40)
                        iconType: IconType.pluscircle
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                portionsNumber++
                            }
                        }

                    }
                }

                AppButton {
                    anchors {
                        right: parent.right
                        verticalCenter: cuantities.verticalCenter
                    }
                    backgroundColor: Theme.colors.textColor
                    backgroundColorPressed: Theme.colors.secondaryTextColor
                    text: qsTr("Add")
                }
            }
        }
    }
}
