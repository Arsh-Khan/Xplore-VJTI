import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';

class ContactVJTIView extends StatefulWidget {
  const ContactVJTIView({Key? key}) : super(key: key);

  @override
  State<ContactVJTIView> createState() => _ContactVJTIViewState();
}

class _ContactVJTIViewState extends State<ContactVJTIView> {
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
            icon: Icon(
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
                height: 100,
                width: 100,
                child: Image.asset(
                  'assets/dev.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Center(
                child: Text(
                  'Developers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 60, 0),
              child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.indigo[200],
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
                      Text(
                        'Rushi V. Jani',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
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
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 60, 0),
              child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.indigo[200],
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
                      Text(
                        'Arsh Khan',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
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
            Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 60, 0),
              child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.indigo[200],
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
                      Text(
                        'Ruturaj Rao',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
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
            Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                "For any issues or feedback, please write to",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
          ],
        ),
      ),
    );
  }
}
