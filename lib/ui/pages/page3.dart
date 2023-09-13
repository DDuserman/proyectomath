import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page3 extends StatelessWidget {
  Page3({super.key, required this.op1,required this.op2,required this.operation});
  //Aquí se supone que van las variables

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test matemático'),
      ),
      body: Center(
        child: 
          Column(
            children: [
              SizedBox(
                //Text()
              )
            ]
          )
      )
    );
  }
}