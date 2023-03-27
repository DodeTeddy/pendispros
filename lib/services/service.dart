import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/logout_model.dart';
import '../models/profile_model.dart';
import '../models/sign_up_model.dart';
import '../models/login_model.dart';

var baseUrl = 'http://127.0.0.1:8888/api';
var headerNoAuth = {
  'Accept' : 'application/json'
};

Future<SignUpModel> signUp(String role, String username, String email, String password)async{
  var url = Uri.parse('$baseUrl/register');
  var body = {
    'role' : role,
    'username' : username,
    'email' : email,
    'password' : password
  };

  try {
    var response = await http.post(
      url,
      headers: headerNoAuth,
      body: body
    );
    
    return SignUpModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }

}

Future<LoginModel> login(String login, String password)async{
  var url = Uri.parse('$baseUrl/login');
  var body = {
    'login' : login,
    'password' : password
  };

  try {
    var response = await http.post(
      url,
      headers: headerNoAuth,
      body: body
    );

    return LoginModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<LogoutModel> logout(String token)async{
  var url = Uri.parse('$baseUrl/logout');
  var header = {
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };

  try {
    var response = await http.get(
      url,
      headers: header
    );

    return LogoutModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<ProfileModel> profile()async{
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/profile');
  var header = {
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };

  try {
    var response = await http.get(
      url,
      headers: header
    );

    return ProfileModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}