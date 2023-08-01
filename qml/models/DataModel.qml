import QtQuick
import Felgo

Item {

    property alias dispatcher: logicConnection.target
    property var placesModel

    Client {
        id: client
    }

    Connections {
        id: logicConnection

        onGetALlLocations: {
            HttpRequest.get(Qt.resolvedUrl("../data/places.json"))
            .then(function(res){
                var body =  JSON.parse(res.body)
                _.showAllLocations(body)
            })
            .catch(function(err) {
                console.error("FAILED: ", err)
            })
        }
    }

    Item {
        id: _

        function showAllLocations(locations) {
            //show all locations and sort by isOpen
            placesModel = locations.sort(function(a,b){return b.isOpen-a.isOpen});
        }
    }
}
