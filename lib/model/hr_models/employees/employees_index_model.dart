class EmployeesIndexModel {
  List<Employees>? employees;

  EmployeesIndexModel({this.employees});

  EmployeesIndexModel.fromJson(Map<String, dynamic> json) {
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(new Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employees != null) {
      data['employees'] = this.employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employees {
  int? employeeId;
  String? employeeName;
  int? employeeDepartment;
  String? employeeJob;
  Department? department;
  User? user;

  Employees(
      {this.employeeId,
        this.employeeName,
        this.employeeDepartment,
        this.employeeJob,
        this.department,
        this.user});

  Employees.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    employeeDepartment = json['employee_department'];
    employeeJob = json['employee_job'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_id'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    data['employee_department'] = this.employeeDepartment;
    data['employee_job'] = this.employeeJob;
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Department {
  int? departmentId;
  String? departmentName;
  int? parentDepartmentId;

  Department({this.departmentId, this.departmentName, this.parentDepartmentId});

  Department.fromJson(Map<String, dynamic> json) {
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

class User {
  int? userId;
  int? employeeId;
  String? employeeUsername;
  String? password;
  String? firstLoginDate;
  int? departmentId;

  User(
      {this.userId,
        this.employeeId,
        this.employeeUsername,
        this.password,
        this.firstLoginDate,
        this.departmentId});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    employeeId = json['employee_id'];
    employeeUsername = json['employee_username'];
    password = json['password'];
    firstLoginDate = json['first_login_date'];
    departmentId = json['department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['employee_id'] = this.employeeId;
    data['employee_username'] = this.employeeUsername;
    data['password'] = this.password;
    data['first_login_date'] = this.firstLoginDate;
    data['department_id'] = this.departmentId;
    return data;
  }
}