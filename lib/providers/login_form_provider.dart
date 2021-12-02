import 'package:flutter/material.dart';

class LoginFormProviders extends ChangeNotifier {
  GlobalKey<FormState> loginformkey = new GlobalKey<FormState>();

  String nomuser = '';
  String password = '';

  bool isValidForm() {
    print(loginformkey.currentState?.validate());

    print('$nomuser - $password');

    return loginformkey.currentState?.validate() ?? false;
  }
}
