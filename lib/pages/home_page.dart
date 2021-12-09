import 'package:app_movile_oido_amigo/services/auth_service.dart';
import 'package:app_movile_oido_amigo/services/notifier_service.dart';
import 'package:app_movile_oido_amigo/services/pacientes_service.dart';
import 'package:app_movile_oido_amigo/widgets/navBar.dart';
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
    var noty = NotificationsService;
    final pacService = Provider.of<PacienteService>(context, listen: false);
    final authService = Provider.of<AuthServices>(context, listen: false);
    var getScreenHeight = MediaQuery.of(context).size.height;
    var getScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: NavBar(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/topsito.png'),
                      fit: BoxFit.fill)),
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              left: 25,
              top: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('pac');
                },
                child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(143, 20, 64, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('Paciente',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
            ),
            Positioned(
              right: 25,
              top: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('repf');
                },
                child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(143, 20, 64, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Reporte',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text('Final',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    )),
              ),
            ),
            Positioned(
              left: 25,
              top: 130,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('ses1');
                },
                child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(143, 20, 64, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('Sesion 1',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
            ),
            Positioned(
              left: 25,
              top: 250,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('rep1');
                },
                child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(143, 20, 64, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('Reporte 1',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
            ),
            Positioned(
              right: 25,
              top: 130,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('ses3');
                },
                child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(143, 20, 64, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('Sesion 3',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
            ),
            Positioned(
              right: 25,
              top: 250,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('rep3');
                },
                child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(143, 20, 64, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('Reporte 3',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
            ),
            Positioned(
              left: getScreenWidth * .38,
              top: 130,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('ses2');
                },
                child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(143, 20, 64, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('Sesion 2',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
            ),
            Positioned(
              left: getScreenWidth * .38,
              top: 250,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('rep2');
                },
                child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(143, 20, 64, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('Reporte 2',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
            ),
            Positioned(
                left: getScreenWidth * .22,
                top: 360,
                child: Container(
                  height: 150,
                  width: 200,
                  child: Image(
                    image: AssetImage('assets/fotopersonas.png'),
                    fit: BoxFit.fill,
                  ),
                )),
            Positioned(
                top: 520,
                child: Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 15, right: 15),
                    height: 80,
                    width: getScreenWidth,
                    child: MaterialButton(
                      color: Color.fromRGBO(133, 24, 51, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      onPressed: () {},
                      child: Text(
                        'Finalizar Paciente',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ))),
          ],
        ));
  }
}
