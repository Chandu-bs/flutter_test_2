// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test_2/main.dart';

void main() {
  testWidgets(
    "Checking the dicee name on appbar",
    (WidgetTester tester) async {

    await tester.pumpWidget(const MyApp());
     
    expect(find.text('Dicee'), findsOneWidget);

    },
  );

testWidgets(
  "Checking the dice image at the start",
  (WidgetTester tester) async {
 
  await tester.pumpWidget(const MaterialApp());
  await tester.pump();

  expect(find.image(const AssetImage("images/dice1.png")), findsOneWidget);
  

  },
);

}
