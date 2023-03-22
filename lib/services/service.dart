import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tugas_akhir_app/models/sign_up_model.dart';

var baseUrl = 'http://127.0.0.1:8888/';

Future<SignUpModel> signUp(String role, String username, String email, String password)async{
  var url = Uri.parse('${baseUrl}api/register');
  var header = {
    'Accept' : 'application/json'
  };

  var body = {
    'role' : role,
    'username' : username,
    'email' : email,
    'password' : password
  };

  try {
    var response = await http.post(
      url,
      headers: header,
      body: body
    );
    return SignUpModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    rethrow;
  }

}