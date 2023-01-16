import 'package:flutter/material.dart';

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
              onPressed: () {},
              icon: const Icon(
                Icons.menu_sharp,
                color: Colors.black,
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
            child: Column(children: [
              const SizedBox(height: 10),
              Center(
                child: const Text(
                  'Your Account',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 80, 4, 4),
                    )),
              ),
              const SizedBox(height: 20),
              RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Name\n'),
                        TextSpan(
                            text: 'Ruturaj Rao',
                            style: TextStyle(
                              fontSize: 30,
                            )),
                        TextSpan(text: '\n'),
                        TextSpan(
                          text: '\nYear\n',
                        ),
                        TextSpan(
                            text: 'SY BTech',
                            style: TextStyle(
                              fontSize: 30,
                            )),
                        TextSpan(text: '\n'),
                        TextSpan(text: '\nBranch\n'),
                        TextSpan(
                            text: 'EXTC',
                            style: TextStyle(
                              fontSize: 30,
                            )),
                        TextSpan(text: '\n'),
                        TextSpan(text: '\nSem\n'),
                        TextSpan(
                            text: 'III',
                            style: TextStyle(
                              fontSize: 30,
                            )),
                        TextSpan(text: '\n'),
                        TextSpan(text: '\nReg. ID\n'),
                        TextSpan(
                            text: '211090007',
                            style: TextStyle(
                              fontSize: 30,
                            )),
                        TextSpan(text: '\n'),
                        TextSpan(text: '\nVJTI Mail ID\n'),
                        TextSpan(
                            text: 'rsrao_b21@et.vjti.ac.in',
                            style: TextStyle(
                              fontSize: 22,
                            )),
                        TextSpan(text: '\n'),
                        TextSpan(text: '\nDate of Birth\n'),
                        TextSpan(
                            text: '22 May 2004',
                            style: TextStyle(
                              fontSize: 30,
                            )),
                        TextSpan(text: '\n'),
                        TextSpan(text: '\nCPI\n'),
                        TextSpan(
                            text: '9.8',
                            style: TextStyle(
                              fontSize: 30,
                            )),
                        
                      ]))
            ])));
  }
}
