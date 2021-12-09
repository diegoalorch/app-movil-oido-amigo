import 'package:app_movile_oido_amigo/pages/reporte1_page.dart';
import 'package:app_movile_oido_amigo/pages/reporte2_page.dart';
import 'package:app_movile_oido_amigo/pages/reporte3_page.dart';
import 'package:app_movile_oido_amigo/pages/reportef_page.dart';
import 'package:app_movile_oido_amigo/pages/sesion1_page.dart';
import 'package:app_movile_oido_amigo/pages/sesion2_page.dart';
import 'package:app_movile_oido_amigo/pages/sesion3_page.dart';
import 'package:app_movile_oido_amigo/services/auth_service.dart';
import 'package:app_movile_oido_amigo/services/notifier_service.dart';
import 'package:app_movile_oido_amigo/services/pacientes_service.dart';
import 'package:app_movile_oido_amigo/services/sesion_service.dart';
import 'package:app_movile_oido_amigo/widgets/navBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
  PacienteService pacSerivce = PacienteService();
}

class _HomePageState extends State<HomePage> {
  Ses1Service ses1Service = Ses1Service();
  List pac = [];
  PacienteService pacSerivce = PacienteService();

  initialise() {
    pacSerivce.readPaciente().then((value) => {
          setState(() {
            pac = value;
          }),
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialise();
  }

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ReporteF(ses1service: ses1Service)));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Sesion1(ses1Service: ses1Service)));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Reporte1(ses1service: ses1Service)));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Sesion3(ses1Service: ses1Service)));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Reporte3(ses1service: ses1Service)));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Sesion2(ses1Service: ses1Service)));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Reporte2(ses1service: ses1Service)));
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
                      onPressed: () {
                        widget.pacSerivce.finPaciente(pac[0]['idpaciente']);
                        print(pac[0]['idpaciente']);
                      },
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
