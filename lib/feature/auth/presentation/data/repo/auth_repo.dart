import 'dart:convert';
import 'dart:math';

import 'package:bookia_app/core/constants/auth_constants.dart';
import 'package:bookia_app/feature/auth/presentation/data/model/request/login_model.dart';
import 'package:bookia_app/feature/auth/presentation/data/model/request/signUp_model.dart';
import 'package:bookia_app/feature/auth/presentation/data/model/response/login_response/login_response.dart';
import 'package:bookia_app/feature/auth/presentation/data/repo/auth_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static Future<bool> login(LoginModelParams params) async {
    try {
      var url = Uri.parse(AppConstants.baseUrl + AppEndPoints.login);
      var response = await http.post(url, body: params.toJson());

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var model = LoginResponse.fromJson(jsonResponse);
        var pref = await SharedPreferences.getInstance();
        pref.setString("token", model.data?.token??"");
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      return false;
    }
  }
}


class SignUpRepo {
 
static Future<bool> getSignUp (SignUpModelParams params) async{

var url = Uri.parse(AppConstants.baseUrl+AppEndPoints.signUp);
var response = await http.post(url,body:params.toJson() );

if (response.statusCode ==201){
  return true;

} else  {
  return false;
}

}


}