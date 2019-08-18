import 'package:intl/intl.dart';

class Service {
  ServiceType type;
  List<UserDetails> bookedUsers = [];
  String serviceId;
  String date;
  String time;
  int maxBookings;

  Service(Map json){
    this.serviceId = "${json["id"]}";
    this.maxBookings = json["max_bookings"];
    this.type = ServiceType(json["service"]);

    List users = json["users"];

    for(int i = 0; i<users.length; i++) {
       bookedUsers.add(UserDetails(users[i]));
    }

    updateDateAndTime(json["date_time"]);
  }

  updateDateAndTime(String dateTime){
    var dateFormatter = DateFormat('yyyy-MM-dd');
    var timeFormatter = DateFormat('hh:mm a');
    this.date = dateFormatter.format(DateTime.parse(dateTime));
    this.time = timeFormatter.format(DateTime.parse(dateTime));
    print(date);
    print(time);
    print("------");
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
}

class ServicesList{
  List<Service> services = [];

  ServicesList(List json) {
    for(int i = 0; i < json.length; i++){
      Map data = json[i];
      Service service  = Service(data);
      this.services.add(service);
    }
  }

  Map groupByDateAndByTime() {
    Map dates = {};
    for (int i = 0; i< services.length; i++){
      Service service = services[i];
      dates[service.date] = _getMapsWithTime((dates[service.date] ?? {}), service);
    }

    return dates;
  }

  Map _getMapsWithTime(Map services, Service service){
    List timeServices = services[service.time] ?? [];
    timeServices.add(service);
    services[service.time] = timeServices;
    return services;
  }
}