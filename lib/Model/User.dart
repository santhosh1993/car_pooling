class User {
  static User shared = User();
  String userName;
  String accessToken;
  String userType;
  String employeeId;
  String userId;
  String emailId;

  static updateUser(Map loginResponse) {
    shared.userName = "${loginResponse["user_name"]}";
    shared.userId = "${loginResponse["id"]}";
    shared.employeeId = "${loginResponse["employeeId"]}";
    shared.userType = "${loginResponse["user_type"]}";
    shared.emailId = "${loginResponse["email_id"]}";
  }
}