class AttendanceIndexModel {
  List<Attendance>? attendance;

  AttendanceIndexModel({this.attendance});

  AttendanceIndexModel.fromJson(Map<String, dynamic> json) {
    if (json['attendance'] != null) {
      attendance = <Attendance>[];
      json['attendance'].forEach((v) {
        attendance!.add(new Attendance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attendance {
  int? id;
  int? employeeId;
  String? date;
  String? checkIn;
  String? checkOut;
  EmployeeInfo? employeeInfo;

  Attendance(
      {this.id,
        this.employeeId,
        this.date,
        this.checkIn,
        this.checkOut,
        this.employeeInfo});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    date = json['date'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    employeeInfo = json['employee_info'] != null
        ? new EmployeeInfo.fromJson(json['employee_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['date'] = this.date;
    data['check_in'] = this.checkIn;
    data['check_out'] = this.checkOut;
    if (this.employeeInfo != null) {
      data['employee_info'] = this.employeeInfo!.toJson();
    }
    return data;
  }
}

class EmployeeInfo {
  int? employeeId;
  String? employeeName;
  int? employeeDepartment;
  String? employeeJob;

  EmployeeInfo(
      {this.employeeId,
        this.employeeName,
        this.employeeDepartment,
        this.employeeJob});

  EmployeeInfo.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    employeeDepartment = json['employee_department'];
    employeeJob = json['employee_job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_id'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    data['employee_department'] = this.employeeDepartment;
    data['employee_job'] = this.employeeJob;
    return data;
  }
}