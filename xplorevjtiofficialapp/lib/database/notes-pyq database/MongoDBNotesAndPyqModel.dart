// To parse this JSON data, do
//
//     final mongoDbNotesAndPyqModel = mongoDbNotesAndPyqModelFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbNotesAndPyqModel mongoDbNotesAndPyqModelFromJson(String str) =>
    MongoDbNotesAndPyqModel.fromJson(json.decode(str));

String mongoDbNotesAndPyqModelToJson(MongoDbNotesAndPyqModel data) =>
    json.encode(data.toJson());

class MongoDbNotesAndPyqModel {
  MongoDbNotesAndPyqModel({
    required this.id,
    required this.email,
    required this.name,
    required this.notesANDpyqs,
    required this.year,
    required this.subject,
    required this.topic,
    required this.description,
    required this.timeofsubmission,
    required this.link,
  });

  ObjectId id;
  String? email;
  String? name;
  String? notesANDpyqs;
  String? year;
  String? subject;
  String? topic;
  String? description;
  String? timeofsubmission;
  String? link;

  factory MongoDbNotesAndPyqModel.fromJson(Map<String, dynamic> json) =>
      MongoDbNotesAndPyqModel(
        id: json["_id"],
        email: json["email"],
        name: json['name'],
        notesANDpyqs: json["notesANDpyqs"],
        year: json["year"],
        subject: json["subject"],
        topic: json["topic"],
        description: json["description"],
        timeofsubmission: json["timeofsubmission"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "notesANDpyqs": notesANDpyqs,
        "year": year,
        "subject": subject,
        "topic": topic,
        "description": description,
        "timeofsubmission": timeofsubmission,
        "link": link,
      };
}
