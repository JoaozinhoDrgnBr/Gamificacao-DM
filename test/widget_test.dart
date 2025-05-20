// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:atividade4/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App inicializa sem crash', (WidgetTester tester) async {
    // Carrega o app
    await tester.pumpWidget(MyApp());

    // Verifica se algum widget básico aparece
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
