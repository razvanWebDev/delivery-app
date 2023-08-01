import QtQuick
import Felgo
import QtQuick.Controls
import "../components"

AppPage {

    title: qsTr("Delivery App")
    useSafeArea: false
    property string currentBtnText: qsTr("All Food")

    clip: true

    JsonListModel {
        id: listModel
        source: dataModel.placesModel
        fields: ["id", "name", "imageSource", "freeDelivery", "minOrder", "deliveryFee", "deliveryTime", "isOpen"]
    }


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
                topMargin: - dp(60)
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

            AppTextField {
                width: parent.width
                radius: height/2
                backgroundColor: Theme.colors.backgroundColor
                placeholderText: "Search for a location"
                placeholderColor: "#9D9D9D"
                selectionColor: Theme.colors.secondaryTextColor
                showClearButton: true
                leftPadding: dp(15)
                rightPadding: dp(20)
                onTextChanged: {
                    //Filter by name
                }
            }

            AppText {
                text: "What would you like to order?"
                width: parent.width
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                fontSize: sp(28)
                font.bold: true
                color: Theme.colors.secondaryTextColor
            }


            Row {
                width: parent.width
                spacing: (width - dp(260))/3

                CategoriesButton {
                    iconSource: Qt.resolvedUrl("../../assets/menu.png")
                    btnText: qsTr("All Food")
                    isSelected: btnText == currentBtnText
                    onClicked: {
                        logic.filterLocationsByCatgory(btnText)
                    }
                }
                CategoriesButton {
                    iconSource: Qt.resolvedUrl("../../assets/pizza.png")
                    btnText: qsTr("Pizza")
                    isSelected: btnText == currentBtnText
                    onClicked: {
                        logic.filterLocationsByCatgories(btnText)
                    }
                }
                CategoriesButton {
                    iconSource: Qt.resolvedUrl("../../assets/hamburger.png")
                    btnText: qsTr("Burgers")
                    isSelected: btnText == currentBtnText
                    onClicked: {
                        logic.filterLocationsByCatgories(btnText)
                    }
                }
                CategoriesButton {
                    iconSource: Qt.resolvedUrl("../../assets/fish.png")
                    btnText: qsTr("Fish")
                    isSelected: btnText == currentBtnText
                    onClicked: {
                        logic.filterLocationsByCatgories(btnText)
                    }
                }

            }
        }

        Column {
            id: placesCol
            width: parent.width
            spacing: dp(5)
            anchors {
                top: mainColBg.bottom
                topMargin: dp(40)
            }

            Repeater {
                model: listModel

                delegate: AppButton {
                    width: parent.width
                    height: logoImage.height + dp(30)
                    radius: dp(10)

                    backgroundColor: "white"
                    backgroundColorPressed: Theme.colors.backgroundColor
                    disabledColor: "#9D9D9D"
                    horizontalMargin: 0
                    clip: true
                    enabled: model.isOpen

                    Row {
                        id: contentItem
                        spacing: defaultPadding
                        width: parent.width
                        height: logoImage.height
                        anchors.verticalCenter: parent.verticalCenter
                        x: dp(10)

                        AppImage {
                            id: logoImage
                            height: dp(90)
                            fillMode: Image.PreserveAspectFit
                            source: Qt.resolvedUrl(model.imageSource)
                        }

                        Column {
                            id: descContainer
                            width: contentItem.width - contentItem.spacing - logoImage.width
                            spacing: dp(12)

                            AppText {
                                text: qsTr(model.name)
                                width: parent.width
                                height: implicitHeight
                                font.bold: true
                                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                            }

                            Rectangle {
                                height: childrenRect.height + dp(3)
                                width: childrenRect.width + dp(25)
                                color: Theme.colors.secondaryTextColor
                                radius: height/2
                                anchors.right: parent.right

                                AppText {
                                    text: qsTr("Free delivery!")
                                    width: implicitWidth
                                    height: implicitHeight
                                    fontSize: sp(9)
                                    color: Theme.colors.backgroundColor
                                    anchors {
                                        left: parent.left
                                        leftMargin: dp(8)
                                    }
                                }
                                opacity: model.freeDelivery ? 1 : 0
                            }

                            Row {
                                width: parent.width
                                spacing: dp(40)
                                DeliveryInfoIcon {
                                    iconType: IconType.creditcard
                                    iconText:  qsTr("min %1$").arg(model.minOrder)
                                }
                                DeliveryInfoIcon {
                                    iconType: IconType.bicycle
                                    iconText:  qsTr("%1$").arg(model.deliveryFee)
                                }
                                DeliveryInfoIcon {
                                    iconType: IconType.clocko
                                    iconText:  qsTr("%1 min").arg(model.deliveryTime)
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

    Connections {
        target: dataModel
    }

    Component.onCompleted: {
        logic.getALlLocations()
    }
}
