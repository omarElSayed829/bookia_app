import 'package:bookia_app/feature/auth/presentation/data/model/request/login_model.dart';
import 'package:bookia_app/feature/auth/presentation/data/model/request/signUp_model.dart';

class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginModelParams params;

  LoginEvent(this.params);
}


class SignUpEvent extends AuthEvent{

final SignUpModelParams params;

SignUpEvent(this.params);


}