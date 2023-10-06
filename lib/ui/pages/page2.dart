import 'package:f_proyectomath/casos_de_uso/botones_dificultad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});
  // Obtain the name parameter from the route
  //final String? name = Get.parameters["name"];

  @override
  Widget build(BuildContext context) {
    BotonesDificultad handler = Get.find();

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'SELECT YOUR DIFFICULTY!',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff004881),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: Material(
                      color: Colors.blueGrey,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: Center(
                          child: Text(
                        'SCORE: ${handler.caso.score.toString()} POINTS',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: SizedBox(
                    height: 100,
                    width: 300,
                    child: Material(
                      color: Colors.green,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: Center(
                          child: TextButton(
                              onPressed: () {
                                handler.lvlEasy();
                              },
                              child: const Text(
                                "EASY",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: SizedBox(
                    height: 100,
                    width: 300,
                    child: Material(
                      color: Colors.orange,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: Center(
                          child: TextButton(
                              onPressed: () {
                                handler.lvlMid();
                              },
                              child: const Text(
                                "INTERMEDIATE",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: SizedBox(
                    height: 100,
                    width: 300,
                    child: Material(
                      color: Colors.red,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: Center(
                          child: TextButton(
                              onPressed: () {
                                handler.lvlHard();
                              },
                              child: const Text(
                                "HARD",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SizedBox(
                    height: 100,
                    width: 300,
                    child: Material(
                      color: Colors.lightBlue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: Center(
                          child: TextButton(
                              onPressed: () {
                                handler.lvlPredet();
                              },
                              child: const Text(
                                "AUTO-DETECT",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))),
                    ),
                  )),
            ],
          ),
        ));
  }
}
