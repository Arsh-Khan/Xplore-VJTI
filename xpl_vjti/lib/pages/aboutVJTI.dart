import 'package:flutter/material.dart';

class aboutVJTI extends StatefulWidget {
  const aboutVJTI({super.key});

  @override
  State<aboutVJTI> createState() => _aboutVJTIState();
}

class _aboutVJTIState extends State<aboutVJTI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[50],
          elevation: 0,
          //actions: <Widget>[
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu_sharp,
                color: Colors.black,
              )),
          title: Text(
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
                SizedBox(height: 15),
                Text(
                  'Veermata Jijabai',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      letterSpacing: 4,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Technological Institute',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      letterSpacing: 4,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ));
  }
}
