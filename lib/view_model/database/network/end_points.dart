//End Points that's Used in API

// Network Connection Details

import 'package:erp_system/view_model/database/local/cache_helper.dart';

const String baseUrlar = 'https://lawyerslawyer.online/api/';

// End Points

const login = 'login';
const profile = 'profile';
const logout = 'logout';
const myAttendance = 'my-attendance';
const checkout = 'check-out';
const hrIndex = 'hr/index';
const hrEmployees = 'hr/employees';
const hrEmployeesDepartment = 'hr/employees-department/new';
const hrEmployeesId = 'hr/employees/';
const saveNewEmployee = 'hr/employees/save-new-employee';
const hrDepartments = 'hr/departments';
const hrDepartmentsEmployeesId = 'hr/department/employees/';
const newDepartment = 'hr/departments/new';
const saveNewDepartment = 'hr/departments/save-new-department';
const hrAttendance = 'hr/attendance';

String accessToken = CacheHelper.getData(key: 'accessToken')??'';






