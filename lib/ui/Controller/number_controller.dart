import 'dart:math';

import 'package:f_proyectomath/casos_de_uso/casos_dificultad.dart';
import 'package:get/get.dart';

import '../../domain/model/user_model.dart';

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

  //funciones propias
  incrementFase() => _fase.value++;
  setResult(newValue) => _result.value = _result + newValue;

  //funciones externas
  getScore() => caso.score;

  Future<bool> logIn(email, pass) async {
    if (await caso.logInLocal(email, pass)) {
      return true;
    } else {
      return false;
    }
  }

  generateCase(score) {
    int a = 0, b = 0;
    if (score <= 600) {
      int op = Random().nextInt(2);
      if (op == 1) {
        a = Random().nextInt(100);
        b = Random().nextInt(100);
        setOperator("+");
      } else {
        a = Random().nextInt(99) + 1;
        b = Random().nextInt(a);
        setOperator("-");
      }
    } else if (score <= 1200) {
      int op = Random().nextInt(3);
      if (op == 1) {
        a = Random().nextInt(9) + 1;
        b = Random().nextInt(9) + 1;
        setOperator("X");
      } else if (op == 2) {
        a = Random().nextInt(1000);
        b = Random().nextInt(1000);
        setOperator("+");
      } else {
        a = Random().nextInt(999) + 1;
        b = Random().nextInt(a);
        setOperator("-");
      }
    } else {
      int op = Random().nextInt(2);
      if (op == 1) {
        a = Random().nextInt(100);
        b = Random().nextInt(10);
        setOperator("X");
      } else {
        b = Random().nextInt(10);
        a = b * (Random().nextInt(20) + 1);
        setOperator("/");
      }
    }
    setOp1(a);
    setOp2(b);
  }

  cambiarScore(newScore) => caso.changeScore(newScore);

  goback(result) {
    if (result.toString().isNotEmpty) {
      var temp = result.substring(0, result.length - 1);
      resetResult();
      setResult(temp);
    } else {
      null;
    }
  }

  opCorrect(round) {
    int newScore = 0;
    if (round < 4) {
      incrementFase();
      generateCase(caso.score);
    } else {
      resetFase();
      newScore = caso.checkNewScore(stopwatch.elapsed.inSeconds);
      stopwatch.stop();
      stopwatch.reset();
      caso.updateScore(newScore.toDouble());
    }
  }

  bool verificar(op1, op2, operat, result) {
    if (result != "") {
      return caso.checkOperation(op1, op2, operat, result);
    } else {
      return false;
    }
  }

  registerUser(name, email, grade, school, birthday, pass) {
    caso.registerUserData(name, email, grade, school, birthday, pass);

    setUser(name, email, grade, school, birthday, pass);
  }

  setUser(name, email, grade, school, birthday, pass) {
    setUserName(name);
    setEmail(email);
    setGrade(grade);
    setSchool(school);
    setBirthday(birthday);
    setlastName(name);
    setPassword(pass);
  }

  setActualUser(email) async {
    User user = await getUserByQuery(email);
    setUser(user.firstName, user.email, user.grade, user.school, user.birthday,
        user.password);
  }

  Future<User> getUserByQuery(String email) async {
    return await caso.getUserByQuery(email);
  }
}
