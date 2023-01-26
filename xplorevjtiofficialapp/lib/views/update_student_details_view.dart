import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/database/userDatabase/MongoDBUserModel.dart';

class UpdateStudentDetails extends StatefulWidget {
  const UpdateStudentDetails({super.key});

  @override
  State<UpdateStudentDetails> createState() => _UpdateStudentDetailsState();
}

class _UpdateStudentDetailsState extends State<UpdateStudentDetails> {
  @override
  Widget build(BuildContext context) {
    MongoDbUserModel? data =
        ModalRoute.of(context)!.settings.arguments as MongoDbUserModel;
    log(data.toString());

    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
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
          child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Update your Details',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 124, 5, 5),
                )),
          ],
        ),
      )),
    );
  }
}
