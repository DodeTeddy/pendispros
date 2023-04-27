import 'dart:convert';

DeleteDsAndWsModel deleteDsAndWsModelFromJson(String str) => DeleteDsAndWsModel.fromJson(json.decode(str));

String deleteDsAndWsModelToJson(DeleteDsAndWsModel data) => json.encode(data.toJson());

class DeleteDsAndWsModel {
    String message;

    DeleteDsAndWsModel({
        required this.message,
    });

    factory DeleteDsAndWsModel.fromJson(Map<String, dynamic> json) => DeleteDsAndWsModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}