import 'package:flutter/material.dart';

Future<void> showOTPDialog(
    {required BuildContext context,
    required TextEditingController codeController,
    required VoidCallback onPressedCommand}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text("Enter OTP"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: codeController,
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: onPressedCommand,
            child: const Text('Done'),
          )
        ],
      );
    },
  );
}
