import 'dart:convert';

GetDisabilityDataModel getDisabilityDataModelFromJson(String str) =>
    GetDisabilityDataModel.fromJson(json.decode(str));

String getDisabilityDataModelToJson(GetDisabilityDataModel data) =>
    json.encode(data.toJson());

class GetDisabilityDataModel {
  String message;
  List<Datum> data;

  GetDisabilityDataModel({
    required this.message,
    required this.data,
  });

  factory GetDisabilityDataModel.fromJson(Map<String, dynamic> json) =>
      GetDisabilityDataModel(
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

  Datum({
    required this.id,
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
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
