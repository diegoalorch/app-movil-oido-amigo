import 'package:app_movile_oido_amigo/providers/login_form_provider.dart';
import 'package:app_movile_oido_amigo/services/auth_service.dart';
import 'package:app_movile_oido_amigo/services/notifier_service.dart';
import 'package:app_movile_oido_amigo/widgets/carousel_login.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CarouselLogin(),
                Positioned(
                  bottom: 100,
                  left: 25,
                  right: 25,
                  child: ChangeNotifierProvider(
                    create: (_) => LoginFormProviders(),
                    child: LoginForm(),
                  ),
                ),
                Positioned(
                  bottom: 350,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Container(
                        width: 120,
                        height: 120,
                        child: Image(
                          image: AssetImage('assets/logorojo.png'),
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
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
      child: Form(
        key: loginForm.loginformkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            TextFormField(
              onChanged: (value) => loginForm.nomuser = value,
              validator: (value) {
                if (value != null && value.length >= 3) return null;
                return 'Username cant be empty and more than 3 digits';
              },
              autocorrect: false,
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(133, 24, 51, 1),
                filled: true,
                prefixIcon: Icon(Icons.account_circle_rounded),
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
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
                  fillColor: Color.fromRGBO(133, 24, 51, 1),
                  filled: true,
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: 'Password'),
            ),
            SizedBox(
              height: 40,
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
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
