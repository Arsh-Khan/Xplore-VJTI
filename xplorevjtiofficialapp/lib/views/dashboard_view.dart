import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
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
        child: Column(
          children: <Widget>[
            Material(
              color: Colors.deepOrange[50],
              child: InkWell(
                onTap: () async {
                  Navigator.pushNamed(context, studentAccountRoute);
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 5),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  height: 200,
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Welcome\n<name>',
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/VJTilogoforappbar.jpeg',
                        height: 300,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SENIORS' ADVICE
                Material(
                  color: Colors.deepOrange[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      //
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              'assets/advice.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Seniors\' Advice',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 70),
                // EXTRA CURRICULARS
                Material(
                  color: Colors.deepOrange[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      //
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              'assets/extracurriculars.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Extra Curriculars',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // NOTES & PYQS
                Material(
                  color: Colors.deepOrange[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      //
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              'assets/notespyqs.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Notes & PYQs',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 90),
                // ABOUT VJTI
                Material(
                  color: Colors.deepOrange[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.pushNamed(context, aboutVJTIRoute);
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              'assets/about.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'About VJTI',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // GALLERY
                Material(
                  color: Colors.deepOrange[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      //
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              'assets/gallery.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Gallery',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 80),
                // HOW TO GET VJTI
                Material(
                  color: Colors.deepOrange[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      //
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              'assets/howtoget.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'How to get VJTI',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Material(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 124, 5, 5),
                child: InkWell(
                  onTap: () async {
                    Navigator.of(context).pushNamed(loginVJTIRoute);
                  },
                  child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                height: 50,
                                width: 100,
                                child: const Center(
                                  child: Text(
                                    'Logout',
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
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
