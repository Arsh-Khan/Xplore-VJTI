import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
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
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, notesAndPyqRoute);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Color.fromARGB(255, 124, 5, 5),
              size: 30,
            )),
        backgroundColor: Colors.deepOrange[50],
        elevation: 0,
        title: const Text(
          'VJTI',
          style: TextStyle(
            fontFamily: 'Vollkorn',
            fontSize: 50,
            letterSpacing: 7,
            color: Color.fromARGB(255, 124, 5, 5),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('Delete Notes',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 124, 5, 5),
                )),
            const SizedBox(height: 20),
            SafeArea(
                child: FutureBuilder(
              future: MongoNotesAndPyqDatabase.getQueryData('email', email),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: const Color.fromARGB(103, 236, 183, 183),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return displayCard(MongoDbNotesAndPyqModel.fromJson(
                                snapshot.data![index]));
                          },
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      child: const Text(
                          'Arey pehle notes toh daalo, fir delete karna '),
                    );
                  }
                }
              },
            )),
          ],
        ),
      ),
    );
  }

  Widget displayCard(MongoDbNotesAndPyqModel data) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Card(
        color: Color.fromARGB(222, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
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
                  Text("Year: ${data.branch}"),
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
      ),
    );
  }
}
