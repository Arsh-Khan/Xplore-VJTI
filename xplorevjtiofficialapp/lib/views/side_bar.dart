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

  Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 10,
        backgroundColor: Colors.deepOrange[50],
        title: Text('Sure Logout?',
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
              Text('Are you sure you want to log out?',
              textAlign: TextAlign.center,
              style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15,
          color: Colors.black,
        ),),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Haan ji',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 15,
              color: Colors.red,
            ),
            ),
            onPressed: () {
              print('Confirmed',
              );
              Navigator.pushNamed(context, loginVJTIRoute);
            },
          ),
          TextButton(
            child: Text('Nahi',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 15,
              color: Colors.red,
            ),),
            onPressed: () {
              Navigator.pushNamed(context, dashBoardRoute);
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
            return Drawer(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  UserAccountsDrawerHeader(
                    // backgroundColor: Colors.black,
                    accountName: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: Text('${snapshot.data['name']}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                    accountEmail: Text('${snapshot.data['email']}',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: ExactAssetImage(
                        'assets/VJTilogoforappbar.jpeg',
                      ),
                      radius: 200,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange[50],
                    ),
                  ),
                  const SizedBox(height: 20),
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


