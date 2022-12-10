import 'dart:ui';

import 'package:coc_inheritance/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:coc_inheritance/pages/dashboard.dart';

void main() {
  runApp(MaterialApp(
      //home: Dashboard(),
    initialRoute: '/splash_screen',
    routes: {
      '/splash_screen': (context) => SplashScreen(),
      '/dashboard': (context) => Dashboard(),
    }
  ));
}

/*class Home extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //actions: <Widget>[
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu_sharp, color: Colors.black,)),
        title: Image.asset(
            "assets/coc.jpg",
            fit: BoxFit.contain,
            height: 55,
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          Stack(
            children: <Widget>[
              //SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/VJTI.png'),
                        fit: BoxFit.fill,
                        ),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.transparent,
                      border: Border.all(width: 5),

                    ),

                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.38),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(250, 0, 0, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    //color: Colors.transparent,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: ExactAssetImage('assets/profilePic.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      width: 0,
                                    ),
                                  ),
                                ),
                            ),
                      ),
                    height: 150,
                    width: 384,
                ),
              ),
              Align(
                alignment: Alignment(-0.7,0.9),
                child: SizedBox(
                  height: 200,
                  width: 300,
                    child: Align(
                      alignment: Alignment(-1.1,-0.3),
                      child: Text(
                        'Hello Rushi,',
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Secular_One',
                          color: Colors.redAccent[700],
                        ),
                      ),
                    ),
                ),
              ),
            ],
          ),
          Stack(
              children: <Widget>[
                Container(
                //color: Colors.red[300],
                  height: 120,
                  width: 384,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0, -0.1), // near the top right
                      radius: 2.5,
                      colors: <Color>[
                        Colors.red.shade300, // yellow sun
                        Colors.black54, // blue sky
                      ],
                      stops: <double>[0.4, 1.0],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                        width: 3,
                        color: Colors.teal.shade900,
                    ),
                  ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/about_us.jpeg'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                    ),
                ),
                Align(
                  alignment: Alignment(0.2,0.6),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(100, 35, 5, 0),
                    child: Text(
                     'About VJTI',
                      style: TextStyle(
                       fontSize: 32,
                       fontFamily: 'Zen_Dots',
                       letterSpacing: 4,
                        //color: Colors.green.shade900,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.green.shade900,
                     ),
                    ),
                  ),
                ),
              ],
            ),
          SizedBox(height: 20),
            Stack(
              children: <Widget>[
                Container(
                  //color: Colors.red[300],
                  height: 120,
                  width: 384,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0, -0.1), // near the top right
                      radius: 2.5,
                      colors: <Color>[
                        Colors.red.shade300, // yellow sun
                        Colors.black54, // blue sky
                      ],
                      stops: <double>[0.4, 1.0],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                      width: 3,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: ExactAssetImage('assets/VJTI2.jpg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.2,0.6),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(110, 25, 5, 0),
                    child: Text(
                      'How to get VJTI',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Zen_Dots',
                        letterSpacing: 4,
                        //color: Colors.green.shade900,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.green.shade900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Stack(
              children: <Widget>[
                Container(
                  //color: Colors.red[300],
                  height: 120,
                  width: 384,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0, -0.1), // near the top right
                      radius: 2.5,
                      colors: <Color>[
                        Colors.red.shade300, // yellow sun
                        Colors.black54, // blue sky
                      ],
                      stops: <double>[0.4, 1.0],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                      width: 3,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: ExactAssetImage('assets/gallery.jpeg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.2,0.6),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40, 35, 5, 0),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Zen_Dots',
                        letterSpacing: 4,
                        //color: Colors.green.shade900,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.green.shade900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Stack(
              children: <Widget>[
                Container(
                  //color: Colors.red[300],
                  height: 120,
                  width: 384,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0, -0.1), // near the top right
                      radius: 2.5,
                      colors: <Color>[
                        Colors.red.shade300, // yellow sun
                        Colors.black54, // blue sky
                      ],
                      stops: <double>[0.4, 1.0],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                      width: 3,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: ExactAssetImage('assets/extra-curriculars.jpeg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.2,0.6),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(110, 23, 5, 0),
                    child: Text(
                      'Extra-Curriculars',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Zen_Dots',
                        letterSpacing: 4,
                        //color: Colors.green.shade900,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.green.shade900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Stack(
              children: <Widget>[
                Container(
                  //color: Colors.red[300],
                  height: 120,
                  width: 384,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0, -0.1), // near the top right
                      radius: 2.5,
                      colors: <Color>[
                        Colors.red.shade300, // yellow sun
                        Colors.black54, // blue sky
                      ],
                      stops: <double>[0.4, 1.0],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                      width: 3,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: ExactAssetImage('assets/notes.jpeg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.2,0.6),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(130, 25, 5, 0),
                    child: Text(
                      'Notes & PYQs',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Zen_Dots',
                        letterSpacing: 4,
                        //color: Colors.green.shade900,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.green.shade900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Stack(
              children: <Widget>[
                Container(
                  //color: Colors.red[300],
                  height: 120,
                  width: 384,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0, -0.1), // near the top right
                      radius: 2.5,
                      colors: <Color>[
                        Colors.red.shade300, // yellow sun
                        Colors.black54, // blue sky
                      ],
                      stops: <double>[0.4, 1.0],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                      width: 3,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: ExactAssetImage('assets/advice.png'),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.2,0.6),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(130, 25, 5, 0),
                    child: Text(
                      'Senior\'s advice',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Zen_Dots',
                        letterSpacing: 4,
                        //color: Colors.green.shade900,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.green.shade900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Stack(
              children: <Widget>[
                Container(
                  //color: Colors.red[300],
                  height: 120,
                  width: 384,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0, -0.1), // near the top right
                      radius: 2.5,
                      colors: <Color>[
                        Colors.red.shade300, // yellow sun
                        Colors.black54, // blue sky
                      ],
                      stops: <double>[0.4, 1.0],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                      width: 3,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: ExactAssetImage('assets/alumni.jpeg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.2,0.6),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(130, 25, 5, 0),
                    child: Text(
                      'Alumni Connect',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Zen_Dots',
                        letterSpacing: 4,
                        //color: Colors.green.shade900,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.green.shade900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Stack(
              children: <Widget>[
                Container(
                  //color: Colors.red[300],
                  height: 120,
                  width: 384,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0, -0.1), // near the top right
                      radius: 2.5,
                      colors: <Color>[
                        Colors.red.shade300, // yellow sun
                        Colors.black54, // blue sky
                      ],
                      stops: <double>[0.4, 1.0],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(
                      width: 3,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: ExactAssetImage('assets/VJTI1.jpeg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.2,0.6),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(130, 0, 5, 0),
                    child: Text(
                      'Location within campus',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Zen_Dots',
                        letterSpacing: 4,
                        //color: Colors.green.shade900,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.green.shade900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
        ],
        ),
      ),
    );
  }
}*/
//children: <Widget>[
/*body: Align(
          alignment: Alignment(-1,-1),
          //children: <Widget>[
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu_sharp),
              color: Colors.black,
            ),
        ),*/

/*bottomNavigationBar: BottomAppBar(
          //child: Align(
            //alignment: Alignment(-0.9,-0.6),
            child: Container(
                  //color: Colors.lightBlueAccent,
                  height: 100,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    //backgroundBlendMode: true,
                    borderRadius: BorderRadius.all(Radius.elliptical(90,45)),
                  ),
                ),

        ),*/

/*class Home extends StatelessWidget {
  //const Front({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/VJTI3.png",
        //fit: BoxFit.fitWidth,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
      /*body: Stack(
        children: <Widget>[
          Image.asset(
              "assets/VJTI2.jpeg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              color: Color(0xffffff).withOpacity(0.1),
              colorBlendMode: BlendMode.softLight,
            ),
          Center(
                child: Align(
                  alignment: Alignment(0.3,0.3),
                    child: Text(
                      'XPLORE VJTI',
                      overflow: TextOverflow.values[2],
                      maxLines: 2,
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 60,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink[500],
                          fontFamily: 'Bree_Serif',
                      ),
                    ),


                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Align(
                  alignment: Alignment(0.5,-0.5),
                  child: Image.asset(
                    "assets/coc.jpg",
                    fit: BoxFit.cover,
                    width: 200,
                    height: 120,
                  ),
                ),
              ),


              Center(
                child: Align(
                  alignment: Alignment(-1,-0.7),
                  child: ClipOval(
                        //clipper: MyClipper(),
                        //child: Padding(
                          //padding: EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/logo.jpeg",
                            fit: BoxFit.cover,
                            width: 150,
                            height: 230,
                            //width: 200,
                          ),
                        //),
                    //clipper: MyClip(),
                    ),

                ),
              ),
            ],
          ),


        ],
      ),*/

      
      /*Center(
        child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu4HSHrzAf3vtWxWvpGphYRDLNztdKEoMlHmueUndstdzk-hInl40q2sC5FBavBsNXQLs&usqp=CAU",
            alignment: Alignment.topCenter,
          ),
        ),*/
    );
  }
}
/*class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(100, 100, 100, 100);
  }
  bool shouldReclip(oldClipper){
    return false;
  }
}*/*/
