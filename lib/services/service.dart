import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_akhir_app/models/get_disability_data_model.dart';
import '../models/city_model.dart';
import '../models/create_information_model.dart';
import '../models/delete_dsandws_model.dart';
import '../models/delete_information_model.dart';
import '../models/edit_profile_model.dart';
import '../models/get_information_model.dart';
import '../models/get_notification_model.dart';
import '../models/get_workshop_data_model.dart';
import '../models/logout_model.dart';
import '../models/profile_detail_model.dart';
import '../models/profile_model.dart';
import '../models/province_model.dart';
import '../models/sign_up_model.dart';
import '../models/login_model.dart';
import '../models/update_dsandws_model.dart';
import '../models/update_information_model.dart';
import '../models/verification_model.dart';

var baseUrl = 'http://127.0.0.1:8888/api'; //local
// var baseUrl = 'https://8d79-43-252-158-229.ngrok-free.app/api'; //ngrok
var headerNoAuth = {'Accept': 'application/json'};

Future<SignUpModel> signUp(
    String role, String username, String email, String password) async {
  var url = Uri.parse('$baseUrl/register');
  var body = {
    'role': role,
    'username': username,
    'email': email,
    'password': password
  };

  try {
    var response = await http.post(url, headers: headerNoAuth, body: body);

    return SignUpModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<LoginModel> login(String username, String password) async {
  var url = Uri.parse('$baseUrl/login');
  var body = {'username': username, 'password': password};

  try {
    var response = await http.post(url, headers: headerNoAuth, body: body);

    return LoginModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<LogoutModel> logout(String token) async {
  var url = Uri.parse('$baseUrl/logout');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  try {
    var response = await http.get(url, headers: header);

    return LogoutModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<ProfileModel> profile() async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/profile');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  try {
    var response = await http.get(url, headers: header);

    return ProfileModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<ProfileDetailModel> profileDetail() async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/profile/detail');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  try {
    var response = await http.get(url, headers: header);

    return ProfileDetailModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<ProvinceModel> province() async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/province');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
  try {
    var response = await http.get(url, headers: header);

    return ProvinceModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<CityModel> city(String provinceId) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
  var params = {'province_id': provinceId};
  var queryParams = Uri(queryParameters: params);
  var url = Uri.parse('$baseUrl/city$queryParams');

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
  String jenisAmputasiKanan,
  String jenisAmputasiKiri,
  String jenisProstetik,
) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/verification/disability');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
  var body = {
    'name': name,
    'city_id': cityId,
    'province_id': provinceId,
    'age': age,
    'address': address,
    'phone_number': phoneNumber,
    'disability': disability,
    'jenis_amputasi_kiri': jenisAmputasiKiri,
    'jenis_amputasi_kanan': jenisAmputasiKanan,
    'jenis_prostetik': jenisProstetik
  };

  try {
    var response = await http.post(url, headers: header, body: body);

    return VerificationModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<VerificationModel> workshopver(String name, String cityId,
    String provinceId, String address, String phoneNumber) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/verification/workshop');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
  var body = {
    'workshop_name': name,
    'city_id': cityId,
    'province_id': provinceId,
    'address': address,
    'phone_number': phoneNumber,
  };

  try {
    var response = await http.post(url, headers: header, body: body);

    return VerificationModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<EditProfileModel> editProfile(
    String username, String name, String email, String phone) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/profile/update');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
  var body = {
    'username': username,
    'name': name,
    'email': email,
    'phone': phone
  };

  try {
    var response = await http.post(url, headers: header, body: body);
    return EditProfileModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Stream<GetWorkshopDataModel> getDataWorkshop() async* {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/workshop');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  try {
    var response = await http.get(url, headers: header);
    yield GetWorkshopDataModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Stream<GetDisabilityDataModel> getDataDisability() async* {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/disability');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  try {
    var response = await http.get(url, headers: header);
    yield GetDisabilityDataModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<CreateInformationModel> createInformation(
    String title, String detail) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/information/create');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  var body = {'title_information': title, 'detail_information': detail};

  try {
    var response = await http.post(url, headers: header, body: body);
    return CreateInformationModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Stream<GetInformationModel> getInformation() async* {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/information/get');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  try {
    var response = await http.get(url, headers: header);
    yield GetInformationModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<UpdateInformationModel> updateInformation(
    String title, String detail, int id) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/information/update/$id');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  var body = {'title_information': title, 'detail_information': detail};

  try {
    var response = await http.post(url, headers: header, body: body);
    return UpdateInformationModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<DeleteInformationModel> deleteInformation(int id) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/information/delete/$id');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  try {
    var response = await http.delete(url, headers: header);
    return DeleteInformationModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<GetNotificationModel> getNotification() async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/notification');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  try {
    var response = await http.get(url, headers: header);
    return GetNotificationModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<UpadateDsAndWsModel> updateDisability(
    String id,
    String cityId,
    String provinceId,
    String name,
    String address,
    String phoneNumber,
    String age,
    String disability,
    String jenisAmputasiKanan,
    String jenisAmputasiKiri,
    String jenisProstetik,
  ) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/disability/update/$id');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  var body = {
    'city_id': cityId,
    'province_id': provinceId,
    'name': name,
    'address': address,
    'phone_number': phoneNumber,
    'age': age,
    'disability': disability,
    'jenis_amputasi_kiri': jenisAmputasiKiri,
    'jenis_amputasi_kanan': jenisAmputasiKanan,
    'jenis_prostetik': jenisProstetik
  };

  try {
    var response = await http.post(url, headers: header, body: body);
    return UpadateDsAndWsModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<DeleteDsAndWsModel> deleteDisability(int id) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/disability/delete/$id');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  try {
    var response = await http.delete(url, headers: header);
    return DeleteDsAndWsModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<UpadateDsAndWsModel> updateProsthetic(
  String id,
  String cityId,
  String provinceId,
  String workshopName,
  String address,
  String phoneNumber,
) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/workshop/update/$id');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  var body = {
    'city_id': cityId,
    'province_id': provinceId,
    'workshop_name': workshopName,
    'address': address,
    'phone_number': phoneNumber,
  };

  try {
    var response = await http.post(url, headers: header, body: body);
    return UpadateDsAndWsModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}

Future<DeleteDsAndWsModel> deleteProsthetic(int id) async {
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  var url = Uri.parse('$baseUrl/workshop/delete/$id');
  var header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  try {
    var response = await http.delete(url, headers: header);
    return DeleteDsAndWsModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }
}
