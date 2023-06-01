import 'dart:convert';

GetNotificationModel getNotificationModelFromJson(String str) =>
    GetNotificationModel.fromJson(json.decode(str));

String getNotificationModelToJson(GetNotificationModel data) =>
    json.encode(data.toJson());

class GetNotificationModel {
  GetNotificationModel({
    required this.message,
    required this.data,
  });

  String message;
  List<Datum> data;

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
  Datum({
    required this.id,
    required this.createBy,
    required this.titleInformation,
    required this.detailInformation,
    required this.user,
  });

  int id;
  int createBy;
  String titleInformation;
  String detailInformation;
  User user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        createBy: json["create_by"],
        titleInformation: json["title_information"],
        detailInformation: json["detail_information"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "create_by": createBy,
        "title_information": titleInformation,
        "detail_information": detailInformation,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.username,
  });

  String username;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}
