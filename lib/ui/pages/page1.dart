import 'package:f_proyectomath/casos_de_uso/casos_dificultad.dart';
import 'package:f_proyectomath/data/remote/user_data.dart';
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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    CasoDificultad caso = Get.find();
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'TEST MATEMÁTICO',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xff004881),
          centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Digite sus datos',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                        return 'Por favor ingrese sus datos';
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
                            return "Por favor ingrese sus datos";
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
                            return "Por favor ingrese sus datos";
                          }
                          return null;
                        },
                      ),
                    ),
                    // AÑO DE NACIMIENTO
                    SizedBox(
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
                            return "Por favor ingrese sus datos";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
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
                        return 'Por favor ingrese sus datos';
                      }
                      return null;
                    },
                  ),
                ),
                // COLEGIO
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: _controller4,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Colegio',
                      prefixIcon: Icon(Icons.school_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese sus datos';
                      }
                      return null;
                    },
                  ),
                ),
                //todo: call name routing here to page2 sending the name as a parameter
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          print("nomelacontes");
                          var user = await UserDataSource().getUser(1);
                          caso.changeScore(user.score!);
                          String date = _controller2a.value.toString() +
                              _controller2b.value.toString() +
                              _controller2c.value.toString();
                          caso.registerUserData(
                              _controller.value,
                              email,
                              _controller3.value,
                              _controller4,
                              date,
                              _controller.value);
                          Get.offNamed('/page2');
                        } catch (e) {
                          print("Error fetching user data: $e");
                          // Handle the error as needed
                        }
                      } else {
                        print("Form validation failed");
                      }
                    },
                    child: const Text('Continuar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
