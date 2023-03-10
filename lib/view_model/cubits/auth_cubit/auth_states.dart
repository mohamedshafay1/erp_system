import '../../../model/user_models/login_model.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends AuthStates {
  String msg;

  LoginErrorState(this.msg);
}

class ProfileLoadingState extends AuthStates {}

class ProfileSuccessState extends AuthStates {}

class ProfileErrorState extends AuthStates {}

class LogoutLoadingState extends AuthStates {}

class LogoutSuccessState extends AuthStates {}

class LogoutErrorState extends AuthStates {
  String msg;

  LogoutErrorState(this.msg);
}

class CheckoutLoadingState extends AuthStates {}

class CheckoutSuccessState extends AuthStates {}

class CheckoutErrorState extends AuthStates {
  String msg;

  CheckoutErrorState(this.msg);
}

