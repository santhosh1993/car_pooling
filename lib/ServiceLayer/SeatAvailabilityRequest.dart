import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:car_pooling/ServiceLayer/BaseRequest.dart';

abstract class SeatAvailabilityRequestInterface {

}

class SeatAvailabilityRequest extends BaseRequest {
  final SeatAvailabilityRequestInterface interface;
  SeatAvailabilityRequest(this.interface);

  Future<List> getSeatAvailabilityList() async {
    String apiURL = baseUrl + "SeatBooking/services/";

    http.Response response = await http.get(apiURL);
    return json.decode(response.body);
  }
}