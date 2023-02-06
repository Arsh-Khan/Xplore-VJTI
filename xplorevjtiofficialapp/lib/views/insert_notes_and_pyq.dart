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
  var branchController = new TextEditingController();
  var subjectController = new TextEditingController();
  var topicController = new TextEditingController();
  var descriptionController = new TextEditingController();
  var timeofsubmissionController = new TextEditingController();
  var linkController = new TextEditingController();
  var _checkInsertUpdate = "Insert";

  // @override
  // void dispose() {
  //   nameController.dispose();
  //   emailController.dispose();
  //   typeController.dispose();
  //   yearController.dispose();
  //   branchController.dispose();
  //   subjectController.dispose();
  //   topicController.dispose();
  //   descriptionController.dispose();
  //   timeofsubmissionController.dispose();
  //   linkController.dispose();

  //   super.dispose();
  // }

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
      branchController.text = data.branch!;
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
                backgroundColor: Colors.deepOrange[50],
                appBar: AppBar(
                  title: const Text(
                    'VJTI',
                    style: TextStyle(
                      fontFamily: 'Vollkorn',
                      fontSize: 50,
                      letterSpacing: 7,
                      color: Color.fromARGB(255, 124, 5, 5),
                    ),
                  ),
                  elevation: 0.0,
                  centerTitle: true,
                  backgroundColor: Colors.deepOrange[50],
                ),
                body: SingleChildScrollView(
                  child: SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // contextignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          _checkInsertUpdate,
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(255, 124, 5, 5),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text("Time: ${timeofsubmissionController.text}",
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                        const SizedBox(height: 20),
                        Text("Name: ${nameController.text}",
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                        const SizedBox(height: 15),
                        Text("Email: ${emailController.text}",
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 16)),
                        const SizedBox(height: 15),
                        Text("Enter details: ",
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 13)),
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
                          controller: branchController,
                          decoration: InputDecoration(labelText: "Branch"),
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
                          height: 30,
                        ),
                        Center(
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 124, 5, 5),
                            child: InkWell(
                                onTap: () {
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
                                        branchController.text,
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
                                        branchController.text,
                                        subjectController.text,
                                        topicController.text,
                                        descriptionController.text,
                                        timeofsubmissionController.text,
                                        linkController.text);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    _checkInsertUpdate,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ),
                        )
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
      String branch,
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
        branch: branch,
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
      String branch,
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
        branch: branch,
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
    branchController.text = "";
  }
}
