import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:xplorevjtiofficialapp/services/auth/user_details.dart';

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
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    //backgroundColor: Colors.black,
                    accountName: Text('${snapshot.data['name']}'),
                    accountEmail: Text('${snapshot.data['email']}'),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage:
                          ExactAssetImage('assets/VJTilogoforappbar.jpeg'),
                      radius: 40,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.sunny),
                    title: const Text('Theme'),
                    onTap: () => null,
                  ),
                  ListTile(
                      leading: const Icon(Icons.share),
                      title: const Text('Share App'),
                      onTap: () {
                        Share.share(
                            "https://play.google.com/apps/details?id=com.instructivetech.testapp");
                      }),
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text('Rate App'),
                    onTap: () => null,
                  ),
                  ListTile(
                    leading: const Icon(Icons.contact_phone),
                    title: const Text('Contact Us'),
                    onTap: () => null,
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () => null,
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
