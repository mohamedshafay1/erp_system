import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:erp_system/model/hr_models/department/department_employee_model.dart';
import 'package:erp_system/model/hr_models/department/department_index_model.dart';
import 'package:erp_system/model/hr_models/home/index_model.dart';
import 'package:erp_system/model/user_models/attendance_model.dart';
import 'package:erp_system/view_model/database/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/hr_models/attendance/attendance_index_model.dart';
import '../../../model/hr_models/department/create_model.dart';
import '../../../model/hr_models/employees/employees_index_model.dart';
import '../../../model/hr_models/employees/retrive_employee_model.dart';
import '../../database/network/dio_exceptions.dart';
import '../../database/network/dio_helper.dart';
import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of<LayoutCubit>(context);
  AttendanceModel? attendanceModel;

  Future<void> getMyAttendance() async {
    emit(GetMyAttendanceLoadingState());

    await DioHelper.getData(url: myAttendance, token: accessToken)
        .then((value) {
      attendanceModel = AttendanceModel.fromJson(value.data);
      emit(GetMyAttendanceSuccessState());
    }).catchError((onError) {
      print(onError);
      if (onError is DioError) {
        final errorMessage = DioExceptions.fromDioError(onError).toString();
        print('Error Attendance  ${onError.toString()}');
        emit(GetMyAttendanceErrorState());
      }
    });
  }

  IndexModel? indexModel;

  Future<void> getHrIndex() async {
    emit(HrIndexLoadingState());

    await DioHelper.getData(url: hrIndex, token: accessToken).then((value) {
      indexModel = IndexModel.fromJson(value.data);
      emit(HrIndexSuccessState());
    }).catchError((onError) {
      print(onError);
      if (onError is DioError) {
        final errorMessage = DioExceptions.fromDioError(onError).toString();
        print('Error Attendance  ${onError.toString()}');
        emit(HrIndexErrorState());
      }
    });
  }

  EmployeesIndexModel? employeesIndexModel;

  Future<void> getEmployeeIndex() async {
    emit(EmployeeIndexLoadingState());

    await DioHelper.getData(url: hrEmployees, token: accessToken).then((value) {
      employeesIndexModel = EmployeesIndexModel.fromJson(value.data);
      emit(EmployeeIndexSuccessState());
    }).catchError((onError) {
      print(onError);
      if (onError is DioError) {
        final errorMessage = DioExceptions.fromDioError(onError).toString();
        print('Error getEmployeeIndex  ${onError.toString()}');
        emit(EmployeeIndexErrorState());
      }
    });
  }

  RetriveEmployeeModel? retriveEmployeeModel;

  Future<void> getRetriveEmployee({int? id}) async {
    emit(RetriveEmployeeLoadingState());

    await DioHelper.getData(url: '$hrEmployeesId$id', token: accessToken)
        .then((value) {
      retriveEmployeeModel = RetriveEmployeeModel.fromJson(value.data);
      emit(RetriveEmployeeSuccessState());
    }).catchError((onError) {
      print(onError);
      if (onError is DioError) {
        final errorMessage = DioExceptions.fromDioError(onError).toString();
        print('Error getRetriveEmployee  ${onError.toString()}');
        emit(RetriveEmployeeErrorState());
      }
    });
  }

  Future<void> addEmployee({
    required String birthDate,
    required int gender,
    required String passportNo,
    required String identificationNo,
    required String nationality,
    required String contactPhone,
    required String contactName,
    required String phone,
    required String address,
    required String workPermissionExpireDate,
    required String workPermitNo,
    required String backAccount,
    required String workEmail,
    required String workMobile,
    required String workPhone,
    required int departmentId,
    required String jobPosition,
    required String employeeName,
    required String employeeId,
  }) async {
    emit(AddEmployeeLoadingState());

    await DioHelper.postData(url: saveNewEmployee, data: {
      'birth_date': birthDate,
      'gender': gender,
      'passport_no': passportNo,
      'identification_no': identificationNo,
      'nationality': nationality,
      'contact_phone': contactPhone,
      'contact_name': contactName,
      'phone': phone,
      'adress': address,
      'work_permition_expire_date': workPermissionExpireDate,
      'work_permit_no': workPermitNo,
      'bank_account': backAccount,
      'work_email': workEmail,
      'work_phone': workPhone,
      'work_mobile': workMobile,
      'department_id': departmentId,
      'jop_position': jobPosition,
      'employee_id': employeeId,
      'employee_name': employeeName,
    }).then((value) {
      print(value.data);

      emit(AddEmployeeSuccessState());
    }).catchError((onError) {
      if (onError is DioError) {
        print('Error Login Cubit ${onError.toString()}');
        emit(AddEmployeeErrorState());
      }
    });
  }

  DepartmentIndexModel? departmentIndexModel;

  Future<void> getDepartmentIndex() async {
    emit(DepartmentIndexLoadingState());

    await DioHelper.getData(url: hrDepartments, token: accessToken)
        .then((value) {
      departmentIndexModel = DepartmentIndexModel.fromJson(value.data);
      emit(DepartmentIndexSuccessState());
    }).catchError((onError) {
      print(onError);
      if (onError is DioError) {
        final errorMessage = DioExceptions.fromDioError(onError).toString();
        print('Error getDepartmentIndex  ${onError.toString()}');
        emit(DepartmentIndexErrorState());
      }
    });
  }

  DepartmentEmployeeModel? departmentEmployeeModel;

  Future<void> getDepartmentEmployee({int? id}) async {
    emit(DepartmentEmployeeLoadingState());

    await DioHelper.getData(
            url: '$hrDepartmentsEmployeesId$id', token: accessToken)
        .then((value) {
      departmentEmployeeModel = DepartmentEmployeeModel.fromJson(value.data);
      emit(DepartmentEmployeeSuccessState());
    }).catchError((onError) {
      print(onError);
      if (onError is DioError) {
        final errorMessage = DioExceptions.fromDioError(onError).toString();
        print('Error getRetriveEmployee  ${onError.toString()}');
        emit(DepartmentEmployeeErrorState());
      }
    });
  }

  CreateModel? createModel;

  Future<void> createDepartmentEmployee() async {
    emit(CreateDepartmentLoadingState());

    await DioHelper.getData(url: newDepartment, token: accessToken)
        .then((value) {
      createModel = CreateModel.fromJson(value.data);
      emit(CreateDepartmentSuccessState());
    }).catchError((onError) {
      print(onError);
      if (onError is DioError) {
        final errorMessage = DioExceptions.fromDioError(onError).toString();
        print('Error getRetriveEmployee  ${onError.toString()}');
        emit(CreateDepartmentErrorState());
      }
    });
  }

  Future<void> addDepartment({
    required String departmentName,
    required String parentDepartmentId,
    required String mangerId,
  }) async {
    emit(NewDepartmentLoadingState());

    await DioHelper.postData(url: saveNewDepartment, data: {
      'department_name': departmentName,
      'parent_department_id': parentDepartmentId,
      'manger_id': mangerId,
    }).then((value) {
      print(value.data);

      emit(NewDepartmentSuccessState());
    }).catchError((onError) {
      if (onError is DioError) {
        print('Error addDepartment ${onError.toString()}');
        emit(NewDepartmentErrorState());
      }
    });
  }

  AttendanceIndexModel? attendanceIndexModel;

  Future<void> getAttendanceIndex() async {
    emit(HrAttendanceLoadingState());

    await DioHelper.getData(url: hrAttendance, token: accessToken)
        .then((value) {
      attendanceIndexModel = AttendanceIndexModel.fromJson(value.data);
      emit(HrAttendanceSuccessState());
    }).catchError((onError) {
      print(onError);
      if (onError is DioError) {
        final errorMessage = DioExceptions.fromDioError(onError).toString();
        print('Error Attendance  ${onError.toString()}');
        emit(HrAttendanceErrorState());
      }
    });
  }
}
