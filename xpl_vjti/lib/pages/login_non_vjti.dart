import 'package:flutter/material.dart';


class loginNonVjti extends StatefulWidget {
  const loginNonVjti({super.key});

  @override
  State<loginNonVjti> createState() => _loginNonVjtiState();
}

class _loginNonVjtiState extends State<loginNonVjti> {
  bool signupbutton = false;
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
                    Navigator.pushNamed(context, '/');
                  },
                ),
                const SizedBox(height: 40),

                const Text('-- non VJTI --',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    )),

                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: const Color.fromARGB(103, 236, 183, 183),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Login',
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
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Enter your mail id',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.mail_outlined),
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
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                // border: OutlineInputBorder(),
                                hintText: 'Enter Password',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 145, 38, 22),
                                ),
                                icon: Icon(Icons.lock_outline_rounded),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Password bhul gaye kya?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            ),
                        ),


                        const SizedBox(height: 20),

                        FloatingActionButton.extended(
                          onPressed: (){},
                          label: const Text('Login'),
                          icon: const Icon(Icons.laptop_mac_rounded),
                          backgroundColor: const Color.fromARGB(255, 124, 5, 5),
                        ),

                        const SizedBox(height: 10),
                        
      
                        const Text(
                          'or',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
      
                        const SizedBox(height: 10),
      
                        FloatingActionButton.extended(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signupnonvjti');
                          },
                          backgroundColor: const Color.fromARGB(255, 124, 5, 5),
                          icon: const Icon(Icons.account_circle_sharp),
                          label: const Text('Sign Up'),
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
;
  }
}