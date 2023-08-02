import QtQuick
import Felgo

Item {

    property alias dispatcher: logicConnection.target
    property var placesModel
    property var menuModel

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

        onShowPlaceDetails: {
            _.showPlaceDetails(id)
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

        function showPlaceDetails(id){
            HttpRequest.get(Qt.resolvedUrl("../data/places.json"))
            .then(function(res){
                var body =  JSON.parse(res.body)
                var place = body.find(function(place){
                    return place.id === id
                })
                menuModel = place.menu
                var propreties = {
                    placeName: place.name,
                    logoImageSource: place.imageSource,
                    minOrder: place.minOrder,
                    deliveryFee: place.deliveryFee,
                    deliveryTime: place.deliveryTime
                }
                navigationStack.push(placeDetailsPage, propreties)
            })
            .catch(function(err) {
                console.error("FAILED: ", err)
            })
        }

    }
}
