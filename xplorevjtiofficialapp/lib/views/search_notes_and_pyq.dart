import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';

class SearchNotesAndPyqView extends StatefulWidget {
  const SearchNotesAndPyqView({super.key});

  @override
  State<SearchNotesAndPyqView> createState() => _SearchNotesAndPyqViewState();
}

class _SearchNotesAndPyqViewState extends State<SearchNotesAndPyqView> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(children: [
        Text('Search View',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 124, 5, 5),
            )),
        SizedBox(
          height: 10,
        ),
        Text('Search Notes and Pyq',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 124, 5, 5),
            )),
      ]),
    );
  }
}
