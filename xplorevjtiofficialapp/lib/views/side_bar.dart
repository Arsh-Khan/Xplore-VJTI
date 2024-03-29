import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:xplorevjtiofficialapp/services/auth/user_details.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';

//import 'package:xplorevjtiofficialapp/views/theme.dart';
class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  double fsize = 25.0;
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 100,
          backgroundColor: Colors.deepOrange[50],
          title: Text(
            'Sure Logout?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              color: Color.fromARGB(255, 124, 5, 5),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'Are you sure you want to log out?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Yes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15,
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                print(
                  'Confirmed',
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  loginVJTIRoute,
                  (route) => false,
                );
              },
            ),
            TextButton(
              child: Text(
                'No',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15,
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            fsize = sizeAccToName(snapshot.data['name']);
            return Drawer(
              elevation: 100,
              backgroundColor: Color.fromARGB(0, 255, 255, 255).withOpacity(1),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    // sigmaX: 2.0,
                    // sigmaY: 2.0,
                    ),
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    // UserAccountsDrawerHeader(
                    //   accountName: Padding(
                    //     padding: const EdgeInsets.all(0),
                    //     child: Container(
                    //       child: Padding(
                    //         padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                    //         child: Text('${snapshot.data['name']}',
                    //             style: TextStyle(
                    //               color: Colors.black,
                    //               fontFamily: 'Poppins',
                    //               fontSize: fsize,
                    //               fontWeight: FontWeight.bold,
                    //             )),
                    //       ),
                    //     ),
                    //   ),
                    //   accountEmail: Text('${snapshot.data['email']}',
                    //       style: const TextStyle(
                    //           color: Color.fromARGB(255, 124, 5, 5), fontWeight: FontWeight.bold)),
                    //   // currentAccountPicture: const CircleAvatar(
                    //   //   backgroundImage: ExactAssetImage(
                    //   //     'assets/VJTilogoforappbar.jpeg',
                    //   //   ),
                    //   //   radius: 200,
                    //   // ),
                    //   decoration: BoxDecoration(
                    //     color: Colors.deepOrange[50]?.withOpacity(0.75),
                    //     borderRadius: BorderRadius.horizontal(right: Radius.circular(15))
                    //   ),
                    // ),
                    // const SizedBox(height: 100),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepOrange[50]?.withOpacity(1),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 40),
                                Image.asset(
                                  'assets/VJTilogoforappbar.jpeg',
                                  height: 100,
                                ),
                                Text('\t${snapshot.data['name']}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: fsize,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const SizedBox(height: 5),
                                Text('\t ${snapshot.data['email']}',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 124, 5, 5),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    )),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ListTile(
                      leading: const Icon(Icons.person_rounded),
                      title: const Text(
                        'View Profile',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, studentAccountRoute);
                      },
                    ),
                    ListTile(
                        leading: const Icon(Icons.share),
                        title: const Text(
                          'Share App',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                        ),
                        onTap: () {
                          Share.share(
                              "https://play.google.com/apps/details?id=com.instructivetech.testapp");
                        }),
                    // ListTile(
                    //   leading: const Icon(Icons.star),
                    //   title: const Text(
                    //     'Rate App',
                    //     style: TextStyle(
                    //       fontFamily: 'Poppins',
                    //       fontSize: 20,
                    //     ),
                    //   ),
                    //   onTap: () => null,
                    // ),
                    ListTile(
                      leading: const Icon(Icons.contact_phone),
                      title: const Text(
                        'Contact Us',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, contactUsRoute);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text(
                        'Logout',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      ),
                      onTap: () {
                        // Navigator.pushNamed(context, loginVJTIRoute);
                        _showMyDialog();
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SafeArea(
                child: Center(
              child: CircularProgressIndicator(),
            ));
          }
        });
  }
}

double sizeAccToName(String name) {
  if (name.length > 11) {
    return 19.0;
  } else {
    return 25.0;
  }
}
