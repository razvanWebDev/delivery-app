import QtQuick
import Felgo
import "pages"

AppPage {

    readonly property real defaultPadding: dp(15)

    NavigationStack {
        MainPage {}
    }
}
