import QtQuick
import Felgo
import "pages"
import "models"

Item {

    anchors.fill: parent

    readonly property real defaultPadding: dp(15)

    Logic {
        id: logic
    }

    DataModel {
        id: dataModel
        dispatcher: logic
    }

    NavigationStack {
        MainPage {}
    }
}
