import 'dart:math';
import 'package:f_proyectomath/ui/Controller/number_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/Local/preferences.dart';
import '../data/remote/user_data.dart';
import '../domain/model/user_model.dart';

class CasoDificultad {
  late NumberController controller = Get.find();
  final sharedPreferences = LocalPreferences();

  double _score = 0.truncateToDouble();
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

  registerUserData(name, email, grade, school, birthday, pass) async {
    // primero guardar en preferences
    await sharedPreferences.storeData<String>('userName', name);
    await sharedPreferences.storeData<String>('email', email);
    await sharedPreferences.storeData<String>('grade', grade);
    await sharedPreferences.storeData<String>('school', school);
    await sharedPreferences.storeData<String>('bd', birthday);
    await sharedPreferences.storeData<String>('lastName', name);
    await sharedPreferences.storeData<double>('score', score);
    await sharedPreferences.storeData<String>('pass', pass);

    // se cambian los valores locales
    controller.setUserName(name);
    controller.setEmail(email);
    controller.setGrade(grade);
    controller.setSchool(school);
    controller.setBirthday(birthday);
    controller.setlastName(name);
    controller.setPassword(pass);
  }

  Future<bool> logInLocal<bool>(try_email, try_pass) async {
    String email =
        await sharedPreferences.retrieveData<String>('email') as String;
    String pass =
        await sharedPreferences.retrieveData<String>('pass') as String;

    if (email == try_email && pass == try_pass) {
      return true as bool;
    } else {
      return false as bool;
    }
  }

  correctAnswer(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Very well done ${controller.userName}'),
            content: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Correct Answer!'),
            ),
          );
        });
  }

  wrongAnswer(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Oh no! ${controller.userName}'),
            content: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Incorrect Answer!'),
            ),
          );
        });
  }

  opCorrect(context) {
    double newScore = 0;
    correctAnswer(context);
    if (controller.fase < 5) {
      controller.incrementFase();
      controller.caso.generateCase();
    } else {
      controller.resetFase();
      controller.stopwatch.stop();
      if (controller.caso.score <= 600) {
        newScore = (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 1.5;
      } else if (controller.caso.score <= 1200) {
        newScore = (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 2.5;
      } else {
        newScore = (450.0 - controller.stopwatch.elapsed.inSeconds) * 1.1 * 3.5;
      }
      controller.caso.changeScore(newScore);
      controller.stopwatch.reset();
      UserDataSource().updateUser(User(
          id: 1,
          email: "bkersey66@scientificamerican.com",
          password: "012345678901234",
          score: newScore));

      sharedPreferences.storeData<double>('score', newScore);

      Get.offNamed('/page2');
    }
  }

  checkOperation(context) {
    switch (controller.operator) {
      case "+":
        if (controller.op1 + controller.op2 == int.parse(controller.result)) {
          opCorrect(context);
          controller.resetResult();
        } else {
          controller.resetResult();
          wrongAnswer(context);
        }
      case "X":
        if (controller.op1 * controller.op2 == int.parse(controller.result)) {
          opCorrect(context);
          controller.resetResult();
        } else {
          controller.resetResult();
          wrongAnswer(context);
        }
      case "-":
        if (controller.op1 - controller.op2 == int.parse(controller.result)) {
          opCorrect(context);
          controller.resetResult();
        } else {
          controller.resetResult();
          wrongAnswer(context);
        }
      case "/":
        if (controller.op1 / controller.op2 == int.parse(controller.result)) {
          opCorrect(context);
          controller.resetResult();
        } else {
          controller.resetResult();
          wrongAnswer(context);
        }
      default:
        null;
    }
  }
}
