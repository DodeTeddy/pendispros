// To parse this JSON data, do
//
//     final getWorkshopDataModel = getWorkshopDataModelFromJson(jsonString);

import 'dart:convert';

GetWorkshopDataModel getWorkshopDataModelFromJson(String str) =>
    GetWorkshopDataModel.fromJson(json.decode(str));

String getWorkshopDataModelToJson(GetWorkshopDataModel data) =>
    json.encode(data.toJson());

class GetWorkshopDataModel {
  String message;
  List<Datum> data;

  GetWorkshopDataModel({
    required this.message,
    required this.data,
  });

  factory GetWorkshopDataModel.fromJson(Map<String, dynamic> json) =>
      GetWorkshopDataModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String workshopName;
  String address;
  String phoneNumber;
  User user;
  City city;
  Province province;

  Datum({
    required this.id,
    required this.workshopName,
    required this.address,
    required this.phoneNumber,
    required this.user,
    required this.city,
    required this.province,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        workshopName: json["workshop_name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        user: User.fromJson(json["user"]),
        city: City.fromJson(json["city"]),
        province: Province.fromJson(json["province"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "workshop_name": workshopName,
        "address": address,
        "phone_number": phoneNumber,
        "user": user.toJson(),
        "city": city.toJson(),
        "province": province.toJson(),
      };
}

class City {
  String name;

  City({
    required this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Province {
  String provinceName;

  Province({
    required this.provinceName,
  });

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        provinceName: json["province_name"],
      );

  Map<String, dynamic> toJson() => {
        "province_name": provinceName,
      };
}

class User {
  String role;
  String verifiedAs;
  String email;
  String username;

  User({
    required this.role,
    required this.verifiedAs,
    required this.email,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        role: json["role"],
        verifiedAs: json["verified_as"],
        email: json["email"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "verified_as": verifiedAs,
        "email": email,
        "username": username,
      };
}
