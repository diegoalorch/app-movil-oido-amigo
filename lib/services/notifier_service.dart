import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messangerKey =
      new GlobalKey<ScaffoldMessengerState>();

  static showErrorSnackBar(String message) {
    final snackBar = new SnackBar(
        backgroundColor: Colors.red,
        content: Row(
          children: [
            Icon(Icons.error_outline),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ))
          ],
        ));

    messangerKey.currentState!.showSnackBar(snackBar);
  }
}
