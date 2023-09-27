import 'package:f_proyectomath/casos_de_uso/casos_dificultad.dart';
import 'package:f_proyectomath/domain/model/user_model.dart';
import 'package:get/get.dart';

import '../../data/remote/user_data.dart';

class NumberController extends GetxController {
  final CasoDificultad caso = Get.find();
  final stopwatch = Stopwatch();

  final _op1 = 0.obs;
  final _op2 = 0.obs;
  final _operator = "+".obs;
  final _result = "".obs;
  final _fase = 0.obs;

  int get op1 => _op1.value;
  int get op2 => _op2.value;
  String get operator => _operator.value;
  String get result => _result.value;
  int get fase => _fase.value;

  setOp1(newValue) => _op1.value = newValue;
  setOp2(newValue) => _op2.value = newValue;
  setOperator(newValue) => _operator.value = newValue;
  resetResult() => _result.value = "";
  resetFase() => _fase.value = 0;

  incrementFase() => _fase.value++;
  setResult(newValue) => _result.value = _result + newValue;
  goback() {
    if (_result.toString().isNotEmpty) {
      _result.value = _result.value.substring(0, _result.value.length - 1);
    } else {
      null;
    }
  }

  checkOperation(prim, sec, op, res) {
    double newScore = 0;
    switch (op) {
      case "+":
        if (prim + sec == int.parse(res)) {
          if (fase < 5) {
            incrementFase();
            caso.generateCase();
          } else {
            resetFase();
            stopwatch.stop();
            if (caso.score <= 600) {
              newScore = (450.0 - stopwatch.elapsed.inSeconds) * 1.1 * 1.5;
            } else if (caso.score <= 1200) {
              newScore = (450.0 - stopwatch.elapsed.inSeconds) * 1.1 * 2.5;
            } else {
              newScore = (450.0 - stopwatch.elapsed.inSeconds) * 1.1 * 3.5;
            }
            caso.changeScore(newScore);
            stopwatch.reset();
            UserDataSource().updateUser(User(
                id: 1,
                email: "bkersey66@scientificamerican.com",
                password: "149529828404753",
                score: newScore));
            Get.offNamed('/page2');
          }
          resetResult();
        } else {
          resetResult();
        }
      case "X":
        if (prim * sec == int.parse(res)) {
          if (fase < 5) {
            incrementFase();
            caso.generateCase();
          } else {
            resetFase();
            stopwatch.stop();
            if (caso.score <= 600) {
              newScore = (450.0 - stopwatch.elapsed.inSeconds) * 1.1 * 1.5;
            } else if (caso.score <= 1200) {
              newScore = (450.0 - stopwatch.elapsed.inSeconds) * 1.1 * 2.5;
            } else {
              newScore = (450.0 - stopwatch.elapsed.inSeconds) * 1.1 * 3.5;
            }
            caso.changeScore(newScore);
            stopwatch.reset();

            Get.offNamed('/page2');
          }
          resetResult();
        } else {
          resetResult();
        }
      case "-":
        if (prim - sec == int.parse(res)) {
          if (fase < 5) {
            incrementFase();
            caso.generateCase();
          } else {
            resetFase();
            stopwatch.stop();
            if (caso.score <= 600) {
              newScore = (450.0 - stopwatch.elapsed.inSeconds) * 1.1 * 1.5;
            } else if (caso.score <= 1200) {
              newScore = (450.0 - stopwatch.elapsed.inSeconds) * 1.1 * 2.5;
            } else {
              newScore = (450.0 - stopwatch.elapsed.inSeconds) * 1.1 * 3.5;
            }
            caso.changeScore(newScore);
            stopwatch.reset();

            Get.offNamed('/page2');
          }
          resetResult();
        } else {
          resetResult();
        }
      case "/":
        if (prim / sec == int.parse(res)) {
          if (fase < 5) {
            incrementFase();
            caso.generateCase();
          } else {
            resetFase();
            stopwatch.stop();
            if (caso.score <= 600) {
              newScore = (450.0 - stopwatch.elapsed.inSeconds) * 1.1 * 1.5;
            } else if (caso.score <= 1200) {
              newScore = (450.0 - stopwatch.elapsed.inSeconds) * 1.1 * 2.5;
            } else {
              newScore = (450.0 - stopwatch.elapsed.inSeconds) * 1.1 * 3.5;
            }
            caso.changeScore(newScore);
            stopwatch.reset();

            Get.offNamed('/page2');
          }
          resetResult();
        } else {
          resetResult();
        }
      default:
        null;
    }
  }
}
