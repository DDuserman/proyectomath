import 'package:f_proyectomath/casos_de_uso/casos_dificultad.dart';
import 'package:get/get.dart';

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
}
