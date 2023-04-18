import 'dart:convert';

DeleteInformationModel deleteInformationModelFromJson(String str) => DeleteInformationModel.fromJson(json.decode(str));

String deleteInformationModelToJson(DeleteInformationModel data) => json.encode(data.toJson());

class DeleteInformationModel {
    DeleteInformationModel({
        required this.message,
    });

    String message;

    factory DeleteInformationModel.fromJson(Map<String, dynamic> json) => DeleteInformationModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
