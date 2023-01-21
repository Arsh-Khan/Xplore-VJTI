import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
class Extracurriculars extends StatefulWidget {
  @override
  State<Extracurriculars> createState() => _Extracurriculars();
}

class _Extracurriculars extends State<Extracurriculars> {
  //const Home({Key? key}) : super(key: key);
  launchUrl(String url) async {
    if (await canLaunch(url)){
      await launch(url);
    } else{
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        //actions: <Widget>[
        leading: IconButton(onPressed: (){Navigator.pushNamed(context, dashBoardRoute);}, icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black, size: 30,)),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                //SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/extracurriculars1.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54.withOpacity(1),
                          spreadRadius: 3,
                          blurRadius: 9,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 150,
                    width: 384,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    const url = 'https://www.communityofcoders.in';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      height: 120,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(220, 32, 44, 93),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/coc1.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const url = 'https://www.communityofcoders.in';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0.2,0.6),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 20, 0),
                      child: Text(
                        'CoC',
                        style: TextStyle(
                          color: Colors.amber[800],
                          fontSize: 60,
                          fontFamily: 'Merriweather',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    const url = 'https://pratibimbvjti.in';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      //color: Colors.red[300],
                      height: 120,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(200, 255, 143, 0),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/prati.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const url = 'https://pratibimbvjti.in';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0.2,0.6),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(85, 28, 5, 0),
                      child: Text(
                        'Pratibimb',
                        style: TextStyle(
                          fontSize: 45,
                          fontFamily: 'Merriweather',
                          color: Colors.indigo[900],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    const url = 'https://technovanza.org';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      height: 120,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(220, 32, 44, 93),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/techno.jpeg'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const url = 'https://technovanza.org';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0.2,0.6),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(85, 35, 5, 0),
                      child: Text(
                        'Technovanza',
                        style: TextStyle(
                          fontSize: 37,
                          fontFamily: 'Merriweather',
                          color: Colors.amber[800],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    const url = 'https://www.enthusiavjti.in';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      //color: Colors.red[300],
                      height: 120,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(200, 255, 143, 0),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/enthu.jpeg'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const url = 'https://www.enthusiavjti.in';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0.2,0.6),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(80, 30, 5, 0),
                      child: Text(
                        'Enthusia',
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Merriweather',
                          color: Colors.indigo[900],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    const url = 'https://rangawardhan.in';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      //color: Colors.red[300],
                      height: 120,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(220, 32, 44, 93),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/ranga.jpeg'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const url = 'https://rangawardhan.in';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0.2,0.6),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(80, 35, 5, 0),
                      child: Text(
                        'Rangawardhan',
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Merriweather',
                          color: Colors.amber[800],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    const url = 'https://www.ecellvjti.org';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      height: 120,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(200, 255, 143, 0),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/ecell.jpeg'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const url = 'https://www.ecellvjti.org';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0.2,0.6),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(60, 25, 25, 0),
                      child: Text(
                        'E Cell',
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Merriweather',
                          color: Colors.indigo[900],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    const url = 'https://www.instagram.com/dla_vjti/?hl=en';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      //color: Colors.red[300],
                      height: 120,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(220, 32, 44, 93),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/dla.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const url = 'https://www.instagram.com/dla_vjti/?hl=en';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0.2,0.6),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(40, 20, 25, 0),
                      child: Text(
                        'DLA',
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'Merriweather',
                          color: Colors.amber[800],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    const url = 'https://www.linkedin.com/company/vishwa-vjti/?originalSubdomain=in';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      //color: Colors.red[300],
                      height: 120,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(200, 255, 143, 0),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/vishwa.jpeg'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const url = 'https://www.linkedin.com/company/vishwa-vjti/?originalSubdomain=in';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0.2,0.6),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(75, 20, 5, 0),
                      child: Text(
                        'Vishwa',
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'Merriweather',
                          color: Colors.indigo[900],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    const url = 'https://sravjti.in';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      //color: Colors.red[300],
                      height: 120,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(220, 32, 44, 93),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/sra.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const url = 'https://sravjti.in';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0.2,0.6),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(40, 18, 25, 0),
                      child: Text(
                        'SRA',
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'Merriweather',
                          color: Colors.amber[800],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    const url = 'https://www.gdscvjti.tech';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      //color: Colors.red[300],
                      height: 120,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(200, 255, 143, 0),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/gdsc.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const url = 'https://www.gdscvjti.tech';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0.2,0.6),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(90, 30, 5, 0),
                      child: Text(
                        'GDSC VJTI',
                        style: TextStyle(
                          fontSize: 47,
                          fontFamily: 'Merriweather',
                          color: Colors.indigo[900],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    const url = 'https://www.vjtiracing.in';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      //color: Colors.red[300],
                      height: 120,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(220, 32, 44, 93),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/racing.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const url = 'https://www.vjtiracing.in';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0.2,0.6),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(85, 35, 5, 0),
                      child: Text(
                        'VJTI Racing',
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Merriweather',
                          color: Colors.amber[800],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    const url = 'https://ieeevjti.tech';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      //color: Colors.red[300],
                      height: 120,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(200, 255, 143, 0),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 9,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 260, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ExactAssetImage('assets/ieee.jpeg'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const url = 'https://ieeevjti.tech';
                    launch(url);
                  },
                  child: Align(
                    alignment: Alignment(0.2,0.6),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(90, 30, 5, 0),
                      child: Text(
                        'IEEE VJTI',
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Merriweather',
                          color: Colors.indigo[900],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}