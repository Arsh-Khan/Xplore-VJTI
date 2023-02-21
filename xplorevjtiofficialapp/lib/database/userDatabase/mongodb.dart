import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:xplorevjtiofficialapp/database/userDatabase/MongoDBUserModel.dart';
import 'package:xplorevjtiofficialapp/database/dbhelper/constants.dart';

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
      log(e.toString());
      return "Something went wrong while inserting data";
    }
  }

  static Future<String> updatePassword(
      MongoDbUserModel data, String password) async {
    log("hello");
    var result = await userCollection.findOne({"_id": data.id});
    // result = result.last;
    log("mouse");
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

  // static Future<List<Map<String, dynamic>>> getUserIDQueryData(
  //     String id) async {
  //   final data = await userCollection.find(where.eq('_id', id)).toList();
  //   log(data.toString());
  //   return data;
  // }

  static Future<String> deleteUserData(MongoDbUserModel user) async {
    try {
      await userCollection.remove(user);
      return "User Deleted";
    } catch (_) {
      return "Error in Deleting User Data";
    }
  }

  static Future<void> updateUserData(MongoDbUserModel data) async {
    var result = await userCollection.findOne({"_id": data.id});
    result['name'] = data.name;
    result['regId'] = data.regId;
    result['dob'] = data.dob;
    result['branch'] = data.branch;

    var response = await userCollection.save(result);
    inspect(response);
  }
}
