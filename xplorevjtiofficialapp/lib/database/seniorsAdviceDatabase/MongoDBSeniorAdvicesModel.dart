// To parse this JSON data, do
//
//     final mongoDbSeniorAdviceModel = mongoDbSeniorAdviceModelFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbSeniorAdviceModel mongoDbSeniorAdviceModelFromJson(String str) =>
    MongoDbSeniorAdviceModel.fromJson(json.decode(str));

String mongoDbSeniorAdviceModelToJson(MongoDbSeniorAdviceModel data) =>
    json.encode(data.toJson());

class MongoDbSeniorAdviceModel {
  MongoDbSeniorAdviceModel({
    required this.id,
    required this.name,
    required this.email,
    required this.year,
    required this.time,
    required this.status,
    required this.message,
  });

  ObjectId id;
  String? name;
  String? email;
  String? year;
  String? time;
  String? status;
  String? message;

  factory MongoDbSeniorAdviceModel.fromJson(Map<String, dynamic> json) =>
      MongoDbSeniorAdviceModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        year: json["year"],
        time: json["time"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "year": year,
        "time": time,
        "status": status,
        "message": message,
      };
}
