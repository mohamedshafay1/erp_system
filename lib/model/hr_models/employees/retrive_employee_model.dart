class RetriveEmployeeModel {
  Employee? employee;

  RetriveEmployeeModel({this.employee});

  RetriveEmployeeModel.fromJson(Map<String, dynamic> json) {
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    return data;
  }
}

class Employee {
  int? employeeId;
  String? employeeName;
  int? employeeDepartment;
  String? employeeJob;
  EmployeeWi? employeeWi;
  EmployeePi? employeePi;
  User? user;
  Department? department;

  Employee(
      {this.employeeId,
        this.employeeName,
        this.employeeDepartment,
        this.employeeJob,
        this.employeeWi,
        this.employeePi,
        this.user,
        this.department});

  Employee.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    employeeDepartment = json['employee_department'];
    employeeJob = json['employee_job'];
    employeeWi = json['employee_wi'] != null
        ? new EmployeeWi.fromJson(json['employee_wi'])
        : null;
    employeePi = json['employee_pi'] != null
        ? new EmployeePi.fromJson(json['employee_pi'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_id'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    data['employee_department'] = this.employeeDepartment;
    data['employee_job'] = this.employeeJob;
    if (this.employeeWi != null) {
      data['employee_wi'] = this.employeeWi!.toJson();
    }
    if (this.employeePi != null) {
      data['employee_pi'] = this.employeePi!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    return data;
  }
}

class EmployeeWi {
  int? id;
  int? employeeId;
  int? workMobile;
  int? workPhone;
  String? workEmail;
  String? bankAccount;
  int? workPermitNo;
  String? workPermitExpireDate;

  EmployeeWi(
      {this.id,
        this.employeeId,
        this.workMobile,
        this.workPhone,
        this.workEmail,
        this.bankAccount,
        this.workPermitNo,
        this.workPermitExpireDate});

  EmployeeWi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    workMobile = json['work_mobile'];
    workPhone = json['work_phone'];
    workEmail = json['work_email'];
    bankAccount = json['bank_account'];
    workPermitNo = json['work_permit_no'];
    workPermitExpireDate = json['work_permit_expire_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['work_mobile'] = this.workMobile;
    data['work_phone'] = this.workPhone;
    data['work_email'] = this.workEmail;
    data['bank_account'] = this.bankAccount;
    data['work_permit_no'] = this.workPermitNo;
    data['work_permit_expire_date'] = this.workPermitExpireDate;
    return data;
  }
}

class EmployeePi {
  int? id;
  int? employeeId;
  String? address;
  String? phone;
  String? emergencyName;
  String? emergencyPhone;
  String? nationality;
  int? identificationNo;
  int? passportNo;
  int? gender;
  String? birthDate;

  EmployeePi(
      {this.id,
        this.employeeId,
        this.address,
        this.phone,
        this.emergencyName,
        this.emergencyPhone,
        this.nationality,
        this.identificationNo,
        this.passportNo,
        this.gender,
        this.birthDate});

  EmployeePi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    address = json['address'];
    phone = json['phone'];
    emergencyName = json['emergency_name'];
    emergencyPhone = json['emergency_phone'];
    nationality = json['nationality'];
    identificationNo = json['identification_no'];
    passportNo = json['passport_no'];
    gender = json['gender'];
    birthDate = json['birth_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['emergency_name'] = this.emergencyName;
    data['emergency_phone'] = this.emergencyPhone;
    data['nationality'] = this.nationality;
    data['identification_no'] = this.identificationNo;
    data['passport_no'] = this.passportNo;
    data['gender'] = this.gender;
    data['birth_date'] = this.birthDate;
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

class Department {
  int? departmentId;
  String? departmentName;
  Null? parentDepartmentId;

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