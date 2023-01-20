import 'package:flutter/material.dart';
//import 'package:share_plus/share_plus.dart';
import 'package:xplorevjtiofficialapp/constants/routes.dart';
import 'package:xplorevjtiofficialapp/views/login_view_vjti.dart';
//import 'package:xplorevjtiofficialapp/views/theme.dart';
class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          InkWell(
            onTap:(){
              Navigator.pushNamed(context, studentAccountRoute);
            },
            child: UserAccountsDrawerHeader(
              //backgroundColor: Colors.black,
              accountName: Text('Rushi V. Jani'), 
              accountEmail: Text('rvjani_b21@et.vjti.ac.in'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/r.png'),
                radius: 40,
              ),
              ),
          ),
          ListTile(
            leading: Icon(Icons.sunny),
            title: Text('Theme'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share App'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Rate App'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.contact_phone),
            title: Text('Contact Us'),
            onTap: () {
              Navigator.pushNamed(context, contactUsRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushNamed(context, loginVJTIRoute);
            },
          ),
        ],
      ),
    );
  }
}
