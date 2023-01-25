import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:xplorevjtiofficialapp/database/dbhelper/constants.dart';
import 'package:xplorevjtiofficialapp/database/seniorsAdviceDatabase/MongoDBSeniorAdvicesModel.dart';

class MongoSeniorAdviceDatabase {
  static var db, seniorAdviceCollection;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    seniorAdviceCollection = db.collection(SENIOR_ADVICE_COLLECTION);
  }

  static Future<String> insert(MongoDbSeniorAdviceModel data) async {
    try {
      var result = await seniorAdviceCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        return "Something went wrong while inserting data";
      }
    } catch (_) {
      log(_.toString());
      return "Something went wrong while inserting data";
    }
  }

  static Future<void> update(MongoDbSeniorAdviceModel data) async {
    var result = await seniorAdviceCollection.findOne({"_id": data.id});
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await seniorAdviceCollection.find().toList();
    return arrData;
  }

  static Future<List<Map<String, dynamic>>> queryData() async {
    final data = await seniorAdviceCollection.distant('email').toList();
    return data;
  }
}
