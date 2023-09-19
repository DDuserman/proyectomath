import 'dart:math';
import 'package:f_proyectomath/ui/Controller/number_controller.dart';
import 'package:get/get.dart';

class CasoDificultad {
  late NumberController controller = Get.find();
  double _score = 0;
  double get score => _score;
  changeScore(double newScore) => _score = newScore;

  generateCase() {
    if (_score <= 600) {
      controller.setOp1(Random().nextInt(100));
      controller.setOp2(Random().nextInt(100));
      controller.setOperator("+");
    } else if (_score <= 1200) {
      controller.setOp1(Random().nextInt(10));
      controller.setOp2(Random().nextInt(10));
      controller.setOperator("X");
    } else {
      controller.setOp1(Random().nextInt(100));
      controller.setOp2(Random().nextInt(10));
      controller.setOperator("X");
    }
  }
}
