import Felgo
import QtQuick

App {
    onInitTheme: {
        Theme.colors.backgroundColor = "#F8F1F1"
        Theme.colors.secondaryBackgroundColor = "#025464"
        Theme.colors.textColor = "#025464"
        Theme.colors.secondaryTextColor = "#E8AA42"
    }

    DeliveryAppMainPage {}
}
