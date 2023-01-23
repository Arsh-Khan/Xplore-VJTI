import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:xplorevjtiofficialapp/services/auth/user_details.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';

//import 'package:xplorevjtiofficialapp/views/theme.dart';
class SideBar extends StatelessWidget {
  const SideBar({super.key});

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
                    //backgroundColor: Colors.black,
                    accountName: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text('${snapshot.data['name']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
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
                    leading: const Icon(Icons.sunny),
                    title: const Text(
                      'Theme',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                    onTap: () => null,
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
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text(
                      'Rate App',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                    onTap: () => null,
                  ),
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
                      Navigator.pushNamed(context, loginVJTIRoute);
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
