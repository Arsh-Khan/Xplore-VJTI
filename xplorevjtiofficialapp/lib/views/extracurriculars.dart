import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';

// Rutu_dev
class ExtraCurriculars extends StatefulWidget {
  const ExtraCurriculars({super.key});

  @override
  State<ExtraCurriculars> createState() => _ExtraCurricularsState();
}

class _ExtraCurricularsState extends State<ExtraCurriculars> {
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
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, dashBoardRoute);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Color.fromARGB(255, 124, 5, 5),
              size: 30,
            )),
        backgroundColor: Colors.deepOrange[50],
        elevation: 0,
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
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
        child: Center(
          child: Center(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(
                  'assets/extracurr.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Community Of Coders

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url = 'https://www.communityofcoders.in';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/coc1.png',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text('CoC',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20))
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 70),

                  // VISHWA

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url =
                            'https://www.linkedin.com/company/vishwa-vjti/?originalSubdomain=in';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/vishwa.jpeg',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'VISHWA',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 3,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Technovanza

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url = 'https://technovanza.org';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/techno.png',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text('Technovanza',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13))
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 75),

                  // IEEE

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url = 'https://ieeevjti.tech';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/ieee.png',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'IEEE',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 4,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Pratibimb

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url = 'https://pratibimbvjti.in';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/prati1.png',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text('Pratibimb',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ))
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 75),

                  // SRA

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url = 'https://sravjti.in';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/sra.png',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'SRA',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 7,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Enthusia

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url = 'https://www.enthusiavjti.in';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/enthu.jpeg',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text('Enthusia',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ))
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 65),

                  // Rangawardhan

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url = 'https://rangawardhan.in';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/ranga.jpeg',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Rangawardhan',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Enthusia

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url = 'https://aerovjti.co.in';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/aero.jpeg',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text('Aero',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ))
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 65),

                  // Rangawardhan

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url =
                            'https://sites.google.com/ce.vjti.ac.in/digital-vjti/';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/digital.png',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Digital VJTI',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // DLA

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url =
                            'https://in.linkedin.com/company/debate-literary-arts-society-vjti';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/dla.png',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text('DLA',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 4,
                              ))
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 70),

                  // GDSC VJTI

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url = 'https://www.gdscvjti.tech';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/gdsc.png',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'GDSC',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 2,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // E-Cell

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url = 'https://www.ecellvjti.org';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/ecell.jpeg',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text('E Cell',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ))
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 70),

                  // VJTI Racing

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url = 'https://www.vjtiracing.in';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/racing.png',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Racing',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // E-Cell

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url =
                            'https://in.linkedin.com/company/asme-vjti?original_referer=https%3A%2F%2Fwww.google.com%2F';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/asme.jpeg',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text('A S M E',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ))
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 70),

                  // VJTI Racing

                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        const url = 'https://enactusvjti.org/';
                        launch(url);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/enactus.jpeg',
                                height: 100, width: 100),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Enactus',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      )),
    );
  }
}
