import 'package:flutter/material.dart';
import 'package:xplorevjti/pages/Sign_Up_vjti.dart';



class test_signup extends StatefulWidget {
  const test_signup({super.key});

  @override
  State<test_signup> createState() => _test_signupState();
}

class _test_signupState extends State<test_signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 400),
          Center(
            child: Text(
              'Congratulations, you\'ve Signed Up !!!!!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
              ),
              ),
          ),
        ],
      ),

    );;
  }
}