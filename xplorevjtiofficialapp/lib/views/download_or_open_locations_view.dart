// import 'package:android_intent_plus/android_intent_plus.dart';
import 'package:device_apps/device_apps.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';

class LocationsView extends StatefulWidget {
  const LocationsView({super.key});

  @override
  State<LocationsView> createState() => _LocationsViewState();
}

class _LocationsViewState extends State<LocationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
      backgroundColor: Colors.deepOrange[50],
      body: SingleChildScrollView(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          children: [
            Text(
              'VJTI Maps',
              style: TextStyle(
                color: Color.fromARGB(255, 124, 5, 5),
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              'assets/VJTI-Maps.png',
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.deepOrange[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                      side: const BorderSide(color: Colors.transparent),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () async {
                        await LaunchApp.openApp(
                            androidPackageName: 'com.raviowl.vjtimaps',
                            openStore: true);
                      },
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                'assets/playstore.jpeg',
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Play Store',
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
                  // const SizedBox(width: 80),
                  // Material(
                  //   color: Colors.deepOrange[50],
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(19),
                  //     side: const BorderSide(color: Colors.transparent),
                  //   ),
                  //   child: InkWell(
                  //     splashColor: Colors.transparent,
                  //     onTap: () async {
                  //       await LaunchApp.openApp(
                  //           androidPackageName: 'com.raviowl.vjtimaps',
                  //           openStore: true
                  //         );
                  //     },
                  //     child: Center(
                  //       child: Column(
                  //         children: [
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               // border: Border.all(width: 2),
                  //               borderRadius: BorderRadius.circular(5),
                  //             ),
                  //             child: Image.asset(
                  //               'assets/openand.jpeg',
                  //               height: 100,
                  //               width: 100,
                  //               fit: BoxFit.fill,
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             height: 10,
                  //           ),
                  //           const Text(
                  //             'Open App',
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //               fontFamily: 'Poppins',
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
