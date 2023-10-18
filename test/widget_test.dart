// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:build_runner/build_runner.dart';
import 'package:f_proyectomath/casos_de_uso/casos_dificultad.dart';
import 'package:f_proyectomath/data/Local/preferences.dart';
import 'package:f_proyectomath/data/remote/user_data.dart';
import 'package:f_proyectomath/ui/Controller/number_controller.dart';
import 'package:f_proyectomath/ui/my_app.dart';
import 'package:f_proyectomath/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Login no Password', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    Get.put(LocalPreferences());
    Get.put(UserDataSource());
    Get.put(CasoDificultad());
    Get.put(NumberController());
    await tester.pumpWidget(MyApp());

    await tester.enterText(
        find.byKey(const Key('campoCorreo')), 'correo@a.com');
    await tester.tap(find.byKey(const Key('LoginButton')));
    await tester.pump();

    expect(find.text('Identificate'), findsOneWidget);
  });
}
