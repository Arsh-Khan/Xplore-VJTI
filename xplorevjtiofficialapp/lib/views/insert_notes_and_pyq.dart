import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/MongoDBNotesAndPyqModel.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/mongodb.dart';
import 'package:xplorevjtiofficialapp/services/auth/user_details.dart';

class InsertNotesAndPyqView extends StatefulWidget {
  const InsertNotesAndPyqView({super.key});

  @override
  State<InsertNotesAndPyqView> createState() => _InsertNotesAndPyqViewState();
}

class _InsertNotesAndPyqViewState extends State<InsertNotesAndPyqView> {
  var nameController = new TextEditingController();
  var emailController = new TextEditingController();
  var typeController = new TextEditingController();
  var yearController = new TextEditingController();
  var subjectController = new TextEditingController();
  var topicController = new TextEditingController();
  var descriptionController = new TextEditingController();
  var timeofsubmissionController = new TextEditingController();
  var linkController = new TextEditingController();
  var _checkInsertUpdate = "Insert";

  @override
  Widget build(BuildContext context) {
    //getting arguments from previous page and store inside variable
    MongoDbNotesAndPyqModel? data =
        ModalRoute.of(context)!.settings.arguments as MongoDbNotesAndPyqModel;
    log(data.toString());

    if (data.name != 'null' &&
        data.email != 'null' &&
        data.notesANDpyqs != 'null' &&
        data.year != 'null' &&
        data.subject != 'null' &&
        data.topic != 'null' &&
        data.description != 'null' &&
        data.timeofsubmission != 'null' &&
        data.link != 'null') {
      nameController.text = data.name!;
      emailController.text = data.email!;
      typeController.text = data.notesANDpyqs!;
      yearController.text = data.year!;
      subjectController.text = data.subject!;
      topicController.text = data.topic!;
      descriptionController.text = data.description!;
      timeofsubmissionController.text = data.timeofsubmission!;
      linkController.text = data.link!;
      _checkInsertUpdate = "Update";
    }
    return FutureBuilder(
        future: userDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SafeArea(
                child: Center(
              child: CircularProgressIndicator(),
            ));
          } else {
            if (snapshot.hasData) {
              timeofsubmissionController.text = DateTime.now().toString();
              if (nameController.text == 'null' ||
                  emailController.text == 'null' ||
                  nameController.text == '' ||
                  emailController.text == '') {
                nameController.text = snapshot.data['name'];
                emailController.text = snapshot.data['email'];
              }
              return Scaffold(
                body: SingleChildScrollView(
                  child: SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      // contextignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          _checkInsertUpdate,
                          style: TextStyle(fontSize: 22),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: timeofsubmissionController.text),
                        ),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(labelText: "Name"),
                        ),
                        TextField(
                          decoration:
                              InputDecoration(labelText: emailController.text),
                        ),
                        TextField(
                          controller: typeController,
                          decoration:
                              InputDecoration(labelText: "NOTES or PYQ"),
                        ),
                        TextField(
                          controller: yearController,
                          decoration:
                              InputDecoration(labelText: "Which Year Notes"),
                        ),
                        TextField(
                          controller: subjectController,
                          decoration: InputDecoration(labelText: "Subject"),
                        ),
                        TextField(
                          controller: topicController,
                          decoration: InputDecoration(labelText: "Topic"),
                        ),
                        TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                              labelText: "Description not more than 100 words"),
                        ),
                        TextField(
                          controller: linkController,
                          decoration:
                              InputDecoration(labelText: "Link of Notes"),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  timeofsubmissionController.text =
                                      DateTime.now().toString();
                                  if (_checkInsertUpdate == "Update" &&
                                      (linkController.text != 'null' ||
                                          linkController.text != "")) {
                                    _updateData(
                                        data.id,
                                        nameController.text,
                                        emailController.text,
                                        typeController.text,
                                        yearController.text,
                                        subjectController.text,
                                        topicController.text,
                                        descriptionController.text,
                                        timeofsubmissionController.text,
                                        linkController.text);
                                  } else if (linkController.text != '' ||
                                      linkController.text != 'null') {
                                    _insertData(
                                        nameController.text,
                                        emailController.text,
                                        typeController.text,
                                        yearController.text,
                                        subjectController.text,
                                        topicController.text,
                                        descriptionController.text,
                                        timeofsubmissionController.text,
                                        linkController.text);
                                  }
                                },
                                child: Text(_checkInsertUpdate)))
                      ],
                    ),
                  )),
                ),
              );
            } else {
              return SafeArea(
                  child: Center(
                child: const Text("No Data Available"),
              ));
            }
          }
        });
  }

  Future<void> _insertData(
      String name,
      String email,
      String notesANDpyqs,
      String year,
      String subject,
      String topic,
      String description,
      String timeofsubmission,
      String link) async {
    var _id = M.ObjectId(); // this will use for unique id
    final data = MongoDbNotesAndPyqModel(
        id: _id,
        email: email,
        name: name,
        notesANDpyqs: notesANDpyqs,
        year: year,
        subject: subject,
        topic: topic,
        description: description,
        timeofsubmission: timeofsubmission,
        link: link);

    var result = await MongoNotesAndPyqDatabase.insert(data);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Added ID" + _id.$oid)));
    _clearAll();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(notesAndPyqRoute, (route) => false);
  }

  Future<void> _updateData(
      var id,
      String name,
      String email,
      String notesANDpyqs,
      String year,
      String subject,
      String topic,
      String description,
      String timeofsubmission,
      String link) async {
    final updateData = MongoDbNotesAndPyqModel(
        id: id,
        email: email,
        name: name,
        notesANDpyqs: notesANDpyqs,
        year: year,
        subject: subject,
        topic: topic,
        description: description,
        timeofsubmission: timeofsubmission,
        link: link);
    await MongoNotesAndPyqDatabase.update(updateData)
        .whenComplete(() => Navigator.pop(context));
  }

  void _clearAll() {
    nameController.text = "";
    emailController.text = "";
    typeController.text = "";
    yearController.text = "";
    subjectController.text = "";
    topicController.text = "";
    descriptionController.text = "";
    timeofsubmissionController.text = "";
    linkController.text = "";
  }
}
