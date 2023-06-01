import 'dart:convert';

CreateInformationModel createInformationModelFromJson(String str) =>
    CreateInformationModel.fromJson(json.decode(str));

String createInformationModelToJson(CreateInformationModel data) =>
    json.encode(data.toJson());

class CreateInformationModel {
  CreateInformationModel({
    required this.message,
  });

  String message;

  factory CreateInformationModel.fromJson(Map<String, dynamic> json) =>
      CreateInformationModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
