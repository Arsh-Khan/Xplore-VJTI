// To parse this JSON data, do
//
//     final mongoDbUserModel = mongoDbUserModelFromJson(jsonString);

import 'dart:convert';

MongoDbUserModel mongoDbUserModelFromJson(String str) =>
    MongoDbUserModel.fromJson(json.decode(str));

String mongoDbUserModelToJson(MongoDbUserModel data) =>
    json.encode(data.toJson());

class MongoDbUserModel {
  MongoDbUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.regId,
    required this.branch,
    required this.dob,
    required this.password,
  });

  Object id;
  String? name;
  String? email;
  String? regId;
  String? branch;
  String? dob;
  String? password;

  factory MongoDbUserModel.fromJson(Map<String, dynamic> json) =>
      MongoDbUserModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        regId: json["regId"],
        branch: json["branch"],
        dob: json["dob"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "regId": regId,
        "branch": branch,
        "dob": dob,
        "password": password,
      };
}
