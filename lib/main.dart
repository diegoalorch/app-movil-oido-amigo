import 'package:app_movile_oido_amigo/pages/check_auth_page.dart';
import 'package:app_movile_oido_amigo/pages/home_page.dart';
import 'package:app_movile_oido_amigo/pages/login_page.dart';
import 'package:app_movile_oido_amigo/pages/paciente_info.dart';
import 'package:app_movile_oido_amigo/pages/settings_page.dart';
import 'package:app_movile_oido_amigo/services/auth_service.dart';
import 'package:app_movile_oido_amigo/services/pacientes_service.dart';
import 'widgets/navBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthServices(),
        ),
        ChangeNotifierProvider(
          create: (_) => PacienteService(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
        ),
      ),
      routes: {
        'login': (_) => LoginPage(),
        'home': (_) => HomePage(),
        'check': (_) => CheckAuthPage(),
        'pac': (_) => Paciente(),
        'settings': (_) => SettingsPage(),
      },
      initialRoute: 'check',
    );
  }
}
