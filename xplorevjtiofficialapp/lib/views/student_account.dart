import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/database/userDatabase/mongodb.dart';
import 'package:xplorevjtiofficialapp/services/auth/user_details.dart';
import 'package:xplorevjtiofficialapp/utilites/reg_no_tod_diya_jaye.dart';

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
        body: FutureBuilder(
            future: userDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasData) {
                  final exams = detailsFromRegID(snapshot.data['regId']);
                  return SingleChildScrollView(
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
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          'Name',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 15, 0),
                                        child: Text(
                                          '${snapshot.data['name']}',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 25,
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
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
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          'Year',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 15, 0),
                                        child: Text(
                                          '${exams[0]}',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 25,
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
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
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          'Reg. ID',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 15, 0),
                                        child: Text(
                                          '${snapshot.data['regId']}',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 25,
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
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
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          'Branch',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 15, 0),
                                        child: Text(
                                          '${exams[1]}',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 25,
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
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
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  height: 100,
                                  width: 500,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 0, 0),
                                        child: Text(
                                          'Mail ID',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          '${snapshot.data['email']}',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 20,
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
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
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          'Gender',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 15, 0),
                                        child: Text(
                                          '${exams[2]}',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 25,
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
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
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          'DOB',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 15, 0),
                                        child: Text(
                                          '${snapshot.data['dob']}',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 25,
                                            color:
                                                Color.fromARGB(255, 124, 5, 5),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Center(
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color.fromARGB(255, 124, 5, 5),
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, updateNotesAndPyqRoute);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(
                                            'Update Details',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                                const SizedBox(height: 40),
                              ],
                            ),
                          )),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                      child: Text('sorry, aapka data hi nahi hai :('));
                }
              }
            }));
  }
}
