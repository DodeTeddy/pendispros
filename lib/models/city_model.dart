import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
    CityModel({
        required this.message,
        required this.data,
    });

    String message;
    List<Datum> data;

    factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.provinceId,
        required this.name,
    });

    int id;
    int provinceId;
    String name;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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