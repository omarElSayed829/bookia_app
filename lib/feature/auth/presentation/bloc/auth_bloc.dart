import 'package:bookia_app/core/services/local_storage/local_storage.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_events.dart';
import 'package:bookia_app/feature/auth/presentation/bloc/auth_state.dart';
import 'package:bookia_app/feature/auth/presentation/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(login);
    on<SignUpEvent>(signUp);
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    await AuthRepo.login(event.params).then((value) {
      if (value != null) {
        AppLocalStorage.cachedData(
            key: AppLocalStorage.token, value: value.data?.token);
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState("Login Error"));
      }
    });
  }

  Future<void> signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(SignUpLoadingState());

    await SignUpRepo.getSignUp(event.params).then((value) {
      if (value != null) {
        AppLocalStorage.cachedData(
            key: AppLocalStorage.token, value: value.data?.token);
        emit(SignUpSuccessState());
      } else {
        emit(SignUpErrorState("SignUp Failed"));
      }
    });
  }
}
