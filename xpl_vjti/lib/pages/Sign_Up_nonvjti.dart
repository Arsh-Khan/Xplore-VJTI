import 'package:flutter/material.dart';

import 'package:intl/intl.dart';


class signupNonVJTI extends StatefulWidget {
  const signupNonVJTI({super.key});

  @override
  State<signupNonVJTI> createState() => _signupNonVJTIState();
}

class _signupNonVJTIState extends State<signupNonVJTI> {

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }


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
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: 120,
                  width: 210,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(0, 7),
                        )
                      ]),
                  child: ClipRect(
                    child: Image.asset(
                      'assets/Logo_Black.png',
                      height: 100,
                      width: 180,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                FloatingActionButton.extended(
                  backgroundColor: Color.fromARGB(85, 219, 112, 112),
                  elevation: 0,
                  label: Text('Are you VJTIian?',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  )),                   
                  onPressed: () {
                    Navigator.pushNamed(context, '/signUpvjti');
                  },
                ),
                const SizedBox(height: 40),
                const Text('non - VJTI Students',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    )),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: const Color.fromARGB(103, 236, 183, 183),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login_non_vjti');
                          },
                          child: const Text(
                            'Already have an account? Login instead!',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        // ],
                        // ),
                        const SizedBox(height: 20),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(85, 219, 112, 112),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                hintText: 'Full Name',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.person),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(85, 219, 112, 112),
                            ),
                            padding: const EdgeInsets.all(8),
                            height: MediaQuery.of(context).size.width / 3,
                            child: Center(
                                child: TextField(
                              controller: dateInput,
                              //editing controller of this TextField
                              decoration: const InputDecoration(
                                  icon: Icon(Icons
                                      .calendar_today), //icon of text field
                                  labelText:
                                      "Date Of Birth" //label text of field
                                  ),
                              readOnly: true,
                              //set it true, so that user will not able to edit text
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    // DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('dd - MM - yyyy')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  setState(() {
                                    dateInput.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {}
                              },
                            ))),

                        const SizedBox(height: 20),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(85, 219, 112, 112),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'email id',
                                hintText: 'Enter your email id',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.mail_outlined),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Registration Number
                        
                        const SizedBox(height: 20),

                        // Branch
                        const Text(
                          'Create Password',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Color.fromARGB(255, 145, 38, 22),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // CREATE PASSWORD
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(85, 219, 112, 112),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                // border: OutlineInputBorder(),
                                hintText: 'Create Password',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.lock_outline_rounded),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // CONFIRM PASSWORD

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(85, 219, 112, 112),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.lock_outline_rounded),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        const SizedBox(height: 10),
                        Material(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 124, 5, 5),
                          child: InkWell(
                            onTap: () async {
                              // Navigator.pushNamed(context, '/testAfterLogin');
                              Navigator.pushNamed(context, '/dashboard');
                            },
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              height: 50,
                              width: 100,
                              child: const Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}