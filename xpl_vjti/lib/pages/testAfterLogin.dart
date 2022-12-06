import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:xplorevjti/pages/Sign_Up_vjti.dart';


class test_login extends StatefulWidget {
  const test_login({super.key});

  @override
  State<test_login> createState() => _test_loginState();
}

class _test_loginState extends State<test_login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 400),
          Center(
            child: Text(
              'Welcome, you\'ve Logged In !!!!!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
              ),
              ),
          ),
        ],
      ),

    );
  }
}