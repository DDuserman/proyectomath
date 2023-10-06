import 'package:f_proyectomath/casos_de_uso/casos_dificultad.dart';
import 'package:get/get.dart';

class NumberController extends GetxController {
  final CasoDificultad caso = Get.find();
  final stopwatch = Stopwatch();

  //info de cuenta
  final _email = ''.obs;
  final _userName = ''.obs;
  final _grade = ''.obs;
  final _school = ''.obs;
  final _birthday = ''.obs;
  final _lastName = ''.obs;
  final _password = ''.obs;

  //funcionalidad de operaciones
  final _op1 = 0.obs;
  final _op2 = 0.obs;
  final _operator = "+".obs;
  final _result = "".obs;
  final _fase = 0.obs;

  //info de cuenta
  String get userName => _userName.value;
  String get email => _email.value;
  String get grade => _grade.value;
  String get school => _school.value;
  String get birthday => _birthday.value;
  String get lastName => _lastName.value;
  String get password => _password.value;

  //funcionalidad de operaciones
  int get op1 => _op1.value;
  int get op2 => _op2.value;
  String get operator => _operator.value;
  String get result => _result.value;
  int get fase => _fase.value;

  //info de cuenta
  setUserName(newValue) => _userName.value = newValue;
  setEmail(newValue) => _email.value = newValue;
  setGrade(newValue) => _grade.value = newValue;
  setSchool(newValue) => _school.value = newValue;
  setBirthday(newValue) => _birthday.value = newValue;
  setlastName(newValue) => _lastName.value = newValue;
  setPassword(newValue) => _password.value = newValue;

  //funcionalidad de operaciones
  setOp1(newValue) => _op1.value = newValue;
  setOp2(newValue) => _op2.value = newValue;
  setOperator(newValue) => _operator.value = newValue;
  resetResult() => _result.value = "";
  resetFase() => _fase.value = 0;

  incrementFase() => _fase.value++;
  setResult(newValue) => _result.value = _result + newValue;
}
