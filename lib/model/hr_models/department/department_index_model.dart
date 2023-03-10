class DepartmentIndexModel {
  List<Departments>? departments;

  DepartmentIndexModel({this.departments});

  DepartmentIndexModel.fromJson(Map<String, dynamic> json) {
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        departments!.add(new Departments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.departments != null) {
      data['departments'] = this.departments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Departments {
  int? departmentId;
  String? departmentName;
  int? parentDepartmentId;
  int? employeesCount;

  Departments(
      {this.departmentId,
        this.departmentName,
        this.parentDepartmentId,
        this.employeesCount});

  Departments.fromJson(Map<String, dynamic> json) {
    departmentId = json['department_id'];
    departmentName = json['department_name'];
    parentDepartmentId = json['parent_department_id'];
    employeesCount = json['employees_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department_id'] = this.departmentId;
    data['department_name'] = this.departmentName;
    data['parent_department_id'] = this.parentDepartmentId;
    data['employees_count'] = this.employeesCount;
    return data;
  }
}