import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        //actions: <Widget>[
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, dashBoardRoute);
            },
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black,
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
        centerTitle: true,
      ),
      backgroundColor: Colors.deepOrange[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 2)),
                height: 100,
                width: 100,
                child: Image.asset(
                  'assets/dev.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Center(
                child: Text(
                  '</Developers>',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source code pro',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Container(
                height: 120,
                width: 500,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(71, 123, 21, 21),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: ExactAssetImage('assets/rushi.jpeg'),
                    fit: BoxFit.contain,
                    alignment: Alignment(-1, 0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 10, 0, 0),
                  child: Column(
                    children: [
                      const Text(
                         'Rushi Jani',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins'
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(70, 10, 0, 0),
                            child: Container(
                              height: 40,
                              width: 40,
                              child: InkWell(
                                onTap: () {
                                  const url =
                                      'https://www.linkedin.com/in/rushi-jani-4a71ab233';
                                  launch(url);
                                },
                                child: Image.asset('assets/linkedin.png'),
                                //fit: BoxFit.contain
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Container(
                              height: 40,
                              width: 40,
                              child: InkWell(
                                onTap: () {
                                  const url = 'https://github.com/R-V-J';
                                  launch(url);
                                },
                                child: Image.asset('assets/github.png'),
                                //fit: BoxFit.contain
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Container(
                height: 120,
                width: 500,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(71, 123, 21, 21),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: ExactAssetImage('assets/arsh.jpeg'),
                    fit: BoxFit.contain,
                    alignment: Alignment(-1, 0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 10, 0, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Arsh Khan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins'
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(70, 10, 0, 0),
                            child: Container(
                              height: 40,
                              width: 40,
                              child: InkWell(
                                onTap: () {
                                  const url =
                                      'https://www.linkedin.com/in/arsh-khan-b0613622b';
                                  launch(url);
                                },
                                child: Image.asset('assets/linkedin.png'),
                                //fit: BoxFit.contain
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Container(
                              height: 40,
                              width: 40,
                              child: InkWell(
                                onTap: () {
                                  const url = 'https://github.com/Arsh-Khan';
                                  launch(url);
                                },
                                child: Image.asset('assets/github.png'),
                                //fit: BoxFit.contain
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Container(
                height: 120,
                width: 500,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(71, 123, 21, 21),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: ExactAssetImage('assets/ruturaj.jpeg'),
                    fit: BoxFit.contain,
                    alignment: Alignment(-1, 0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 10, 0, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Ruturaj Rao',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(70, 10, 0, 0),
                            child: Container(
                              height: 40,
                              width: 40,
                              child: InkWell(
                                onTap: () {
                                  const url =
                                      'https://www.linkedin.com/in/ruturaj-rao-855b9b233';
                                  launch(url);
                                },
                                child: Image.asset('assets/linkedin.png'),
                                //fit: BoxFit.contain
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Container(
                              height: 40,
                              width: 40,
                              child: InkWell(
                                onTap: () {
                                  const url = 'https://github.com/Rutu2004';
                                  launch(url);
                                },
                                child: Image.asset('assets/github.png'),
                                //fit: BoxFit.contain
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Container(
                height: 120,
                width: 500,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(71, 123, 21, 21),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: ExactAssetImage('assets/aryan.png'),
                    fit: BoxFit.contain,
                    alignment: Alignment(-1, 0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 10, 0, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Aryan Karawale',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(70, 10, 0, 0),
                            child: Container(
                              height: 40,
                              width: 40,
                              child: InkWell(
                                onTap: () {
                                  const url =
                                      'https://www.linkedin.com/in/aryan-karawale-54b6b7233';
                                  launch(url);
                                },
                                child: Image.asset('assets/linkedin.png'),
                                //fit: BoxFit.contain
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Container(
                              height: 40,
                              width: 40,
                              child: InkWell(
                                onTap: () {
                                  const url = 'https://github.com/Aryan-karawale';
                                  launch(url);
                                },
                                child: Image.asset('assets/github.png'),
                                //fit: BoxFit.contain
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: Text(
                "This app was successfully developed in CoC's Inheritance 2k22 program under the mentorship and guidance of our mentor,",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(255, 124, 5, 5)
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Container(
                height: 120,
                width: 500,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(71, 123, 21, 21),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Ananya Bangera',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Container(
                              height: 40,
                              width: 40,
                              child: InkWell(
                                onTap: () {
                                  const url =
                                      'https://www.linkedin.com/in/ananya-bangera-1647a9207';
                                  launch(url);
                                },
                                child: Image.asset('assets/linkedin.png'),
                                //fit: BoxFit.contain
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Container(
                              height: 40,
                              width: 40,
                              child: InkWell(
                                onTap: () {
                                  const url = 'https://github.com/ananya-bangera';
                                  launch(url);
                                },
                                child: Image.asset('assets/github.png'),
                                //fit: BoxFit.contain
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: Text(
                "For any issues or feedback, please write to",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 124, 5, 5)   
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "help.xplorevjti@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  color: Color(0xff1D3BA7),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '- Special Thanks -',
              style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    color: Colors.black,     
                  ),
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 50),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(255, 124, 5, 5)      
                  ),
                  children: [
                    TextSpan(
                      text: "Special Thanks to the developers of "
                    ),
                    TextSpan(
                      text: "'VJTI Maps', \nMr. Ravi Maurya \nand \nMs. Sarah Tisekar",
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                    TextSpan(
                      text: " \nfor allowing us to link their app (VJTI Maps) in our app, Xplore VJTI for Location within the Campus"
                    ),

                  ]
                )
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
