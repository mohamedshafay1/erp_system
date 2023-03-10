class LoginModel {
  User? user;
  String? tokenType;
  int? expiresIn;

  LoginModel({this.user, this.tokenType, this.expiresIn});

  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}

class User {
  int? userId;
  int? employeeId;
  String? employeeUsername;
  String? password;
  String? firstLoginDate;
  int? departmentId;
  String? apiToken;

  User(
      {this.userId,
        this.employeeId,
        this.employeeUsername,
        this.password,
        this.firstLoginDate,
        this.departmentId,
        this.apiToken});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    employeeId = json['employee_id'];
    employeeUsername = json['employee_username'];
    password = json['password'];
    firstLoginDate = json['first_login_date'];
    departmentId = json['department_id'];
    apiToken = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['employee_id'] = this.employeeId;
    data['employee_username'] = this.employeeUsername;
    data['password'] = this.password;
    data['first_login_date'] = this.firstLoginDate;
    data['department_id'] = this.departmentId;
    data['api_token'] = this.apiToken;
    return data;
  }
}