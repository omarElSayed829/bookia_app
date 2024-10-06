import 'package:bookia_app/core/services/Dio/dio_providor.dart';
import 'package:bookia_app/feature/auth/presentation/data/model/request/login_model.dart';
import 'package:bookia_app/feature/auth/presentation/data/model/request/signUp_model.dart';
import 'package:bookia_app/feature/auth/presentation/data/model/response/auth_model_response/auth_model_response.dart';

import 'package:bookia_app/feature/auth/presentation/data/repo/auth_endpoints.dart';

class AuthRepo {
  static Future<AuthModelResponse?> login(LoginModelParams params) async {
    try {
      var response = await DioProvidor.post(
          endPoint: AppEndPoints.login, data: params.toJson());

      if (response.statusCode == 200) {
        var model = AuthModelResponse.fromJson(response.data);
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      return null;
    }
  }
}

class SignUpRepo {
  static Future<AuthModelResponse?> getSignUp(SignUpModelParams params) async {
    var response = await DioProvidor.post(
        endPoint: AppEndPoints.signUp, data: params.toJson());

    if (response.statusCode == 201) {
      var model = AuthModelResponse.fromJson(response.data);
      return model;
    } else {
      return null;
    }
  }
}
