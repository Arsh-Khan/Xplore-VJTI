import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';

class AboutVJTIView extends StatefulWidget {
  const AboutVJTIView({super.key});

  @override
  State<AboutVJTIView> createState() => _AboutVJTIViewState();
}

class _AboutVJTIViewState extends State<AboutVJTIView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[50],
          elevation: 0,
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Veermata Jijabai Technological Institute',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        letterSpacing: 4,
                        color: Color.fromARGB(255, 95, 17, 17),
                        // fontWeight: FontWeight.bold
                        ),
                  ),
                ),
                Image.asset(
                  'assets/VJTI2.png'
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          letterSpacing: 2,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'VJTI was established in 1887 as \'Victoria Jubilee Technical Institute\''
                        ),
                        TextSpan(
                          text: '\n\n-- HISTORY --\n', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                          text: '\nVJTI was housed in Byculla in the early days'
                        )
                      ]
                    ),)),
                Image.asset(
                  'assets/VJTI_Byculla.png'
                ),
                // const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            letterSpacing: 2,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold
                            ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'credits: https://vjti.ac.in/history/',
                          style: TextStyle(color: Colors.red[800], fontSize: 15 ),
                          recognizer: TapGestureRecognizer()
                          ..onTap = () {launch('https://vjti.ac.in/history/');}
                        ),
                        const TextSpan(
                          text: '\n(VJTI Campus at Byculla)\n(1887 - 1922)'
                        ),
                        const TextSpan(
                          text: '\n\nNow Bharat Ratna Dr. Babasaheb Ambedkar Memorial Hospital / Central Railway Hospital',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
                        ),
                        const TextSpan(
                          text: '\n\nAfter World War I in 1923 the institute was shifted to its present campus at Matunga'
                        )

                      ]
                    )
                  ),
                ),

                Image.asset(
                  'assets/VJTI_Matunga.png'
                ),
                // const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            letterSpacing: 2,
                            color: Colors.black,
                            ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'credits: https://vjti.ac.in/history/',
                          style: TextStyle(color: Colors.red[800], fontSize: 15 ),
                          recognizer: TapGestureRecognizer()
                          ..onTap = () {launch('https://vjti.ac.in/history/');}
                        ),
                        const TextSpan(
                          text: '\n\nIn 1997, the institute was renamed from its old name'
                        ),
                        const TextSpan(
                          text: '\n\n\'Victoria Jubilee Technical Institute\'\n(VJTI)\n\n',
                          style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        const TextSpan(
                          text: 'to'
                        ),
                        const TextSpan(
                          text: '\n\n\'Veermata Jijabai Technological Institute\'\n(VJTI)\n',
                          style: TextStyle(fontWeight: FontWeight.bold)
                        )
                      ]))),

              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),                child: Image.asset(
                  'assets/Rajmata_Jijabai.png'
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 7),
                child: Image.asset('assets/Naav.png'),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            letterSpacing: 2,
                            color: Colors.black,
                            ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'In 1997, VJTI changed its name to '
                      ),
                      TextSpan(
                        text: '\'Veermeta Jijabai Technological Institute\'',
                        style: TextStyle(fontWeight: FontWeight.bold )
                      ),
                      TextSpan(
                        text: ' to honour '
                      ),
                      TextSpan(
                        text: 'Rajmata Jijau',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                        text: ', the Mother of '
                      ),
                      TextSpan(
                        text: '\nChhatrapati Shivaji Maharaj',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                        text: '\n\nLocated in South Mumbai, '
                      ),
                      TextSpan(
                        text: 'VJTI',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                        text: ' is an autonomous institution owned by the Maharashtra State Government.'
                      )
                    ]
                  )
                ),
              ),

              Material(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(0, 124, 5, 5),
                child: InkWell(
                  onTap: () async {
                    Navigator.of(context).pushNamed(dashBoardRoute);
                  },
                ),
              ),
              const SizedBox(height: 40),
              ],
            ),
          ),
        ));
  }
}
