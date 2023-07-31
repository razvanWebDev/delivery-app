import QtQuick
import Felgo
import QtQuick.Controls
import "../components"

AppPage {

    title: qsTr("Delivery App")
    property string currentBtnText: qsTr("All Food")
    clip: true

    AppFlickable {
        id: mainFlickable
        height: parent.height - defaultPadding * 2
        contentHeight: mainCol.implicitHeight + placesCol.implicitHeight + defaultPadding + placesCol.anchors.topMargin
        boundsMovement: Flickable.StopAtBounds
        clip: false
        anchors {
            fill: parent
            margins: defaultPadding
        }

        Rectangle {
            id: mainColBg
            anchors {
                fill: mainCol
                topMargin: - defaultPadding * 4
                leftMargin: - defaultPadding
                rightMargin: - defaultPadding
                bottomMargin: - defaultPadding
            }
            color: Theme.colors.secondaryBackgroundColor
            radius: dp(30)
        }

        Column {
            id: mainCol

            spacing: dp(30)
            width: parent.width

            AppText {
                text: "What would you like to order?"
                width: parent.width
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                fontSize: 28
                font.bold: true
                color: Theme.colors.secondaryTextColor
            }

            Row {
                width: parent.width
                spacing: (width - dp(260))/3

                CategoriesButton {
                    iconSource: "../../assets/felgo-logo.png"
                    btnText: qsTr("All Food")
                    isSelected: btnText == currentBtnText
                    onClicked: {
                        filterCatgories(btnText)
                    }
                }
                CategoriesButton {
                    iconSource: "../../assets/felgo-logo.png"
                    btnText: qsTr("Pizza")
                    isSelected: btnText == currentBtnText
                    onClicked: {
                        filterCatgories(btnText)
                    }
                }
                CategoriesButton {
                    iconSource: "../../assets/felgo-logo.png"
                    btnText: qsTr("Burgers")
                    isSelected: btnText == currentBtnText
                    onClicked: {
                        filterCatgories(btnText)
                    }
                }
                CategoriesButton {
                    iconSource: "../../assets/felgo-logo.png"
                    btnText: qsTr("Fish")
                    isSelected: btnText == currentBtnText
                    onClicked: {
                        filterCatgories(btnText)
                    }
                }

            }
        }

        Column {
            id: placesCol
            width: parent.width
            spacing: dp(10)
            anchors {
                top: mainColBg.bottom
                topMargin: dp(30)
            }

            Repeater {
                model: 10

                delegate: AppButton {
                    width: parent.width
                    height: logoImage.height + contentItem.anchors.margins * 2
                    radius: dp(10)

                    backgroundColor: "white"
                    backgroundColorPressed: Theme.colors.backgroundColor
                    disabledColor: "#9BABB8"
                    horizontalMargin: 0
                    clip: true
                    //enabled: false

                    Row {
                        id: contentItem
                        spacing: defaultPadding
                        anchors {
                            fill: parent
                            margins: dp(5)

                        }

                        AppImage {
                            id: logoImage
                            width: dp(90)
                            height: width
                            fillMode: Image.PreserveAspectFit
                            source: "../../assets/felgo-logo.png"
                        }

                        Column {
                            id: descContainer
                            width: contentItem.width - contentItem.spacing - logoImage.width
                            spacing: dp(12)

                            AppText {
                                text: qsTr("Tasty Burgers")
                                width: parent.width
                                height: implicitHeight
                                font.bold: true
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                            }

                            Rectangle {
                                height: childrenRect.height + dp(3)
                                width: childrenRect.width + dp(20)
                                color: Theme.colors.secondaryTextColor
                                radius: height/2
                                anchors {
                                    right: parent.right
                                    rightMargin: -dp(14)
                                }

                                AppText {
                                    text: qsTr("Free delivery!")
                                    width: implicitWidth
                                    height: implicitHeight
                                    fontSize: dp(9)
                                    color: Theme.colors.backgroundColor
                                    anchors {
                                        left: parent.left
                                        leftMargin: dp(8)
                                    }
                                }
                            }

                            Row {
                                width: parent.width
                                spacing: dp(40)
                                DeliveryInfoIcon {
                                    iconType: IconType.creditcard
                                    iconText:  qsTr("min 12$")
                                }
                                DeliveryInfoIcon {
                                    iconType: IconType.bicycle
                                    iconText:  qsTr("5$")
                                }
                                DeliveryInfoIcon {
                                    iconType: IconType.clocko
                                    iconText:  qsTr("45 min")
                                }
                            }
                        }
                    }
                    onClicked: {
                        //TO DO -> open place details
                        console.debug("Place clicked")
                    }
                }
            }
        }
    }

    function filterCatgories(currentBtn) {
        //set selected button
        currentBtnText = currentBtn
    }

}
