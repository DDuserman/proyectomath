import 'package:f_proyectomath/domain/repository/repository.dart';
import 'package:f_proyectomath/ui/Controller/number_controller.dart';
import 'package:get/get.dart';

import '../domain/model/user_model.dart';

class CasoDificultad {
  late NumberController controller = Get.find();
  final repo = Repository();

  double _score = 0.truncateToDouble();
  double get score => _score;
  changeScore(double newScore) => _score = newScore;

  registerUserData(name, email, grade, school, birthday, pass) async {
    repo.registerUserData(name, email, grade, school, birthday, pass);
  }

  Future<bool> logInLocal<bool>(tryEmail, tryPass) async {
    bool log = (await repo.login(tryEmail, tryPass)) as bool;
    return log;
  }

  int checkNewScore(time) {
    int newScore = 0;
    if (score <= 600) {
      newScore = ((450.0 - time) * 1.1 * 1.5).round();
    } else if (score <= 1200) {
      newScore = ((450.0 - time) * 1.1 * 2.5).round();
    } else {
      newScore = ((450.0 - time) * 1.1 * 3.5).round();
    }
    return newScore;
  }

  bool checkOperation(op1, op2, operat, result) {
    switch (operat) {
      case "+":
        if (op1 + op2 == result) {
          return true;
        } else {
          return false;
        }
      case "X":
        if (op1 * op2 == result) {
          return true;
        } else {
          return false;
        }
      case "-":
        if (op1 - op2 == result) {
          return true;
        } else {
          return false;
        }
      case "/":
        if (op1 / op2 == result) {
          return true;
        } else {
          return false;
        }
      default:
        return false;
    }
  }

  updateScore(newscore) {
    changeScore(newscore);
    repo.updateUser(newscore);
  }

  Future<User> getUserByQuery(String email) async {
    return await repo.getUserByQuery(email);
  }

  Future<double> getLocalScore() async {
    return await repo.getLocalScore();
  }

  Future<String> getLocalName() async {
    return await repo.getLocalName();
  }
}
