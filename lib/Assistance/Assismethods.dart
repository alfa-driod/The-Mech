// ignore: file_names

import 'package:geolocator/geolocator.dart';
import 'RequestAssis.dart';

class AssisMethods {
  static Future<String> searchCordinates(Position position) async {
    var placeAdress='' ;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyAR4FSxfzX0DIfxJkyPraoMSIQTQ1jer4o";
    var response = await RequestAssis.getRequest(url);
    if (response != "failed") {
      
      placeAdress = response["results"][0]["formatted_address"];
    }
    return placeAdress;
  }
}
