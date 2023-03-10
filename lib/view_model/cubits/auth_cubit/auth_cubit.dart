import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:erp_system/model/user_models/user_profile_model.dart';
import 'package:erp_system/view_model/cubits/auth_cubit/auth_states.dart';
import 'package:erp_system/view_model/database/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/user_models/login_model.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  LoginModel? loginModel;

  Future<void> userLogin({
    required String userName,
    required String password,

  }) async {
    emit(LoginLoadingState());

    await DioHelper.postData(url: login, data: {
      'employee_username': userName,
      'password': password,

    }).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      CacheHelper.saveData(key: 'accessToken', value: loginModel!.user!.apiToken);
      emit(LoginSuccessState(loginModel!));
    }).catchError((onError) {
      if (onError is DioError) {
        print('Error Login Cubit ${onError.toString()}');
        emit(LoginErrorState(
            onError is DioError ? onError.response!.data['error'] : 'error'));
      }
    });
  }


UserProfileModel? userProfileModel;
  Future<void> postProfile() async {
    emit(ProfileLoadingState());

    await DioHelper.postData(url: profile, token: accessToken).then((value) {
      print(value.data);
      userProfileModel = UserProfileModel.fromJson(value.data);

      emit(ProfileSuccessState());
    }).catchError((onError) {
      if (onError is DioError) {
        print('Error profile Cubit ${onError.toString()}');
        emit(ProfileSuccessState());
      }
    });
  }
  Future<void> logoutProfile() async {
    emit(LogoutLoadingState());

    await DioHelper.postData(url: logout, token: accessToken).then((value) {
      print(value.data);

      emit(LogoutSuccessState());
    }).catchError((onError) {
      if (onError is DioError) {
        print('Error profile Cubit ${onError.toString()}');
        emit(LogoutErrorState(  onError is DioError ? onError.response!.data['error'] : 'error'));
      }
    });
  }
  Future<void> checkoutProfile() async {
    emit(CheckoutLoadingState());

    await DioHelper.postData(url: checkout, token: accessToken).then((value) {
      print(value.data);

      emit(CheckoutSuccessState());
    }).catchError((onError) {
      if (onError is DioError) {
        print('Error profile Cubit ${onError.toString()}');
        emit(CheckoutErrorState(  onError is DioError ? onError.response!.data['error'] : 'error'));
      }
    });
  }











}
