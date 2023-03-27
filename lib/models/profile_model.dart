import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        required this.id,
        required this.role,
        required this.verifiedAs,
        required this.username,
        required this.email,
    });

    int id;
    String role;
    String verifiedAs;
    String username;
    String email;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"] ?? 0,
        role: json["role"] ?? '',
        verifiedAs: json["verified_as"]?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "verified_as": verifiedAs,
        "username": username,
        "email": email,
    };
}