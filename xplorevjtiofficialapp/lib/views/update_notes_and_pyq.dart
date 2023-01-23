import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/MongoDBNotesAndPyqModel.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/mongodb.dart';
import 'package:xplorevjtiofficialapp/views/insert_notes_and_pyq.dart';

class UpdateNotesAndPyqView extends StatefulWidget {
  const UpdateNotesAndPyqView({super.key});

  @override
  State<UpdateNotesAndPyqView> createState() => _UpdateNotesAndPyqViewState();
}

class _UpdateNotesAndPyqViewState extends State<UpdateNotesAndPyqView> {
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    log(email);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: FutureBuilder(
          future: MongoNotesAndPyqDatabase.getQueryData('email', email),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return displayCard(MongoDbNotesAndPyqModel.fromJson(
                        snapshot.data![index]));
                  },
                );
              } else {
                return Center(
                  child: const Text('No Data Found'),
                );
              }
            }
          },
        )),
      ),
    );
  }

  Widget displayCard(MongoDbNotesAndPyqModel data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Published On : ${data.timeofsubmission}'),
                SizedBox(
                  height: 5,
                ),
                Text("Name: ${data.name}"),
                SizedBox(
                  height: 5,
                ),
                Text("Email: ${data.email}"),
                SizedBox(
                  height: 5,
                ),
                Text("Type: ${data.notesANDpyqs}"),
                SizedBox(
                  height: 5,
                ),
                Text("Year: ${data.year}"),
                SizedBox(
                  height: 5,
                ),
                Text('Subject: ${data.subject}'),
                SizedBox(
                  height: 5,
                ),
                Text('Topic: ${data.topic}'),
                SizedBox(
                  height: 5,
                ),
                Text('Description: ${data.description}'),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) {
                                return InsertNotesAndPyqView();
                              },
                              settings: RouteSettings(arguments: data)))
                      .then((value) {
                    setState(() {});
                  });
                },
                icon: Icon(Icons.edit))
          ],
        ),
      ),
    );
  }
}
