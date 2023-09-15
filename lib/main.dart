import 'package:f_proyectomath/casos_de_uso/botones_dificultad.dart';
import 'package:f_proyectomath/casos_de_uso/casos_dificultad.dart';
import 'package:f_proyectomath/ui/Controller/number_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/my_app.dart';

void main() {
  Get.put(CasoDificultad());
  Get.put(NumberController());
  Get.put(BotonesDificultad());

  runApp(const MyApp());
}
