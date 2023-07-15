import 'dart:convert';

GetLatestDataModel getLatestDataModelFromJson(String str) =>
    GetLatestDataModel.fromJson(json.decode(str));

String getLatestDataModelToJson(GetLatestDataModel data) =>
    json.encode(data.toJson());

class GetLatestDataModel {
  String message;
  List<Disability> disability;
  List<Prosthetic> prosthetic;

  GetLatestDataModel({
    required this.message,
    required this.disability,
    required this.prosthetic,
  });

  factory GetLatestDataModel.fromJson(Map<String, dynamic> json) =>
      GetLatestDataModel(
        message: json["message"],
        disability: List<Disability>.from(
            json["disability"].map((x) => Disability.fromJson(x))),
        prosthetic: List<Prosthetic>.from(
            json["prosthetic"].map((x) => Prosthetic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "disability": List<dynamic>.from(disability.map((x) => x.toJson())),
        "prosthetic": List<dynamic>.from(prosthetic.map((x) => x.toJson())),
      };
}

class Disability {
  int id;
  int userId;
  int cityId;
  int provinceId;
  String name;
  String address;
  String phoneNumber;
  int age;
  String disability;
  String jenisAmputasiKiri;
  String jenisAmputasiKanan;
  String jenisProstetik;
  User user;
  City city;
  Province province;

  Disability({
    required this.id,
    required this.userId,
    required this.cityId,
    required this.provinceId,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.age,
    required this.disability,
    required this.jenisAmputasiKiri,
    required this.jenisAmputasiKanan,
    required this.jenisProstetik,
    required this.user,
    required this.city,
    required this.province,
  });

  factory Disability.fromJson(Map<String, dynamic> json) => Disability(
        id: json["id"],
        userId: json["user_id"],
        cityId: json["city_id"],
        provinceId: json["province_id"],
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        age: json["age"],
        disability: json["disability"],
        jenisAmputasiKiri: json["jenis_amputasi_kiri"],
        jenisAmputasiKanan: json["jenis_amputasi_kanan"],
        jenisProstetik: json["jenis_prostetik"],
        user: User.fromJson(json["user"]),
        city: City.fromJson(json["city"]),
        province: Province.fromJson(json["province"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "city_id": cityId,
        "province_id": provinceId,
        "name": name,
        "address": address,
        "phone_number": phoneNumber,
        "age": age,
        "disability": disability,
        "jenis_amputasi_kiri": jenisAmputasiKiri,
        "jenis_amputasi_kanan": jenisAmputasiKanan,
        "jenis_prostetik": jenisProstetik,
        "user": user.toJson(),
        "city": city.toJson(),
        "province": province.toJson(),
      };
}

class City {
  int id;
  int provinceId;
  String name;

  City({
    required this.id,
    required this.provinceId,
    required this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        provinceId: json["province_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "province_id": provinceId,
        "name": name,
      };
}

class Province {
  int id;
  String provinceName;

  Province({
    required this.id,
    required this.provinceName,
  });

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: json["id"],
        provinceName: json["province_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "province_name": provinceName,
      };
}

class User {
  int id;
  String role;
  String verifiedAs;
  String email;
  String username;

  User({
    required this.id,
    required this.role,
    required this.verifiedAs,
    required this.email,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        role: json["role"],
        verifiedAs: json["verified_as"],
        email: json["email"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "verified_as": verifiedAs,
        "email": email,
        "username": username,
      };
}

class Prosthetic {
  int id;
  int userId;
  int cityId;
  int provinceId;
  String workshopName;
  String address;
  String phoneNumber;
  User user;
  City city;
  Province province;

  Prosthetic({
    required this.id,
    required this.userId,
    required this.cityId,
    required this.provinceId,
    required this.workshopName,
    required this.address,
    required this.phoneNumber,
    required this.user,
    required this.city,
    required this.province,
  });

  factory Prosthetic.fromJson(Map<String, dynamic> json) => Prosthetic(
        id: json["id"],
        userId: json["user_id"],
        cityId: json["city_id"],
        provinceId: json["province_id"],
        workshopName: json["workshop_name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        user: User.fromJson(json["user"]),
        city: City.fromJson(json["city"]),
        province: Province.fromJson(json["province"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "city_id": cityId,
        "province_id": provinceId,
        "workshop_name": workshopName,
        "address": address,
        "phone_number": phoneNumber,
        "user": user.toJson(),
        "city": city.toJson(),
        "province": province.toJson(),
      };
}
