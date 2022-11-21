import 'package:flutter/material.dart';
import 'package:xplorevjti/constants/routes.dart';
import 'package:xplorevjti/enums/menu_action.dart';
import 'package:xplorevjti/services/auth/auth_service.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Main UI'), actions: [
          PopupMenuButton<MenuAction>(onSelected: (value) async {
            // devtools.log(value.toString());
            switch (value) {
              case MenuAction.logout:
                // TODO: Handle this case.
                final shouldLogout = await showLogOutDialog(context);
                // devtools.log(shouldLogout.toString());
                if (shouldLogout) {
                  await AuthService.firebase().logOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    loginRoute,
                    (_) => false,
                  );
                }
                break;
            }
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem<MenuAction>(
                  value: MenuAction.logout, child: Text('Log Out')),
            ];
          })
        ]),
        body: const Text('Hello World'));
  }
}

//bool is perfect either logout or cancel
Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Cancel')),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Logout'),
            )
          ],
        );
      }).then((value) => value ?? false);
}
