import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/app_constants.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/MongoDBNotesAndPyqModel.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/mongodb.dart';
import 'package:xplorevjtiofficialapp/services/auth/user_details.dart';
import 'package:xplorevjtiofficialapp/utilites/show_error_dialog.dart';

class InsertNotesAndPyqView extends StatefulWidget {
  const InsertNotesAndPyqView({super.key});

  @override
  State<InsertNotesAndPyqView> createState() => _InsertNotesAndPyqViewState();
}

class _InsertNotesAndPyqViewState extends State<InsertNotesAndPyqView> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController typeController;
  late final TextEditingController yearController;
  late final TextEditingController branchController;
  late final TextEditingController subjectController;
  late final TextEditingController topicController;
  late final TextEditingController descriptionController;
  late final TextEditingController timeofsubmissionController;
  late final TextEditingController linkController;
  var _checkInsertUpdate = "Publish";

  // String dropdownvalue = 'Notes';
  // var notespyqs = ['Notes', 'PYQs'];
  // String defaultyear = 'FY';
  // var selectyear = [
  //   'FY',
  //   'SY',
  //   'TY',
  //   'Final Year',
  // ];
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    typeController = TextEditingController();
    yearController = TextEditingController();
    branchController = TextEditingController();
    subjectController = TextEditingController();
    topicController = TextEditingController();
    descriptionController = TextEditingController();
    timeofsubmissionController = TextEditingController();
    linkController = TextEditingController();
    yearController.text = defaultyear;
    branchController.text = branchesvalue;
    typeController.text = dropdownvalue;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    typeController.dispose();
    yearController.dispose();
    branchController.dispose();
    subjectController.dispose();
    topicController.dispose();
    descriptionController.dispose();
    timeofsubmissionController.dispose();
    linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //getting arguments from previous page and store inside variable
    MongoDbNotesAndPyqModel? data =
        ModalRoute.of(context)!.settings.arguments as MongoDbNotesAndPyqModel;
    log(data.toString());

    if (data.name != 'null' &&
        data.name != '' &&
        data.email != 'null' &&
        data.email != '' &&
        data.notesANDpyqs != 'null' &&
        data.notesANDpyqs != '' &&
        data.year != 'null' &&
        data.year != '' &&
        data.subject != 'null' &&
        data.subject != "" &&
        data.topic != 'null' &&
        data.topic != "" &&
        data.description != 'null' &&
        data.description != "" &&
        data.timeofsubmission != 'null' &&
        data.timeofsubmission != "" &&
        data.link != 'null' &&
        data.link != "" &&
        data.branch != '' &&
        data.branch != 'null') {
      nameController.text = data.name!;
      emailController.text = data.email!;
      typeController.text = data.notesANDpyqs!;
      // dropdownvalue = data.notesANDpyqs!;
      yearController.text = data.year!;
      // defaultyear = data.year!;
      branchController.text = data.branch!;
      // branchesvalue = data.branch!;
      subjectController.text = data.subject!;
      topicController.text = data.topic!;
      descriptionController.text = data.description!;
      timeofsubmissionController.text = data.timeofsubmission!;
      linkController.text = data.link!;
      _checkInsertUpdate = "Update";
    }
    log(typeController.text);
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
                  leading: IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pushNamed(context, notesAndPyqRoute);
                        });
                        dispose();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Color.fromARGB(255, 124, 5, 5),
                        size: 30,
                      )),
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
                        // TextField(
                        //   controller: typeController,
                        //   decoration:
                        //       InputDecoration(labelText: "NOTES or PYQ"),
                        // ),

                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Select Notes / PYQs : ',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
                                            fontSize: 15,
                                            fontFamily: 'Poppins')),
                                    const SizedBox(width: 20),
                                    DropdownButton(
                                      // value: dropdownvalue,
                                      value: typeController.text,
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      items: notespyqs.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          // log(typeController.text);
                                          // dropdownvalue = newValue!;
                                          typeController.text = newValue!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Select branch : ',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
                                            fontSize: 15,
                                            fontFamily: 'Poppins')),
                                    const SizedBox(width: 20),
                                    DropdownButton(
                                      value: branchController.text,
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      items: branches.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          // branchesvalue = newValue!;
                                          branchController.text = newValue!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const Text(
                                    'NOTE : Please select \'ALL\' if you are FY',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                    )),
                                Row(
                                  children: [
                                    Text('Select year : ',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
                                            fontSize: 15,
                                            fontFamily: 'Poppins')),
                                    const SizedBox(width: 20),
                                    DropdownButton(
                                      value: yearController.text,
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      items: selectyear.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          // defaultyear = newValue!;
                                          yearController.text = newValue!;
                                          // log(yearController.text);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextField(
                          controller: subjectController,
                          decoration: InputDecoration(
                              labelText: "Subject (prefer short forms)"),
                        ),
                        // TextField(
                        //   controller: branchController,
                        //   decoration: InputDecoration(labelText: "Branch"),
                        // ),
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
                          decoration: InputDecoration(
                              labelText:
                                  "Link of Notes (Make sure the link is public!)"),
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

                                  final lastpos = timeofsubmissionController
                                      .text
                                      .lastIndexOf(':');

                                  timeofsubmissionController.text =
                                      timeofsubmissionController.text
                                          .substring(0, lastpos + 2);
                                  // typeController.text = dropdownvalue;
                                  // yearController.text = defaultyear;
                                  // branchController.text = branchesvalue;
                                  if (_checkInsertUpdate == "Update" &&
                                      (linkController.text != 'null' ||
                                          linkController.text != "")) {
                                    log(typeController.text);
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
                                  } else if (descriptionController.text == '' ||
                                      descriptionController.text == 'null' ||
                                      topicController.text == '' ||
                                      topicController.text == 'null' ||
                                      subjectController.text == '' ||
                                      subjectController.text == 'null' ||
                                      linkController.text == 'null' ||
                                      yearController.text == "--" ||
                                      branchController.text == "--" ||
                                      typeController.text == "--" ||
                                      linkController.text == "") {
                                    var error = "";
                                    if (linkController.text != 'null' ||
                                        linkController.text == '') {
                                      error += "Enter Link";
                                    }
                                    if (yearController.text == '--' ||
                                        yearController.text == '') {
                                      error += "\nEnter Year";
                                    }
                                    if (branchController.text == '--' ||
                                        branchController.text == '') {
                                      error += "\nEnter Year";
                                    }
                                    if (typeController.text == '--' ||
                                        typeController.text == '') {
                                      error += "\nEnter Notes or PYQ";
                                    }
                                    if (subjectController.text == '' ||
                                        subjectController.text == 'null') {
                                      error += '\nEnter Subject';
                                    }
                                    if (topicController.text == '' ||
                                        topicController.text == 'null') {
                                      error += "\nEnter Topic";
                                    }
                                    if (descriptionController.text == '' ||
                                        descriptionController.text == 'null') {
                                      error += "\nEnter Description";
                                    }

                                    showErrorDiaglog(context, error);
                                  } else {
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
    // _clearAll();
    setState(() {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(notesAndPyqRoute, (route) => false);
    });
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

  // void _clearAll() {
  //   nameController.text = "";
  //   emailController.text = "";
  //   typeController.text = "";
  //   yearController.text = "";
  //   subjectController.text = "";
  //   topicController.text = "";
  //   descriptionController.text = "";
  //   timeofsubmissionController.text = "";
  //   linkController.text = "";
  //   branchController.text = "";
  // }
}
