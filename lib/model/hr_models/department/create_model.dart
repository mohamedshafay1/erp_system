class CreateModel {
  List<Departments>? departments;
  List<Employees>? employees;

  CreateModel({this.departments, this.employees});

  CreateModel.fromJson(Map<String, dynamic> json) {
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        departments!.add(new Departments.fromJson(v));
      });
    }
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(new Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.departments != null) {
      data['departments'] = this.departments!.map((v) => v.toJson()).toList();
    }
    if (this.employees != null) {
      data['employees'] = this.employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Departments {
  int? departmentId;
  String? departmentName;
  int? parentDepartmentId;

  Departments(
      {this.departmentId, this.departmentName, this.parentDepartmentId});

  Departments.fromJson(Map<String, dynamic> json) {
    departmentId = json['department_id'];
    departmentName = json['department_name'];
    parentDepartmentId = json['parent_department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department_id'] = this.departmentId;
    data['department_name'] = this.departmentName;
    data['parent_department_id'] = this.parentDepartmentId;
    return data;
  }
}

class Employees {
  int? employeeId;
  String? employeeName;
  int? employeeDepartment;
  String? employeeJob;

  Employees(
      {this.employeeId,
        this.employeeName,
        this.employeeDepartment,
        this.employeeJob});

  Employees.fromJson(Map<String, dynamic> json) {
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