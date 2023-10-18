import 'package:f_proyectomath/data/remote/user_data.dart';
import 'package:f_proyectomath/ui/Controller/number_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2a = TextEditingController();
  final TextEditingController _controller2b = TextEditingController();
  final TextEditingController _controller2c = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    NumberController handler = Get.find();
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            'SIGNUP',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xff004881),
          centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // TEXTO DIGITE SUS DATOS
                const SizedBox(
                  height: 10.0,
                ),
                const Row(children: <Widget>[
                  SizedBox(
                    width: 12.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Ingrese sus datos',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  )
                ]),
                // NOMBRE
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre',
                      prefixIcon: Icon(Icons.drive_file_rename_outline),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'ⓘ Por favor ingrese sus datos';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const SizedBox(
                      width: 10.0,
                    ),
                    // DÍA DE NACIMIENTO
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(),
                          labelText: 'Día de nacimiento',
                          prefixIcon: Icon(Icons.cake_outlined),
                        ),
                        textInputAction: TextInputAction.go,
                        controller: _controller2a,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "ⓘ Por favor ingrese sus datos";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    // MES DE NACIMIENTO
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(),
                          labelText: 'Mes de nacimiento',
                        ),
                        textInputAction: TextInputAction.go,
                        controller: _controller2b,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "ⓘ Por favor ingrese sus datos";
                          }
                          return null;
                        },
                      ),
                    ),
                    // AÑO DE NACIMIENTO
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(),
                          labelText: 'Año de nacimiento',
                        ),
                        textInputAction: TextInputAction.go,
                        controller: _controller2c,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "ⓘ Por favor ingrese sus datos";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
                // GRADO
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: _controller3,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Grado',
                      prefixIcon: Icon(Icons.school_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'ⓘ Por favor ingrese sus datos';
                      }
                      return null;
                    },
                  ),
                ),
                // COLEGIO
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: _controller4,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Colegio',
                      prefixIcon: Icon(Icons.apartment),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'ⓘ Por favor ingrese sus datos';
                      }
                      return null;
                    },
                  ),
                ),
                //todo: call name routing here to page2 sending the name as a parameter
                const SizedBox(
                  height: 20.0,
                ),
                // INGRESAR USUARIO Y CONTRASEÑA
                const Row(children: <Widget>[
                  SizedBox(
                    width: 12.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Ingrese su usuario y contraseña',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  )
                ]),
                // USUARIO
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: _controller5,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff004881), width: 2.0)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.teal, width: 5.0)),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'ⓘ Por favor ingrese sus datos';
                      }
                      return null;
                    },
                  ),
                ),
                // CONTRASEÑA
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: _controller6,
                    obscureText: true,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff004881), width: 2.0)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.teal, width: 5.0)),
                      labelText: 'Contraseña',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'ⓘ Por favor ingrese sus datos';
                      }
                      return null;
                    },
                  ),
                ),
                // BOTON CONTINUAR
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        var user = await UserDataSource().getUser(1);
                        handler.cambiarScore(user.score!);
                        String date =
                            "${_controller2a.text}/${_controller2b.text}/${_controller2c.text}";
                        String name = _controller.text;
                        handler.registerUser(
                            name,
                            _controller5.text,
                            _controller3.text,
                            _controller4.text,
                            date,
                            _controller6.text);
                        handler.cambiarScore(0);
                        Get.offNamed('/page2');
                      } catch (e) {
                        print("Error fetching user data: $e");
                        // Handle the error as needed
                      }
                    } else {
                      print("Form validation failed");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff004881)),
                  child: const Text('Continuar',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
