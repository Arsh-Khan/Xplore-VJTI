import 'package:flutter/material.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/views/side_bar.dart';

class DashboardView_nonVJTI extends StatefulWidget {
  const DashboardView_nonVJTI({super.key});

  @override
  State<DashboardView_nonVJTI> createState() => _DashboardView_nonVJTIState();
}

class _DashboardView_nonVJTIState extends State<DashboardView_nonVJTI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[50],
        elevation: 0,
        leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.menu_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
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
            Container(
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
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  const SizedBox(width: 80),

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
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const SizedBox(width: 90),
                  
                ],
              ),
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
            const SizedBox(height: 40),
          ],
        ),
      ),
    );;
  }
}