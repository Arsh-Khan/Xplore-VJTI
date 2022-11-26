import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign Up - VJTIian',
            style: TextStyle(
              color: Color.fromARGB(255, 124, 5, 5),
              fontSize: 25,
              fontFamily: 'Poppins',
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepOrange[50],
        ),



        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
              child: Center(
            child: Column(
              children: [
                const TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                                hintText: 'Enter your Name',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.person),
                              ),
                ),

                Container(
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 150, 0),
                    child: TextField(
                      
                      keyboardType: TextInputType.emailAddress,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                                    hintText: 'Enter you VJTI mail id',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 145, 38, 22),
                                    ),
                                    icon: Icon(Icons.email_outlined),
                                  ),
                    ),
                  ),
                ),

                const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                                hintText: 'Enter Registration Number',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.numbers_rounded),
                              ),
                ),


                

              ],
            ),
          )
          ),
        )
        );
  }
}
