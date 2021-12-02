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
              children: [
                CarouselLogin(),
                Positioned(
                    top: 30,
                    left: 30,
                    child: Image(
                      image: AssetImage('assets/oidoamigo2.png'),
                      width: 180,
                    )),
                Positioned(
                  bottom: 120,
                  left: 25,
                  right: 25,
                  child: ChangeNotifierProvider(
                    create: (_) => LoginFormProviders(),
                    child: LoginForm(),
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
      width: double.infinity,
      child: Form(
        key: loginForm.loginformkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(
              height: 10,
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Password'),
            ),
            SizedBox(
              height: 10,
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
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
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
