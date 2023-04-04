import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/city_model.dart';
import '../models/logout_model.dart';
import '../models/profile_detail_model.dart';
import '../models/profile_model.dart';
import '../models/province_model.dart';
import '../models/sign_up_model.dart';
import '../models/login_model.dart';
import '../models/verification_model.dart';

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

Future<LoginModel> login(String username, String password)async{
  var url = Uri.parse('$baseUrl/login');
  var body = {
    'username' : username,
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

Future<ProfileDetailModel> profileDetail()async{
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/profile/detail');
  var header = {
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };

  try {
    var response = await http.get(
      url,
      headers: header
    );

    return ProfileDetailModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<ProvinceModel> province()async{
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/province');
  var header = {
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };
  try {
    var response = await http.get(
      url,
      headers: header
    );

    return ProvinceModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<CityModel> city(String provinceId)async{
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var header = {
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };
  var params = {
    'province_id' : provinceId
  };
  var queryParams = Uri(queryParameters: params);
  var url = Uri.parse('$baseUrl/city/$queryParams');
  
  try {
    var response = await http.get(
      url,
      headers: header,
    );

    return CityModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<VerificationModel> disabilityver(
  String name, 
  String cityId, 
  String provinceId, 
  String age, 
  String address, 
  String phoneNumber, 
  String disability, 
  String explanation
)async{
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/verification/disability');
  var header = {
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };
  var body = {
    'name' : name,
    'city_id' : cityId,
    'province_id' : provinceId,
    'age' : age,
    'address' : address,
    'phone_number' : phoneNumber,
    'disability' : disability,
    'explanation' : explanation
  };

  try {
    var response = await http.post(
      url,
      headers: header,
      body: body
    );

    return VerificationModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<VerificationModel> workshopver(
  String name, 
  String cityId, 
  String provinceId,
  String address, 
  String phoneNumber
)async{
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/verification/workshop');
  var header = {
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };
  var body = {
    'workshop_name' : name,
    'city_id' : cityId,
    'province_id' : provinceId,
    'address' : address,
    'phone_number' : phoneNumber,
  };

  try {
    var response = await http.post(
      url,
      headers: header,
      body: body
    );

    return VerificationModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}