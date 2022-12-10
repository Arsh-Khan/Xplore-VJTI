import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:coc_inheritance/pages/dashboard.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //const FrontScreen({Key? key}) : super(key: key);
  @override
  void initState() {
    super.initState();
    _navigatetodashboard();
  }
  _navigatetodashboard()async{
    await Future.delayed(Duration(milliseconds: 3000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
          body: Image.asset(
              "assets/VJTI3.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
    );
  }
}
