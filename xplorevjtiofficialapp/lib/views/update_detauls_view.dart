import 'package:flutter/material.dart';

class UpdateDetails extends StatefulWidget {
  const UpdateDetails({super.key});

  @override
  State<UpdateDetails> createState() => _UpdateDetailsState();
}

class _UpdateDetailsState extends State<UpdateDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text('Update your Details', style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 124, 5, 5),
                
        )),
              ],
            ),
          )),

          bottomNavigationBar: BottomAppBar(
            color: Colors.black,
            child: TextFormField()
          ),

    );
  }
}