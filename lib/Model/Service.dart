import 'package:intl/intl.dart';
import 'package:car_pooling/Model/User.dart';

class Service {
  ServiceType type;
  List<UserDetails> bookedUsers = [];
  String serviceId;
  String date;
  String time;
  int maxBookings;
  UserDetails details;

  Service(Map json){
    this.serviceId = "${json["id"]}";
    this.maxBookings = json["max_bookings"];
    this.type = ServiceType(json["service"]);

    List users = json["users"];

    for(int i = 0; i<users.length; i++) {
       UserDetails details = UserDetails(users[i]);
       if(details.isCurrentUser()){
         this.details = details;
       }
       bookedUsers.add(details);
       if (details.userId == User.shared.userId) {
         User.shared.addService(this);
       }
    }

    updateDateAndTime(json["date_time"]);
  }

  updateDateAndTime(String dateTime){
    var dateFormatter = DateFormat('yyyy-MM-dd');
    var timeFormatter = DateFormat('hh:mm a');
    this.date = dateFormatter.format(DateTime.parse(dateTime));
    this.time = timeFormatter.format(DateTime.parse(dateTime));
  }
}

class ServiceType {
  String serviceTypeId;
  String serviceType;

  ServiceType(Map json){
    this.serviceType = "${json["type"]}";
    this.serviceTypeId = "${json["id"]}";
  }
}

class UserDetails {
  String userId;
  String bookingId;
  String userName;
  String employeeId;

  UserDetails(Map json){
    this.userName = "${json["user_name"]}";
    this.bookingId = "${json["id"]}";
    this.userId = "${json["user_id"]}";
    this.employeeId = "${json["employeeId"]}";
  }

  bool isCurrentUser(){
    return (employeeId == User.shared.employeeId);
  }
}

class ServicesList{
  List<Service> services = [];

  ServicesList(List json) {
    User.shared.resetServices();
    for(int i = 0; i < json.length; i++){
      Map data = json[i];
      Service service  = Service(data);
      this.services.add(service);
    }
  }

  Map<String,Map<String,List<Service>>> groupByDateAndByTime() {
    Map<String,Map<String,List<Service>>> dates = {};
    for (int i = 0; i< services.length; i++){
      Service service = services[i];
      dates[service.date] = _getMapsWithTime((dates[service.date] ?? {}), service);
    }

    return dates;
  }

  Map<String,List<Service>> _getMapsWithTime(Map<String,List<Service>> services, Service service){
    List<Service> timeServices = services[service.time] ?? [];
    timeServices.add(service);
    services[service.time] = timeServices;
    return services;
  }
}