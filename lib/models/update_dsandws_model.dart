import 'dart:convert';

UpadateDsAndWsModel upadateDsAndWsModelFromJson(String str) =>
    UpadateDsAndWsModel.fromJson(json.decode(str));

String upadateDsAndWsModelToJson(UpadateDsAndWsModel data) =>
    json.encode(data.toJson());

class UpadateDsAndWsModel {
  String message;

  UpadateDsAndWsModel({
    required this.message,
  });

  factory UpadateDsAndWsModel.fromJson(Map<String, dynamic> json) =>
      UpadateDsAndWsModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
