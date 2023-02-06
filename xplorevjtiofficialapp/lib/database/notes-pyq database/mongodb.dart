import 'dart:developer';
import 'package:xplorevjtiofficialapp/database/dbhelper/constants.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/MongoDBNotesAndPyqModel.dart';

class MongoNotesAndPyqDatabase {
  static var db, notesandpyqCollection;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    notesandpyqCollection = db.collection(NOTES_PYQ_COLLECTION);
  }

  static Future<String> insert(MongoDbNotesAndPyqModel data) async {
    try {
      var result = await notesandpyqCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        return "Something went wrong while inserting data";
      }
    } catch (e) {
      log(e.toString());
      return "Something went wrong while inserting data";
    }
  }

  static Future<void> update(MongoDbNotesAndPyqModel data) async {
    var result = await notesandpyqCollection.findOne({"_id": data.id});
    result['name'] = data.name;
    result['notesANDpyqs'] = data.notesANDpyqs;
    result['year'] = data.year;
    result['branch'] = data.branch;
    result['subject'] = data.subject;
    result['topic'] = data.topic;
    result['description'] = data.description;
    result['timeofsubmission'] = data.timeofsubmission;
    result['link'] = data.link;

    var response = await notesandpyqCollection.save(result);
    inspect(response);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await notesandpyqCollection.find().toList();
    return arrData;
  }

  static delete(MongoDbNotesAndPyqModel user) async {
    await notesandpyqCollection.remove(where.id(user.id));
  }

  static Future<List<Map<String, dynamic>>> getQueryData(
      String query, String parameter) async {
    final data =
        await notesandpyqCollection.find(where.eq(query, parameter)).toList();
    log(data.toString());
    return data;
  }
}
