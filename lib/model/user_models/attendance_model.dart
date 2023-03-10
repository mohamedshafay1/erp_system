class AttendanceModel {
  List<MyAttendance>? myAttendance;

  AttendanceModel({this.myAttendance});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    if (json['my attendance'] != null) {
      myAttendance = <MyAttendance>[];
      json['my attendance'].forEach((v) {
        myAttendance!.add(new MyAttendance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myAttendance != null) {
      data['my attendance'] =
          this.myAttendance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyAttendance {
  int? id;
  int? employeeId;
  String? date;
  String? checkIn;
  String? checkOut;

  MyAttendance(
      {this.id, this.employeeId, this.date, this.checkIn, this.checkOut});

  MyAttendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    date = json['date'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['date'] = this.date;
    data['check_in'] = this.checkIn;
    data['check_out'] = this.checkOut;
    return data;
  }
}