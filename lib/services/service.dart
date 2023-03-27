import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/logout_model.dart';
import '../models/sign_up_model.dart';
import '../models/login_model.dart';

// ip localhost for android : 192.168.0.100 || for ios : 127.0.0.1

var baseUrl = 'http://127.0.0.1:8888/';
var headerNoAuth = {
  'Accept' : 'application/json'
};

Future<SignUpModel> signUp(String role, String username, String email, String password)async{
  var url = Uri.parse('${baseUrl}api/register');
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
  var url = Uri.parse('${baseUrl}api/login');
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
  var url = Uri.parse('${baseUrl}api/logout');
  var headerAuth = {
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };

  try {
    var response = await http.get(
      url,
      headers: headerAuth
    );

    return LogoutModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}