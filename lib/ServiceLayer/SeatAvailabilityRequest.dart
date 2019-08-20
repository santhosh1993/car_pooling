import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:car_pooling/ServiceLayer/BaseRequest.dart';

abstract class SeatAvailabilityRequestInterface {
    String userName;
    String userId;
    String employeeId;
    String serviceId;
}

class SeatAvailabilityRequest extends BaseRequest {
  Future<List> getSeatAvailabilityList() async {
    String apiURL = baseUrl + "SeatBooking/services/";

    http.Response response = await http.get(apiURL);
    return json.decode(response.body);
  }

  Future<Map> updateTheBooking(SeatAvailabilityRequestInterface interface) async {
    String apiURL = baseUrl + "SeatBooking/userbooking/book";
    Map body = {
      "user_name": interface.userName,
      "employee_id": interface.employeeId,
      "user_id": interface.userId,
      "service_id": interface.serviceId,
    };

    http.Response response = await http.post(apiURL, headers: headers, body: body);
    return json.decode(response.body);
  }
}