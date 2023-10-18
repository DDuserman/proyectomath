import 'package:f_proyectomath/casos_de_uso/casos_dificultad.dart';
import 'package:f_proyectomath/data/remote/user_data.dart';
import 'package:f_proyectomath/ui/Controller/number_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/Local/preferences.dart';
import 'ui/my_app.dart';

void main() {
  Get.put(LocalPreferences());
  Get.put(UserDataSource());
  Get.put(CasoDificultad());
  Get.put(NumberController());

  runApp(const MyApp());
}
