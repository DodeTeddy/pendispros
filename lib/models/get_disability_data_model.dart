import 'dart:convert';

GetDisabilityDataModel getDisabilityDataModelFromJson(String str) => GetDisabilityDataModel.fromJson(json.decode(str));

String getDisabilityDataModelToJson(GetDisabilityDataModel data) => json.encode(data.toJson());

class GetDisabilityDataModel {
    String message;
    List<Datum> data;

    GetDisabilityDataModel({
        required this.message,
        required this.data,
    });

    factory GetDisabilityDataModel.fromJson(Map<String, dynamic> json) => GetDisabilityDataModel(
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

    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.role,
        required this.verifiedAs,
        required this.email,
        required this.username,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        role: json["role"],
        verifiedAs: json["verified_as"],
        email: json["email"],
        username: json["username"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "verified_as": verifiedAs,
        "email": email,
        "username": username,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
