import 'package:flutter/material.dart';
import 'package:xplorevjti/pages/Sign_Up_nonvjti.dart';
import 'package:xplorevjti/pages/Sign_Up_vjti.dart';
import 'package:xplorevjti/pages/aboutVJTI.dart';
import 'package:xplorevjti/pages/dashboard.dart';
import 'package:xplorevjti/pages/splash.dart';
import 'package:xplorevjti/pages/testAfterLogin.dart';
import 'package:xplorevjti/pages/testAfterSignup.dart';
import 'pages/login_vjti.dart';
import 'pages/login_non_vjti.dart';

void main() {
  runApp(MaterialApp(


    initialRoute: '/splash_screen',

    routes: {
      '/': (context) => login_vjti(),
      '/splash_screen': (context) => SplashScreen(),

      '/signUpvjti':(context) => signUp(),
      '/login_non_vjti':(context) => loginNonVjti(),
      '/testAfterLogin':(context) => test_login(),
      '/testAfterSignup':(context) => test_signup(),
      '/dashboard':(context) => dashBoard(),
      '/aboutVJTI':(context) => aboutVJTI(),
      '/signupnonvjti':(context) => signupNonVJTI(),

    },

  ));
}



