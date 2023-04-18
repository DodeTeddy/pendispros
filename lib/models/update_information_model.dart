import 'dart:convert';

UpdateInformationModel updateInformationModelFromJson(String str) => UpdateInformationModel.fromJson(json.decode(str));

String updateInformationModelToJson(UpdateInformationModel data) => json.encode(data.toJson());

class UpdateInformationModel {
    UpdateInformationModel({
        required this.message,
    });

    String message;

    factory UpdateInformationModel.fromJson(Map<String, dynamic> json) => UpdateInformationModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
