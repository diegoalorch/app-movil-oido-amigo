import 'package:app_movile_oido_amigo/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        leading: IconButton(
          icon: Icon(Icons.logout_outlined),
          onPressed: () {
            authService.logOut();
            Navigator.pushReplacementNamed(context, 'login');
          },
        ),
      ),
      body: Center(
        child: MaterialButton(
          child: Text('Test'),
          onPressed: () {},
        ),
      ),
    );
  }
}
