import 'dart:convert';

VerificationModel disabilityVerificationModelFromJson(String str) => VerificationModel.fromJson(json.decode(str));

String disabilityVerificationModelToJson(VerificationModel data) => json.encode(data.toJson());

class VerificationModel {
    VerificationModel({
        required this.message,
    });

    String message;

    factory VerificationModel.fromJson(Map<String, dynamic> json) => VerificationModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}