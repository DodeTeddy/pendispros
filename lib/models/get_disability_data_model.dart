import 'dart:convert';

GetDisabilityDataModel getDisabilityDataModelFromJson(String str) => GetDisabilityDataModel.fromJson(json.decode(str));

String getDisabilityDataModelToJson(GetDisabilityDataModel data) => json.encode(data.toJson());

class GetDisabilityDataModel {
    GetDisabilityDataModel({
        required this.data,
    });

    List<Datum> data;

    factory GetDisabilityDataModel.fromJson(Map<String, dynamic> json) => GetDisabilityDataModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.name,
        required this.address,
        required this.phoneNumber,
        required this.age,
        required this.disability,
        required this.explanation,
        required this.user,
        required this.city,
        required this.province,
    });

    String name;
    String address;
    String phoneNumber;
    int age;
    String disability;
    String explanation;
    User user;
    City city;
    Province province;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        age: json["age"],
        disability: json["disability"],
        explanation: json["explanation"],
        user: User.fromJson(json["user"]),
        city: City.fromJson(json["city"]),
        province: Province.fromJson(json["province"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "phone_number": phoneNumber,
        "age": age,
        "disability": disability,
        "explanation": explanation,
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
        required this.username,
    });

    String email;
    String username;

    factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
    };
}