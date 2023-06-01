import 'dart:convert';

GetInformationModel getInformationModelFromJson(String str) =>
    GetInformationModel.fromJson(json.decode(str));

String getInformationModelToJson(GetInformationModel data) =>
    json.encode(data.toJson());

class GetInformationModel {
  GetInformationModel({
    required this.message,
    required this.data,
  });

  String message;
  List<Datum> data;

  factory GetInformationModel.fromJson(Map<String, dynamic> json) =>
      GetInformationModel(
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
    required this.createBy,
    required this.titleInformation,
    required this.detailInformation,
  });

  int id;
  int createBy;
  String titleInformation;
  String detailInformation;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        createBy: json["create_by"],
        titleInformation: json["title_information"],
        detailInformation: json["detail_information"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "create_by": createBy,
        "title_information": titleInformation,
        "detail_information": detailInformation,
      };
}
