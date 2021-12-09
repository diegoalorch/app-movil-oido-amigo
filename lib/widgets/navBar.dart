import 'package:app_movile_oido_amigo/pages/settings_page.dart';
import 'package:app_movile_oido_amigo/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context, listen: false);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Helmer M'),
            accountEmail: Text('helmermartinez@upeu.edu.pe'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(
                  image: AssetImage('assets/avatar.png'),
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Color.fromRGBO(133, 24, 51, 1),
                image: DecorationImage(
                    image: AssetImage('assets/backsidebar.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Paciente Asignado'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsPage(
                            authServices: authServices,
                          )));
            },
          ),
          Divider(
            height: 350,
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Log Out'),
            onTap: () {
              authService.logOut();
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}
