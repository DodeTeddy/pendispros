import 'dart:convert';

GetNotificationModel getNotificationModelFromJson(String str) =>
    GetNotificationModel.fromJson(json.decode(str));

String getNotificationModelToJson(GetNotificationModel data) =>
    json.encode(data.toJson());

class GetNotificationModel {
  String message;
  List<Datum> data;

  GetNotificationModel({
    required this.message,
    required this.data,
  });

  factory GetNotificationModel.fromJson(Map<String, dynamic> json) =>
      GetNotificationModel(
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
  int createBy;
  String titleInformation;
  String detailInformation;
  String verifiedStatus;
  User user;

  Datum({
    required this.id,
    required this.createBy,
    required this.titleInformation,
    required this.detailInformation,
    required this.verifiedStatus,
    required this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        createBy: json["create_by"],
        titleInformation: json["title_information"],
        detailInformation: json["detail_information"],
        verifiedStatus: json["verified_status"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "create_by": createBy,
        "title_information": titleInformation,
        "detail_information": detailInformation,
        "verified_status": verifiedStatus,
        "user": user.toJson(),
      };
}

class User {
  String username;

  User({
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}
