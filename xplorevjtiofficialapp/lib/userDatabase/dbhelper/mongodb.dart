import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:xplorevjtiofficialapp/userDatabase/MongoDBUserModel.dart';
import 'package:xplorevjtiofficialapp/userDatabase/dbhelper/constants.dart';

class MongoDatabase {
  static var db, userCollection;

  //function to connect to database
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<String> insert(MongoDbUserModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "User ${data.id} + ${data.regId} is Registered";
      } else {
        return "Something went wrong while inserting data";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static Future<String> update(MongoDbUserModel data, String password) async {
    var result = await userCollection.findOne({"email": data.email});
    result['password'] = password;

    var response = await userCollection.save(result);
    if (response != "") {
      return "User ${data.id} + ${data.regId} is Updated";
    } else {
      return "Something went wrong while updating data";
    }
  }

  static Future<List<Map<String, dynamic>>> getUserQueryData(
      String email) async {
    final data = await userCollection.find(where.eq('email', email)).toList();
    log(data.toString());
    return data;
  }
}
