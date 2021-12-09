import 'package:app_movile_oido_amigo/services/pacientes_service.dart';
import 'package:app_movile_oido_amigo/services/sesion_service.dart';
import 'package:flutter/material.dart';

class ReporteF extends StatefulWidget {
  ReporteF({Key? key, required this.ses1service}) : super(key: key);
  Ses1Service ses1service;

  @override
  _ReporteFState createState() => _ReporteFState();
}

class _ReporteFState extends State<ReporteF> {
  TextEditingController obs = new TextEditingController();
  TextEditingController ant = new TextEditingController();
  TextEditingController pro = new TextEditingController();
  TextEditingController acc = new TextEditingController();
  TextEditingController con = new TextEditingController();
  TextEditingController rec = new TextEditingController();
  TextEditingController fecha = new TextEditingController();

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
                      height: 450,
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
                      image: AssetImage('assets/reportelogo.png'),
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
                  'Reporte Final',
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
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Form(
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      child: Text(
                                        'Observaciones Generales',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(133, 24, 51, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    TextFormField(
                                        controller: obs,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    133, 24, 51, 1),
                                                width: 2.0),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text(
                                        'Antecedentes',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(133, 24, 51, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    TextFormField(
                                        controller: ant,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    133, 24, 51, 1),
                                                width: 2.0),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text(
                                        'Problema Actual',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(133, 24, 51, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    TextFormField(
                                        controller: pro,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    133, 24, 51, 1),
                                                width: 2.0),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text(
                                        'Acciones Realizadas',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(133, 24, 51, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    TextFormField(
                                        controller: acc,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    133, 24, 51, 1),
                                                width: 2.0),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text(
                                        'Conclusiones',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(133, 24, 51, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    TextFormField(
                                        controller: con,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    133, 24, 51, 1),
                                                width: 2.0),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text(
                                        'Recomendaciones/Tareas',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(133, 24, 51, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    TextFormField(
                                        controller: rec,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    133, 24, 51, 1),
                                                width: 2.0),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Text(
                                        'Fecha',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(133, 24, 51, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    TextFormField(
                                        controller: fecha,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    133, 24, 51, 1),
                                                width: 2.0),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  )),
              Positioned(
                  top: 510,
                  left: getScreenWidth * .18,
                  child: MaterialButton(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 50, right: 50),
                    height: 50,
                    color: Color.fromRGBO(133, 24, 51, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    onPressed: () {
                      widget.ses1service.crateRepf(
                          obs.text,
                          ant.text,
                          pro.text,
                          acc.text,
                          con.text,
                          rec.text,
                          fecha.text,
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
