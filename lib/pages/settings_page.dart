import 'package:app_movile_oido_amigo/services/auth_service.dart';
import 'package:app_movile_oido_amigo/widgets/navBar.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key, required this.authServices}) : super(key: key);
  AuthServices authServices;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController pass = new TextEditingController();
  TextEditingController passw = new TextEditingController();
  TextEditingController user = new TextEditingController();

  List psi = [];
  AuthServices authServices = AuthServices();

  initialise() {
    authServices.readPsicologo().then((value) => {
          setState(() {
            psi = value;
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
      drawer: NavBar(),
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
          itemCount: psi.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              height: 800,
              child: Stack(
                children: [
                  Positioned(
                      top: 35,
                      left: 20,
                      child: Material(
                        child: Container(
                          height: 650,
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
                    child: CircleAvatar(
                      minRadius: 1,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage('assets/avatar.png'),
                          width: 75,
                          height: 75,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 110,
                    child: Text(
                      psi[index]['nombres'],
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromRGBO(143, 20, 64, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                      top: 130,
                      left: 30,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.home_work_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  psi[index]['universidad'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(children: [
                              Icon(Icons.markunread_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                psi[index]['correo'],
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
                              Icon(Icons.work_outline),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                psi[index]['gradoacademico'],
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ],
                        ),
                      )),
                  Positioned(
                      top: 250,
                      left: 30,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  psi[index]['pais'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(children: [
                              Icon(Icons.featured_video_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                psi[index]['dni'],
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
                              Icon(Icons.phone),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                psi[index]['telefono'],
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ],
                        ),
                      )),
                  Positioned(
                      left: 45,
                      top: 380,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Editar Perfil',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Color.fromRGBO(143, 20, 64, 1),
                                  fontWeight: FontWeight.bold),
                            ),
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
                                        controller: pass,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          prefixIcon:
                                              Icon(Icons.lock_open_outlined),
                                          labelText: 'Clave Antigua',
                                          labelStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  133, 24, 51, 1)),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    133, 24, 51, 1),
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
                                        controller: passw,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          prefixIcon: Icon(Icons.lock_outline),
                                          labelText: 'Nueva Clave',
                                          labelStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  133, 24, 51, 1)),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    133, 24, 51, 1),
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
                                        controller: user,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          prefixIcon: Icon(
                                              Icons.account_circle_rounded),
                                          labelText: 'Username',
                                          labelStyle: TextStyle(
                                              color: Color.fromRGBO(
                                                  133, 24, 51, 1)),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    133, 24, 51, 1),
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
                    top: 8,
                    left: 120,
                    child: Text(
                      'Perfil Usuario',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromRGBO(143, 20, 64, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                      top: 720,
                      right: 35,
                      child: MaterialButton(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 50, right: 50),
                        height: 50,
                        color: Color.fromRGBO(133, 24, 51, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        onPressed: () {
                          widget.authServices.updatePsicologo(
                              pass.text, passw.text, user.text);
                          Navigator.pop(context, true);
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )),
                ],
              ),
            );
          }),
    );
  }
}
