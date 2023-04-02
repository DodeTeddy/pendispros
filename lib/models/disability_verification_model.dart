import 'dart:convert';

DisabilityVerificationModel disabilityVerificationModelFromJson(String str) => DisabilityVerificationModel.fromJson(json.decode(str));

String disabilityVerificationModelToJson(DisabilityVerificationModel data) => json.encode(data.toJson());

class DisabilityVerificationModel {
    DisabilityVerificationModel({
        required this.message,
    });

    String message;

    factory DisabilityVerificationModel.fromJson(Map<String, dynamic> json) => DisabilityVerificationModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}