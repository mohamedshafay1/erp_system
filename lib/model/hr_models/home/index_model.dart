class IndexModel {
  int? departments;
  int? employees;

  IndexModel({this.departments, this.employees});

  IndexModel.fromJson(Map<String, dynamic> json) {
    departments = json['departments'];
    employees = json['employees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departments'] = this.departments;
    data['employees'] = this.employees;
    return data;
  }
}