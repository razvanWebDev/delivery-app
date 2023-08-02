import QtQuick
import Felgo

Item {

    signal getALlLocations ()

    signal filterLocationsByCatgory (string category)

    signal filterLocationsByName (string name)

    signal showPlaceDetails(int id)
}
