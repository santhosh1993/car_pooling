import 'package:flutter/material.dart';
import 'package:car_pooling/UI/TripDetail.dart';
import 'package:car_pooling/Model/Service.dart';
import 'package:car_pooling/Interfaces/TripDetailInterfaces.dart';

class TripDetailData implements TripDetailUIInterface {
  TripDetail detail;
  Service _service;

  TripDetailData(Service service) {
    detail = TripDetail(this);
    this._service = service;
  }

  Widget getWidget() {
    return detail;
  }
}