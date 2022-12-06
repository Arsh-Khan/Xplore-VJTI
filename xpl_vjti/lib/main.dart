import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:xplorevjti/pages/Sign_Up_vjti.dart';
import 'package:xplorevjti/pages/dashboard.dart';
import 'package:xplorevjti/pages/testAfterLogin.dart';
import 'package:xplorevjti/pages/testAfterSignup.dart';
import 'pages/login_vjti.dart';
import 'pages/login_non_vjti.dart';

void main() {
  runApp(MaterialApp(

    // home: login_vjti(), 
    initialRoute: '/',
    routes: {
      '/': (context) => login_vjti(),
      '/signUpvjti':(context) => signUp(),
      '/login_non_vjti':(context) => loginNonVjti(),
      '/testAfterLogin':(context) => test_login(),
      '/testAfterSignup':(context) => test_signup(),
      // '/dashboard':(context) => dashBoard(),

    },

  ));
}



