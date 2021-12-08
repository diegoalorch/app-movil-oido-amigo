import 'package:app_movile_oido_amigo/providers/login_form_provider.dart';
import 'package:app_movile_oido_amigo/services/auth_service.dart';
import 'package:app_movile_oido_amigo/services/notifier_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var getScreenHeight = MediaQuery.of(context).size.height;
    var getScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Column(
            children: [
              Container(
                  width: getScreenWidth,
                  height: 150,
                  child: Image(
                    image: AssetImage('assets/topnuevo1.png'),
                    fit: BoxFit.fill,
                  )),
              Container(
                  width: getScreenWidth,
                  height: 250,
                  child: Image(
                    image: AssetImage('assets/fotopersonas.png'),
                    fit: BoxFit.fill,
                  )),
              Container(
                height: getScreenHeight * .5,
                child: ChangeNotifierProvider(
                  create: (_) => LoginFormProviders(),
                  child: LoginForm(),
                ),
              ),
            ],
          ),
          Positioned(
            left: getScreenWidth * .38,
            top: 60,
            child: Container(
                width: 100,
                height: 100,
                child: Image(
                  image: AssetImage('assets/logorojo.png'),
                  fit: BoxFit.fill,
                )),
          ),
          Positioned(
              left: getScreenWidth * .19,
              top: 400,
              child: Text(
                'Bienvenido',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(143, 20, 64, 1),
                ),
              ))
        ],
      )),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProviders>(context);
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(12)),
      width: double.infinity,
      height: 500,
      child: Form(
        key: loginForm.loginformkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              onChanged: (value) => loginForm.nomuser = value,
              validator: (value) {
                if (value != null && value.length >= 3) return null;
                return 'Username cant be empty and more than 3 digits';
              },
              autocorrect: false,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.account_circle_rounded),
                labelText: 'Username',
                labelStyle: TextStyle(color: Color.fromRGBO(133, 24, 51, 1)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(133, 24, 51, 1), width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                if (value != null && value.length >= 3) return null;
                return 'Password cant be empty and more than 3 digits';
              },
              autocorrect: false,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  fillColor: Colors.white,
                  filled: true,
                  labelStyle: TextStyle(color: Color.fromRGBO(133, 24, 51, 1)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(133, 24, 51, 1), width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: 'Password'),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Olvidó su contraseña?',
              style: TextStyle(
                  color: Color.fromRGBO(133, 24, 51, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            MaterialButton(
              color: Color.fromRGBO(133, 24, 51, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              onPressed: () async {
                final authServices =
                    Provider.of<AuthServices>(context, listen: false);

                if (!loginForm.isValidForm()) return;

                final String? errorMessage = await authServices.login(
                    loginForm.nomuser, loginForm.password);
                if (errorMessage == null) {
                  Navigator.pushReplacementNamed(context, 'home');
                } else {
                  NotificationsService.showErrorSnackBar(errorMessage);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
