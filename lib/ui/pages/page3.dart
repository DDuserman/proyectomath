import 'package:f_proyectomath/ui/Controller/number_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    NumberController controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test matemático'),
        ),
        body: Center(
            child: Column(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: SizedBox(
                  child: Row(
                children: [
                  Expanded(
                      child: Obx(() => Text(controller.op1.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 50)))),
                  Expanded(
                      child: Obx(() => Text(controller.operator.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 50)))),
                  Expanded(
                      child: Obx(() => Text(controller.op2.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 50)))),
                ],
              ))),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
            child: Obx(() => Text(controller.result.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 50))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipOval(
                      child: Material(
                        color: Colors.blue, // button color
                        child: InkWell(
                          splashColor: Colors.black, // splash color
                          onTap: () {
                            controller.setResult("7");
                          }, // button pressed
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("7",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))
                              ]),
                        ),
                      ),
                    ), // button width and height
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipOval(
                      child: Material(
                        color: Colors.blue, // button color
                        child: InkWell(
                          splashColor: Colors.black, // splash color
                          onTap: () {
                            controller.setResult("8");
                          }, // button pressed
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("8",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))
                              ]),
                        ),
                      ),
                    ), // button width and height
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipOval(
                      child: Material(
                        color: Colors.blue, // button color
                        child: InkWell(
                          splashColor: Colors.black, // splash color
                          onTap: () {
                            controller.setResult("9");
                          }, // button pressed
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("9",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))
                              ]),
                        ),
                      ),
                    ), // button width and height
                  ),
                ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipOval(
                      child: Material(
                        color: Colors.blue, // button color
                        child: InkWell(
                          splashColor: Colors.black, // splash color
                          onTap: () {
                            controller.setResult("4");
                          }, // button pressed
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("4",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))
                              ]),
                        ),
                      ),
                    ), // button width and height
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipOval(
                      child: Material(
                        color: Colors.blue, // button color
                        child: InkWell(
                          splashColor: Colors.black, // splash color
                          onTap: () {
                            controller.setResult("5");
                          }, // button pressed
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("5",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))
                              ]),
                        ),
                      ),
                    ), // button width and height
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipOval(
                      child: Material(
                        color: Colors.blue, // button color
                        child: InkWell(
                          splashColor: Colors.black, // splash color
                          onTap: () {
                            controller.setResult("6");
                          }, // button pressed
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("6",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))
                              ]),
                        ),
                      ),
                    ), // button width and height
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipOval(
                      child: Material(
                        color: Colors.blue, // button color
                        child: InkWell(
                          splashColor: Colors.black, // splash color
                          onTap: () {
                            controller.setResult("1");
                          }, // button pressed
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("1",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))
                              ]),
                        ),
                      ),
                    ), // button width and height
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipOval(
                      child: Material(
                        color: Colors.blue, // button color
                        child: InkWell(
                          splashColor: Colors.black, // splash color
                          onTap: () {
                            controller.setResult("2");
                          }, // button pressed
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("2",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))
                              ]),
                        ),
                      ),
                    ), // button width and height
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipOval(
                      child: Material(
                        color: Colors.blue, // button color
                        child: InkWell(
                          splashColor: Colors.black, // splash color
                          onTap: () {
                            controller.setResult("3");
                          }, // button pressed
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("3",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))
                              ]),
                        ),
                      ),
                    ), // button width and height
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipOval(
                      child: Material(
                        color: Colors.blue, // button color
                        child: InkWell(
                          splashColor: Colors.black, // splash color
                          onTap: () {
                            controller.setResult("0");
                          }, // button pressed
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("0",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))
                              ]),
                        ),
                      ),
                    ), // button width and height
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipOval(
                      child: Material(
                        color: Colors.red, // button color
                        child: InkWell(
                          splashColor: Colors.black, // splash color
                          onTap: () => controller.goback(), // button pressed
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Back",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))
                              ]),
                        ),
                      ),
                    ), // button width and height
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipOval(
                      child: Material(
                        color: Colors.green, // button color
                        child: InkWell(
                          splashColor: Colors.black, // splash color
                          onTap: () {
                            controller.checkOperation(
                                controller.op1,
                                controller.op2,
                                controller.operator,
                                controller.result);
                          }, // button pressed
                          child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("GO!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))
                              ]),
                        ),
                      ),
                    ), // button width and height
                  ),
                ]),
          ),
        ])));
  }
}
