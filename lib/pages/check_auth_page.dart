import 'package:app_movile_oido_amigo/pages/home_page.dart';
import 'package:app_movile_oido_amigo/pages/login_page.dart';
import 'package:app_movile_oido_amigo/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.isAuthenticated(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return Text('Wait');
            if (snapshot.data == '') {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => LoginPage(),
                        transitionDuration: Duration(seconds: 0)));
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, __, ___) => HomePage(),
                        transitionDuration: Duration(seconds: 0)));
              });
            }

            return Container();
          },
        ),
      ),
    );
  }
}
