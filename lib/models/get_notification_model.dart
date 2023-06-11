import 'dart:convert';

GetNotificationModel getNotificationModelFromJson(String str) => GetNotificationModel.fromJson(json.decode(str));

String getNotificationModelToJson(GetNotificationModel data) => json.encode(data.toJson());

class GetNotificationModel {
    String message;
    Data data;

    GetNotificationModel({
        required this.message,
        required this.data,
    });

    factory GetNotificationModel.fromJson(Map<String, dynamic> json) => GetNotificationModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int currentPage;
    List<Datum> data;

    Data({
        required this.currentPage,
        required this.data,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    int createBy;
    String titleInformation;
    String detailInformation;
    User user;

    Datum({
        required this.id,
        required this.createBy,
        required this.titleInformation,
        required this.detailInformation,
        required this.user,
    });

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