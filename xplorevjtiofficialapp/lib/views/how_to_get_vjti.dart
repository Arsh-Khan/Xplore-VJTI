import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HowToGetVJTI extends StatefulWidget {
  const HowToGetVJTI({super.key});

  @override
  State<HowToGetVJTI> createState() => _HowToGetVJTIState();
}

class _HowToGetVJTIState extends State<HowToGetVJTI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          title: const Text(
            'VJTI',
            style: TextStyle(
              fontFamily: 'Vollkorn',
              fontSize: 50,
              letterSpacing: 7,
              color: Color.fromARGB(255, 124, 5, 5),
            ),
          ),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.deepOrange[50],
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: Column(children: [
              const Text(
                'How to get VJTI',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  color: Color.fromARGB(255, 94, 12, 12),
                ),
              ),
              const SizedBox(height: 10),
              Image.asset('assets/VJTI_rutu.png'),
              const SizedBox(height: 10),
              const Text(
                'वीरमाता जिजाबाई टेक्नॉलॉजीकल इंस्टिट्यूट',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                '\nVJTI is a dream college of all the MHT CET Aspirants',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '\n\n-- Degree --',
                            style: TextStyle(fontSize: 28)),
                        TextSpan(
                            text:
                                '\nYou can get admitted to VJTI for BTech programme on the basis of your score in the MHT CET (PCM) Examination'),
                      ])),
              const SizedBox(height: 20),
              Image.asset('assets/CET_logo.png', height: 125, width: 125),
              const Text('MHT CET',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 71, 10, 10))),
              RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text:
                          '(Maharashtra Health & Technical Common Entrance Test)',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 71, 10, 10)))),
              const SizedBox(height: 20),
              const Text(
                'MHTCET PCM Marking Scheme',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('assets/CET_Table.png')
                ),
              ),
              const Text(
                'Time : 3 hours\n-> 1.5 hrs for P & C\n-> 1.5 hrs for M',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n'
                      ),
                      TextSpan(
                        text: 'For P & C, one MCQ must be solved in less than a minute. (54 sec to be precise) You need to be thorough with the textbooks and Solved Numericals.\n\n',
                        style: TextStyle(
                        )
                      ),
                      TextSpan(
                        text: 'Cut-offs for various branches\n(2021-22)\n',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ]
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Colors.black
                    ),
                    children: [
                      const TextSpan(
                        text: '(1) Computer Engineering\n',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      const TextSpan(
                        text: 'GOPENS: 109 (99.9099739)',
                      ),

                      const TextSpan(
                        text: '\n\n(2) Information Technology\n',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      const TextSpan(
                        text: 'GOPENS: 202 (99.8297168)',
                      ),

                      const TextSpan(
                        text: '\n\n(3) Electronics & Telecom.\n',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      const TextSpan(
                        text: 'GOPENS: 489 (99.6404625)',
                      ),

                      const TextSpan(
                        text: '\n\n(4) Electronics Engineering\n',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      const TextSpan(
                        text: 'GOPENS: 1041 (99.310967)',
                      ),

                      const TextSpan(
                        text: '\n\n(5) Electrical Engineering\n',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      const TextSpan(
                        text: 'GOPENS: 1500 (99.06587)',
                      ),

                      const TextSpan(
                        text: '\n\n(6) Mechanical Engineering\n',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      const TextSpan(
                        text: 'GOPENS: 2048 (98.76649)',
                      ),

                      const TextSpan(
                        text: '\n\n(7) Civil Engineering\n',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      const TextSpan(
                        text: 'GOPENS: 5463 (96.93024)',
                      ),

                      const TextSpan(
                        text: '\n\n(8) Production Engineering\n',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      const TextSpan(
                        text: 'GOPENS: 7036 (96.108154)',
                      ),

                      const TextSpan(
                        text: '\n\n(9) Textile Engineering\n',
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      const TextSpan(
                        text: 'GOPENS: 14104 (92.34564)',
                      ),

                      const TextSpan(
                        text: '\n\nFor further details, go to '
                      ),

                      TextSpan(
                          text: '2022 CAP Portal',
                          style: TextStyle(color: Colors.red[800], fontSize: 15 ),
                          recognizer: TapGestureRecognizer()
                          ..onTap = () {launch('https://fe2022.mahacet.org/StaticPages/HomePage');}
                        ),


                    ]
                  )
                ),
              ),

              const SizedBox(height: 50),
            ]),
          ),
        ))
        );
  }
}
