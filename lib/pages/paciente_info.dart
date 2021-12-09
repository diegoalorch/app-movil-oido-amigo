import 'package:app_movile_oido_amigo/services/pacientes_service.dart';
import 'package:flutter/material.dart';

class Paciente extends StatefulWidget {
  Paciente({Key? key}) : super(key: key);

  @override
  _PacienteState createState() => _PacienteState();
}

class _PacienteState extends State<Paciente> {
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
                    image: AssetImage('assets/topsito.png'), fit: BoxFit.fill)),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: pac.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.center,
              height: 700,
              child: Stack(
                children: [
                  Positioned(
                      top: 35,
                      left: 20,
                      child: Material(
                        child: Container(
                          height: 500,
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
                      left: 30,
                      child: Card(
                        elevation: 10.0,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/depre.jpg'))),
                        ),
                      )),
                  Positioned(
                      top: 60,
                      left: 200,
                      child: Container(
                        width: 150,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.account_box_outlined),
                                Text(
                                  pac[index]['nombres'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromRGBO(143, 20, 64, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              pac[index]['apellidos'],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(143, 20, 64, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(children: [
                              Icon(Icons.phone_enabled_rounded),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                pac[index]['telefono'],
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            SizedBox(
                              height: 15,
                            ),
                            Row(children: [
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                pac[index]['pais'],
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            SizedBox(
                              height: 30,
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                      left: 45,
                      top: 270,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Consulta',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(143, 20, 64, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      offset: new Offset(-10.0, 10.0),
                                      blurRadius: 20.0,
                                      spreadRadius: 4.0)
                                ],
                              ),
                              padding: EdgeInsets.all(20),
                              child: Text(
                                pac[index]['motivoconsulta'],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                    top: 5,
                    left: 35,
                    child: Text(
                      'Paciente Asginado',
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromRGBO(143, 20, 64, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
