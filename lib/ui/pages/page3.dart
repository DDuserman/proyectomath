import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page3 extends StatelessWidget {
  Page3({super.key, required this.op1,required this.op2,required this.operation, required this.result});
  //Aquí se supone que van las variables

  final int op1;
  final int op2;
  final String operation;
  final int result;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int op1 = 0;
    int op2 = 0;
    String operation= "+";
    int result = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test matemático'),
      ),
      body: Center(
        child: 
          Column(
            children: [
              SizedBox(
                child: Text(
                  //"$op1 $operation $op2"
                  "hola"
                ),
                
              )
            ]
          )
      )
    );
  }
}