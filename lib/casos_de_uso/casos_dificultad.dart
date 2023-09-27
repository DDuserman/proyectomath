import 'dart:math';
import 'package:f_proyectomath/ui/Controller/number_controller.dart';
import 'package:get/get.dart';

import '../data/remote/user_data.dart';
import '../domain/model/user_model.dart';

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

  goback() {
    if (controller.result.toString().isNotEmpty) {
      var temp = controller.result.substring(0, controller.result.length - 1);
      controller.resetResult();
      controller.setResult(temp);
    } else {
      null;
    }
  }

  checkOperation() {
    double newScore = 0;
    switch (controller.operator) {
      case "+":
        if (controller.op1 + controller.op2 == int.parse(controller.result)) {
          if (controller.fase < 5) {
            controller.incrementFase();
            controller.caso.generateCase();
          } else {
            controller.resetFase();
            controller.stopwatch.stop();
            if (controller.caso.score <= 600) {
              newScore =
                  (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 1.5;
            } else if (controller.caso.score <= 1200) {
              newScore =
                  (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 2.5;
            } else {
              newScore =
                  (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 3.5;
            }
            controller.caso.changeScore(newScore);
            controller.stopwatch.reset();
            UserDataSource().updateUser(User(
                id: 1,
                email: "bkersey66@scientificamerican.com",
                password: "149529828404753",
                score: newScore));
            Get.offNamed('/page2');
          }
          controller.resetResult();
        } else {
          controller.resetResult();
        }
      case "X":
        if (controller.op1 * controller.op2 == int.parse(controller.result)) {
          if (controller.fase < 5) {
            controller.incrementFase();
            controller.caso.generateCase();
          } else {
            controller.resetFase();
            controller.stopwatch.stop();
            if (controller.caso.score <= 600) {
              newScore =
                  (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 1.5;
            } else if (controller.caso.score <= 1200) {
              newScore =
                  (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 2.5;
            } else {
              newScore =
                  (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 3.5;
            }
            controller.caso.changeScore(newScore);
            controller.stopwatch.reset();
            UserDataSource().updateUser(User(
                id: 1,
                email: "bkersey66@scientificamerican.com",
                password: "149529828404753",
                score: newScore));
            Get.offNamed('/page2');
          }
          controller.resetResult();
        } else {
          controller.resetResult();
        }
      case "-":
        if (controller.op1 - controller.op2 == int.parse(controller.result)) {
          if (controller.fase < 5) {
            controller.incrementFase();
            controller.caso.generateCase();
          } else {
            controller.resetFase();
            controller.stopwatch.stop();
            if (controller.caso.score <= 600) {
              newScore =
                  (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 1.5;
            } else if (controller.caso.score <= 1200) {
              newScore =
                  (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 2.5;
            } else {
              newScore =
                  (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 3.5;
            }
            controller.caso.changeScore(newScore);
            controller.stopwatch.reset();
            UserDataSource().updateUser(User(
                id: 1,
                email: "bkersey66@scientificamerican.com",
                password: "149529828404753",
                score: newScore));
            Get.offNamed('/page2');
          }
          controller.resetResult();
        } else {
          controller.resetResult();
        }
      case "/":
        if (controller.op1 / controller.op2 == int.parse(controller.result)) {
          if (controller.fase < 5) {
            controller.incrementFase();
            controller.caso.generateCase();
          } else {
            controller.resetFase();
            controller.stopwatch.stop();
            if (controller.caso.score <= 600) {
              newScore =
                  (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 1.5;
            } else if (controller.caso.score <= 1200) {
              newScore =
                  (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 2.5;
            } else {
              newScore =
                  (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 3.5;
            }
            controller.caso.changeScore(newScore);
            controller.stopwatch.reset();
            UserDataSource().updateUser(User(
                id: 1,
                email: "bkersey66@scientificamerican.com",
                password: "149529828404753",
                score: newScore));
            Get.offNamed('/page2');
          }
          controller.resetResult();
        } else {
          controller.resetResult();
        }
      default:
        null;
    }
  }
}
