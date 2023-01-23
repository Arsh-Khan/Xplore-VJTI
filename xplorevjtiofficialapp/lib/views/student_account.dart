import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';

class StudentVJTI extends StatefulWidget {
  const StudentVJTI({super.key});

  @override
  State<StudentVJTI> createState() => _StudentVJTIState();
}

class _StudentVJTIState extends State<StudentVJTI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[50],
          elevation: 0,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'My Profile',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40,
                  color: Color.fromARGB(255, 124, 5, 5),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // const SizedBox(height: 20),
                      AnimatedContainer(
                        duration: const Duration(seconds: 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 124, 5, 5),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: Text(
                                'Ruturaj',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 124, 5, 5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      AnimatedContainer(
                        duration: const Duration(seconds: 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                'Year',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 124, 5, 5),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: Text(
                                'SY',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 124, 5, 5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      AnimatedContainer(
                        duration: const Duration(seconds: 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                'Reg. ID',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 124, 5, 5),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: Text(
                                '211090007',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 124, 5, 5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      AnimatedContainer(
                        duration: const Duration(seconds: 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                'Branch',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 124, 5, 5),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: Text(
                                'EXTC',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 124, 5, 5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      AnimatedContainer(
                        duration: const Duration(seconds: 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        height: 100,
                        width: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Text(
                                'Mail ID',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 124, 5, 5),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                'rsrao_b21@et.vjti.ac.in',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 22,
                                  color: Color.fromARGB(255, 124, 5, 5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      AnimatedContainer(
                        duration: const Duration(seconds: 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                'DOB',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 124, 5, 5),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: Text(
                                '22-05-2004',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 124, 5, 5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )),
              ),
            ],
          ),
        ));
  }
}
