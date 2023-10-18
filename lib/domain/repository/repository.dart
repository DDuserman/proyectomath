import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:f_proyectomath/data/Local/preferences.dart';
import 'package:f_proyectomath/data/remote/user_data.dart';
import 'package:get/get.dart';

import '../../data/remote/authentication_data.dart';
import '../model/user_model.dart';

class Repository {
  late AuthenticationDatasource _authenticationDataSource;
  final UserDataSource dbData = Get.find();
  final LocalPreferences sharedPreferences = Get.find();

  Repository() {
    _authenticationDataSource = AuthenticationDatasource();
  }

  Future<bool> login(String email, String password) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      var localemail = await sharedPreferences.retrieveData<String>('email');
      var localpass = await sharedPreferences.retrieveData<String>('pass');

      if (email == localemail && password == localpass) {
        return true;
      } else {
        return false;
      }
    } else {
      var user = await dbData.getUserbyquery(email);
      if (user.password == password) {
        await sharedPreferences.storeData<int>('id', user.id!);
        await sharedPreferences.storeData<String>('userName', user.firstName!);
        await sharedPreferences.storeData<String>('email', user.email);
        await sharedPreferences.storeData<String>('grade', user.grade!);
        await sharedPreferences.storeData<String>('school', user.school!);
        await sharedPreferences.storeData<String>('bd', user.birthday!);
        await sharedPreferences.storeData<String>('lastName', user.lastName!);
        await sharedPreferences.storeData<double>('score', user.score!);
        await sharedPreferences.storeData<String>('pass', user.password);
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> signUp(form) async {
    if (await dbData.addUser(form)) {
      print('user created');
      print('saving local values');
      return true;
    } else {
      return false;
    }
  }

  Future<int> getscore() async {
    int score = await sharedPreferences.retrieveData("score");
    return score;
  }

  Future<bool> logOut() async => await _authenticationDataSource.logOut();

  Future<void> updateUser(score) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      User user = User(
          id: await sharedPreferences.retrieveData<int>("id"),
          email:
              await sharedPreferences.retrieveData<String>('email') as String,
          grade:
              await sharedPreferences.retrieveData<String>('grade') as String,
          school:
              await sharedPreferences.retrieveData<String>('school') as String,
          birthday:
              await sharedPreferences.retrieveData<String>('bd') as String,
          lastName: await sharedPreferences.retrieveData<String>('lastName')
              as String,
          firstName: await sharedPreferences.retrieveData<String>('userName')
              as String,
          password:
              await sharedPreferences.retrieveData<String>('pass') as String,
          score: score);

      await UserDataSource().updateUser(user);
    }
    await sharedPreferences.storeData<double>("score", score);
  }

  registerUserData(name, email, grade, school, birthday, pass) async {
    // primero guardar en preferences
    await sharedPreferences.storeData<String>('userName', name);
    await sharedPreferences.storeData<String>('email', email);
    await sharedPreferences.storeData<String>('grade', grade);
    await sharedPreferences.storeData<String>('school', school);
    await sharedPreferences.storeData<String>('bd', birthday);
    await sharedPreferences.storeData<String>('lastName', name);
    await sharedPreferences.storeData<double>('score', 0);
    await sharedPreferences.storeData<String>('pass', pass);

    // Luego se guarda en la API
    var newUser = User(
        firstName: name,
        lastName: name,
        email: email,
        password: pass,
        birthday: birthday,
        grade: grade,
        school: school,
        score: 0);
    await dbData.addUser(newUser);

    int identifier = (await getUserByQuery(email)).id!;
    await sharedPreferences.storeData<int>('id', identifier);
  }

  Future<User> getUserByQuery(String email) async {
    return await dbData.getUserbyquery(email);
  }

  Future<double> getLocalScore() async {
    return await sharedPreferences.retrieveData<double>('score') as double;
  }

  Future<String> getLocalName() async {
    return await sharedPreferences.retrieveData<String>('userName') as String;
  }
}
