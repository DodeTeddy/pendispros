import 'dart:convert';

GetWorkshopDataModel getWorkshopDataModelFromJson(String str) => GetWorkshopDataModel.fromJson(json.decode(str));

String getWorkshopDataModelToJson(GetWorkshopDataModel data) => json.encode(data.toJson());

class GetWorkshopDataModel {
    GetWorkshopDataModel({
        required this.data,
    });

    List<Datum> data;

    factory GetWorkshopDataModel.fromJson(Map<String, dynamic> json) => GetWorkshopDataModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.workshopName,
        required this.address,
        required this.phoneNumber,
        required this.user,
        required this.city,
        required this.province,
    });

    String workshopName;
    String address;
    String phoneNumber;
    User user;
    City city;
    Province province;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        workshopName: json["workshop_name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        user: User.fromJson(json["user"]),
        city: City.fromJson(json["city"]),
        province: Province.fromJson(json["province"]),
    );

    Map<String, dynamic> toJson() => {
        "workshop_name": workshopName,
        "address": address,
        "phone_number": phoneNumber,
        "user": user.toJson(),
        "city": city.toJson(),
        "province": province.toJson(),
    };
}

class City {
    City({
        required this.name,
    });

    String name;

    factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class Province {
    Province({
        required this.provinceName,
    });

    String provinceName;

    factory Province.fromJson(Map<String, dynamic> json) => Province(
        provinceName: json["province_name"],
    );

    Map<String, dynamic> toJson() => {
        "province_name": provinceName,
    };
}

class User {
    User({
        required this.email,
    });

    String email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
    };
}