import 'dart:convert';

ProfileDetailModel profileDetailModelFromJson(String str) => ProfileDetailModel.fromJson(json.decode(str));

String profileDetailModelToJson(ProfileDetailModel data) => json.encode(data.toJson());

class ProfileDetailModel {
    ProfileDetailModel({
        required this.userId,
        required this.role,
        required this.username,
        required this.name,
        required this.phone,
        required this.verifiedAs,
        required this.disability,
    });

    int userId;
    String role;
    String username;
    String name;
    String phone;
    String verifiedAs;
    String disability;

    factory ProfileDetailModel.fromJson(Map<String, dynamic> json) => ProfileDetailModel(
        userId: json["user_id"] ?? '',
        role: json["role"] ?? '',
        username: json["username"] ?? '',
        name: json["name"] ?? '',
        phone: json["phone"] ?? '',
        verifiedAs: json["verified_as"] ?? '',
        disability: json["disability"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "role" : role,
        "username": username,
        "name": name,
        "phone": phone,
        "verified_as": verifiedAs,
        "disability": disability,
    };
}