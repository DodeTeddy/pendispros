import 'dart:convert';

LogoutModel logoutModelFromJson(String str) =>
    LogoutModel.fromJson(json.decode(str));

String logoutModelToJson(LogoutModel data) => json.encode(data.toJson());

class LogoutModel {
  LogoutModel({
    required this.message,
  });

  String message;

  factory LogoutModel.fromJson(Map<String, dynamic> json) => LogoutModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
