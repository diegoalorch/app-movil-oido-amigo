import 'package:app_movile_oido_amigo/services/pacientes_service.dart';
import 'package:app_movile_oido_amigo/services/sesion_service.dart';
import 'package:flutter/material.dart';

class Sesion1 extends StatefulWidget {
  Sesion1({Key? key, required this.ses1Service}) : super(key: key);
  Ses1Service ses1Service;

  @override
  _Sesion1State createState() => _Sesion1State();
}

class _Sesion1State extends State<Sesion1> {
  TextEditingController linkController = new TextEditingController();
  TextEditingController fechaController = new TextEditingController();
  TextEditingController horaController = new TextEditingController();

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
    var getScreenHeight = MediaQuery.of(context).size.height;
    var getScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          height: 600,
          child: Stack(
            children: [
              Positioned(
                  top: 35,
                  left: 20,
                  child: Material(
                    child: Container(
                      height: 400,
                      width: getScreenWidth * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: new Offset(-10.0, 10.0),
                              blurRadius: 20.0,
                              spreadRadius: 4.0)
                        ],
                      ),
                    ),
                  )),
              Positioned(
                top: 50,
                left: 40,
                child: Container(
                  child: Card(
                    child: Image(
                      image: AssetImage('assets/documentos.png'),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 160,
                child: Text(
                  'Sesion 1',
                  style: TextStyle(
                      fontSize: 40,
                      color: Color.fromRGBO(143, 20, 64, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                  left: 45,
                  top: 150,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 280,
                            width: 300,
                            padding: EdgeInsets.all(20),
                            child: Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: linkController,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: Icon(Icons.insert_link),
                                      labelText: 'Enlace',
                                      labelStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(133, 24, 51, 1)),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(133, 24, 51, 1),
                                            width: 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: fechaController,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: Icon(Icons.calendar_today),
                                      labelText: 'Fecha',
                                      labelStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(133, 24, 51, 1)),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(133, 24, 51, 1),
                                            width: 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: horaController,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: Icon(Icons.access_time),
                                      labelText: 'Hora',
                                      labelStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(133, 24, 51, 1)),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(133, 24, 51, 1),
                                            width: 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  )),
              Positioned(
                  top: 500,
                  left: getScreenWidth * .18,
                  child: MaterialButton(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 50, right: 50),
                    height: 50,
                    color: Color.fromRGBO(133, 24, 51, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    onPressed: () {
                      widget.ses1Service.crateSes1(
                          linkController.text,
                          fechaController.text,
                          horaController.text,
                          int.parse(pac[0]['idpaciente']));
                      Navigator.pop(context, true);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
