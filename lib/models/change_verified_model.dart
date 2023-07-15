import 'dart:convert';

ChangeVerifiedModel changeVerifiedModelFromJson(String str) =>
    ChangeVerifiedModel.fromJson(json.decode(str));

String changeVerifiedModelToJson(ChangeVerifiedModel data) =>
    json.encode(data.toJson());

class ChangeVerifiedModel {
  String message;

  ChangeVerifiedModel({
    required this.message,
  });

  factory ChangeVerifiedModel.fromJson(Map<String, dynamic> json) =>
      ChangeVerifiedModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
