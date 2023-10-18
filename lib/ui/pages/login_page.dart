import 'package:f_proyectomath/ui/Controller/number_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  NumberController handler = Get.find();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'TEST MATEMÁTICO',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Ingrese sus datos',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                // USUARIO
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: _controller,
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
                    controller: _controller2,
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
                const SizedBox(
                  height: 20.0,
                ),
                // BOTONES DE LOGIN Y SIGN UP
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const SizedBox(width: 10.0),
                    const SizedBox(width: 10.0),
                    // LOGIN BUTTON
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (await handler.logIn(
                                _controller.text, _controller2.text)) {
                              try {
                                var user = await handler
                                    .getUserByQuery(_controller.text);
                                handler.setActualUser(_controller.text);
                                handler.cambiarScore(user.score!);
                                // funcion log in
                                Get.offNamed('/page2');
                              } catch (e) {
                                print("Error fetching user data: $e");
                                // Handle the error as needed
                              }
                            }
                          } else {
                            print("Form validation failed");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff004881)),
                        child: const Text('Login',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255))),
                      ),
                    ),
                    // SIGNUP BUTTON
                    Flexible(
                      child: ElevatedButton(
                          onPressed: () async {
                            Get.toNamed('/page1');
                          },
                          child: const Text('Crear cuenta')),
                    ),
                    const SizedBox(width: 10.0),
                    const SizedBox(width: 10.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
