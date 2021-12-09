import 'package:flutter/material.dart';

class Sesion2 extends StatefulWidget {
  Sesion2({Key? key}) : super(key: key);

  @override
  _Sesion2State createState() => _Sesion2State();
}

class _Sesion2State extends State<Sesion2> {
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
                  'Sesion 2',
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
                    onPressed: () {},
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
