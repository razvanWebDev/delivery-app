import QtQuick
import Felgo
import "../components"
AppPage {

    property string placeName
    property url logoImageSource
    property real minOrder
    property real deliveryFee
    property real deliveryTime

    JsonListModel {
        id: listModel
        source: dataModel.menuModel
        fields: ["id", "title", "imageSource", "title", "ingredients", "portionSize", "price"]
    }

    Rectangle {
        id: placeInfo

        color: Theme.colors.secondaryBackgroundColor
        height: logoImage.height + placeTitle.height + deliveryConditions.height + dp(60)
        width: parent.width

        AppImage {
            id: logoImage
            height: dp(130)
            fillMode: Image.PreserveAspectFit
            source: Qt.resolvedUrl(logoImageSource)
            anchors {
                horizontalCenter: parent.horizontalCenter
                top:parent.top
                topMargin: defaultPadding
            }
        }

        AppText {
            id: placeTitle
            text: placeName
            font.bold: true
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            color: Theme.colors.backgroundColor
            fontSize: sp(20)
            anchors {
                horizontalCenter: parent.horizontalCenter
                top:logoImage.bottom
                topMargin: defaultPadding
            }
        }

        Row {
            id: deliveryConditions
            spacing: (parent.width - dp(50)) / 4
            height: implicitHeight
            anchors {
                horizontalCenter: parent.horizontalCenter
                top:placeTitle.bottom
                topMargin: dp(20)
            }

            DeliveryInfoIcon {
                iconType: IconType.creditcard
                iconText:  qsTr("min %1$").arg(minOrder)
                iconColor: Theme.colors.backgroundColor
                textColor: Theme.colors.backgroundColor
            }
            DeliveryInfoIcon {
                iconType: IconType.bicycle
                iconText:  qsTr("%1$").arg(deliveryFee)
                iconColor: Theme.colors.backgroundColor
                textColor: Theme.colors.backgroundColor
            }
            DeliveryInfoIcon {
                iconType: IconType.clocko
                iconText:  qsTr("%1 min").arg(deliveryTime)
                iconColor: Theme.colors.backgroundColor
                textColor: Theme.colors.backgroundColor
            }
        }
    }

    AppListView {
        anchors {
            top: placeInfo.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            leftMargin: defaultPadding
            rightMargin: defaultPadding
            bottomMargin: defaultPadding
        }

        backgroundColor: Theme.colors.backgroundColor

        model: listModel
        spacing: dp(5)

        delegate: AppButton {
            width: parent.width
            height: dp(120)
            radius: dp(10)

            backgroundColor: "white"
            backgroundColorPressed: Theme.colors.backgroundColor
            disabledColor: "#9D9D9D"
            horizontalMargin: 0

            AppImage {
                id: foodImage
                height: dp(90)
                fillMode: Image.PreserveAspectFit
                source: Qt.resolvedUrl(model.imageSource)

                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: dp(10)
                }
            }

            AppText {
                id: foodTitle
                text: qsTr(model.title)
                font.bold: true
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                anchors {
                    top: foodImage.top
                    left: foodImage.right
                    right: parent.right
                    leftMargin: dp(10)
                    rightMargin: dp(10)
                }
            }

            AppText {
                id: ingredients
                text: qsTr(model.ingredients)
                maximumLineCount: 1
                elide: Text.ElideRight
                fontSize: sp(12)
                anchors {
                    top: foodTitle.bottom
                    left: foodTitle.left
                    right: foodTitle.right
                    topMargin: dp(5)
                }
            }

            AppText {
                text: qsTr(model.portionSize)
                font.bold: true
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                anchors {
                    bottom: foodImage.bottom
                    left: foodImage.right
                    leftMargin: dp(10)
                }
            }

            AppText {
                text: qsTr("%1$").arg(model.price)
                font.bold: true
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                anchors {
                    bottom: foodImage.bottom
                    right: foodTitle.right
                }
            }

            onClicked: {
                var propreties = {
                    imageSource: model.imageSource,
                    title: model.title,
                    ingredients: model.ingredients,
                    price: model.price,
                    portionSize: model.portionSize
                }
                navigationStack.push(menuItemPage, propreties)
            }
        }
    }
}
