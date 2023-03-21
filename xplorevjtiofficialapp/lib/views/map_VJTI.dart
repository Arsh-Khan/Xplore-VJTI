import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:photo_view/photo_view.dart';

class MapVJTI extends StatefulWidget {
  const MapVJTI({super.key});

  @override
  State<MapVJTI> createState() => _MapVJTIState();
}

class _MapVJTIState extends State<MapVJTI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, dashBoardRoute);
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
            child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text('Campus Map Of VJTI',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    color: Color.fromARGB(255, 124, 5, 5),
                  )),
              Container(
                child: InteractiveViewer(
                  panEnabled: true,
                  boundaryMargin: EdgeInsets.all(100),
                  minScale: 0.5,
                  maxScale: 3,
                  child: Image.asset(
                    'assets/CampusMap.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text('Index',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Image.asset('assets/label3.png'),
                    Image.asset('assets/label2.png'),
                    Image.asset('assets/label1.png'),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
