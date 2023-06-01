import 'dart:convert';

ProvinceModel provinceModelFromJson(String str) =>
    ProvinceModel.fromJson(json.decode(str));

String provinceModelToJson(ProvinceModel data) => json.encode(data.toJson());

class ProvinceModel {
  ProvinceModel({
    required this.message,
    required this.data,
  });

  String message;
  List<Datum> data;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
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
    required this.provinceName,
  });

  int id;
  String provinceName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        provinceName: json["province_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "province_name": provinceName,
      };
}
