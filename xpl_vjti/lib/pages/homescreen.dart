import 'package:flutter/material.dart';


class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],


      body: Container(
        // height: double.maxFinite,
        // width: double.maxFinite,
        child: Center(
          child: Image.asset('assets/Screenshot 2022-11-26 at 11.12.37.png', fit: BoxFit.fill),
          ),
      )


    );
  }
}