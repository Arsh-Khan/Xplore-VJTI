import 'package:flutter/material.dart';

class AboutVJTIView extends StatefulWidget {
  const AboutVJTIView({super.key});

  @override
  State<AboutVJTIView> createState() => _AboutVJTIViewState();
}

class _AboutVJTIViewState extends State<AboutVJTIView> {
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
              icon: const Icon(
                Icons.menu_sharp,
                color: Colors.black,
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
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: const [
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
