import 'package:f_proyectomath/casos_de_uso/casos_dificultad.dart';
import 'package:get/get.dart';

class BotonesDificultad {
  final CasoDificultad caso = Get.find();

  lvlEasy() {
    caso.changeScore(0);
    caso.generateCase();
    Get.toNamed('/page3');
  }

  lvlMid() {
    caso.changeScore(601);
    caso.generateCase();
    Get.toNamed('/page3');
  }

  lvlHard() {
    caso.changeScore(1201);
    caso.generateCase();
    Get.toNamed('/page3');
  }

  lvlPredet() {
    caso.generateCase();
    Get.toNamed('/page3');
  }
}
