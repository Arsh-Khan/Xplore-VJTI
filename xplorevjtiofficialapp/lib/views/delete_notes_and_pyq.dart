import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/MongoDBNotesAndPyqModel.dart';
import 'package:xplorevjtiofficialapp/database/notes-pyq%20database/mongodb.dart';

class DeleteNotesAndPyqView extends StatefulWidget {
  const DeleteNotesAndPyqView({super.key});

  @override
  State<DeleteNotesAndPyqView> createState() => _DeleteNotesAndPyqViewState();
}

class _DeleteNotesAndPyqViewState extends State<DeleteNotesAndPyqView> {
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
                onPressed: () async {
                  await MongoNotesAndPyqDatabase.delete(data);
                  setState(() {});
                },
                icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
