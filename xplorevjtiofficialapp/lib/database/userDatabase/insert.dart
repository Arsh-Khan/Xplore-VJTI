import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:xplorevjtiofficialapp/database/userDatabase/MongoDBUserModel.dart';
import 'package:xplorevjtiofficialapp/database/userDatabase/mongodb.dart';

// class MongoDBInsert {
//   MongoDBInsert(
//       {required String name,
//       required String email,
//       required String regId,
//       required String branch,
//       required String dob,
//       required String password});

//   factory MongoDBInsert.UserData()=> MongoDBInsert(name: name, email: email, regId: regId, branch: branch, dob: dob, password: password);

// }

Future<String> insertUserData(
    {required String name,
    required String email,
    required String regId,
    required String branch,
    required String dob,
    required String password}) async {
  var _id = M.ObjectId(); // this will use for unique id
  final data = MongoDbUserModel(
      id: _id,
      name: name,
      email: email,
      regId: regId,
      branch: branch,
      dob: dob,
      password: password.hashCode.toString());

  var result = await MongoDatabase.insert(data);
  return result;
}
