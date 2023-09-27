import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../casos_de_uso/casos_dificultad.dart';
import '../../data/remote/user_data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  CasoDificultad caso = Get.find();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'WELCOME',
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
                const Text('Digite sus datos',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                // USUARIO
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Usuario',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese sus datos';
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
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese sus datos';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 1.0,
                ),
                // BOTONES DE LOGIN Y SIGN UP
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const SizedBox(
                      width: 1.0,
                    ),
                    // LOGIN BUTTON
                    Flexible(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              print("nomelacontes");
                              var user = await UserDataSource().getUser(1);
                              caso.changeScore(user.score!);
                              Get.offNamed('/page2');
                            } catch (e) {
                              print("Error fetching user data: $e");
                              // Handle the error as needed
                            }
                          } else {
                            print("Form validation failed");
                          }
                        },
                        child: Text('Login',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255))),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff004881)),
                      ),
                    ),
                    // SIGNUP BUTTON
                    Flexible(
                      child: ElevatedButton(
                          onPressed: () => Get.offNamed('/page1'),
                          child: const Text('Signup')),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
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
