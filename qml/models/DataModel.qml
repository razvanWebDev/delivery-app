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
            _.fetchAllLocations()
        }

        onFilterLocationsByCatgory: {
            _.filterLocationsByCategory(category)
        }

        onFilterLocationsByName: {
            _.filterLocationsByName(name)
        }
    }

    Item {
        id: _

        function fetchAllLocations() {
            HttpRequest.get(Qt.resolvedUrl("../data/places.json"))
            .then(function(res){
                var body =  JSON.parse(res.body)
                placesModel = sortLocationsByOpenCond(body)
            })
            .catch(function(err) {
                console.error("FAILED: ", err)
            })
        }

        function sortLocationsByOpenCond(locations) {
            return locations.sort(function(a,b){return b.isOpen-a.isOpen});
        }

        function filterLocationsByCategory(category) {
            HttpRequest.get(Qt.resolvedUrl("../data/places.json"))
            .then(function(res){
                var body =  JSON.parse(res.body)
                var filteredLocations = body.filter(function(place){
                    return place.categories.includes(category);
                })
                placesModel = sortLocationsByOpenCond(filteredLocations)
            })
            .catch(function(err) {
                console.error("FAILED: ", err)
            })

        }

        function filterLocationsByName(query) {
            HttpRequest.get(Qt.resolvedUrl("../data/places.json"))
            .then(function(res){
                var body =  JSON.parse(res.body)
                var filteredLocations = body.filter(function(place){
                    var placeName = place.name.toLowerCase();
                    return placeName.includes(query);
                })
                placesModel = sortLocationsByOpenCond(filteredLocations)
            })
            .catch(function(err) {
                console.error("FAILED: ", err)
            })
        }

    }
}
