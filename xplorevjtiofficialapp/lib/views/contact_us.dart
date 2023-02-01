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
                        '    Arsh Khan',
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
                        '  Ruturaj Rao',
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
              // RichText(
              //   text: TextSpan(
              //     children: [
              //       TextSpan(
              //         style: TextStyle(
              //           color: Color(0xff1D3BA7),
              //           fontSize: 20,
              //         ),
              //         text: 'help.xplorevjti@gmail.com',
              //         recognizer :TapGestureRecognizer()..onTap = ()async{
              //           var url = "https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox?compose=GTvVlcSKhpbZBrCFftlpFwrdrkdxfdmhkxSQZXXMqqRKBcvnMJQDLrbMqGKFxDfkCpQxLwcqpdplf";
              //           launch(url);
              //           // if(await canLaunch(url)){
              //           //   await launch(url);
              //           // }else{
              //           //   throw "Cannot launch url";
              //           // }
              //         }
              //       )
              //     ]
              //   )
              // ),
            //),
              // Linkify(
              //   onOpen: (link){
              //     print("Linkify link = ${link.url}");
              //   },
              //   text: "Linkify click - https://www.mail.google.com",
              //   style: TextStyle(
              //     color: Color(0xff1D3BA7),
              //   ),
              // ),
            //   Text(
            //     "help.xplorevjti@gmail.com",
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       fontSize: 20,
            //       decoration: TextDecoration.underline,
            //       color: Color(0xff1D3BA7),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 50),
              child: Text(
                'Special thanks to the developers of \"VJTI Maps\" - Mr. Ravi Maurya and Ms. Sarah Tisekar for the implementation of locations within the campus',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 124, 5, 5)      
                ),
              ),
              //SizedBox(height: 10),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
