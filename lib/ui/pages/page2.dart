import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2 extends StatelessWidget {
  Page2({super.key});
  // Obtain the name parameter from the route
  //final String? name = Get.parameters["name"];
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: 
          ElevatedButton(
            onPressed: () => Get.offNamed('/page3'),
                    child: const Text('Iniciar Test')
          )
      )
    );
  }

}