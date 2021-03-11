import 'dart:convert' as convert;

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:navi/model/placeorder/response_place_order_entity.dart';
import 'package:navi/model/vehicles/response_vehicles_entity.dart';
import 'package:navi/utilts/data_response.dart';

class NaviRepository {
  var baseURL = Uri.https('www.ebda3-eg.com', '/test/', {'q': '{https}'});
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9';
  final String vehicle = "getVehicles";
  var url = 'https://example.com/whatsit/create';

  Future<Position> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);

      return position;
    } catch (e) {
      print(e);
    }
  }

  Future<DataResponse<ResponseVehiclesEntity>> getVehicles() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var request =
          http.Request('POST', Uri.parse('https://www.ebda3-eg.com/test/'));
      request.body =
          '''{\n    "do":"getVehicles",\n    "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9"\n}''';
      request.headers.addAll(headers);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      var data = convert.jsonDecode(response.body);
      return DataResponse.success(ResponseVehiclesEntity().fromJson(data));
    } catch (e) {
      print(e);
      return DataResponse.error(e.toString());
    }
  }

  Future<DataResponse<ResponsePlaceOrderEntity>> sendPlaceOrder(
      String origin, String destination, int vehicleID) async {
    var headers = {'Content-Type': 'text/plain'};
    var request =
        http.Request('POST', Uri.parse('https://www.ebda3-eg.com/test/'));
    request.body =
        '''{\n    "do":"placeOrder",\n    "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9",\n    "origin":"$origin",\n    "destination":"$destination",\n    "VehicleID":$vehicleID\n\n}''';
    request.headers.addAll(headers);
    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      var data = convert.jsonDecode(response.body);
      return DataResponse.success(ResponsePlaceOrderEntity().fromJson(data));
    } catch (e) {
      print(e);
      return DataResponse.error(e.toString());
    }
  }
}
