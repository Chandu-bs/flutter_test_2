// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: deprecated_member_use

import 'dart:ffi';
import 'dart:math';
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
  "Checking the flatbutton widget",
  (WidgetTester tester) async {
 
  await tester.pumpWidget(MaterialApp(home: DicePage()));
  
  Widget myButton = FlatButton(onPressed: (() { }), child: Image.asset('images/dice1.png'));

  expect(find.byWidget(myButton), findsNothing);
  

  },
);

testWidgets(
  "Checking the image",
  (WidgetTester tester) async {

  await tester.pumpWidget(MaterialApp(home: Scaffold(body: DicePage())));
  await tester.pump();
  
  expect(find.image(const AssetImage('images/dice1.png')), findsNWidgets(2));

  },
);

testWidgets(
  "Checking tap function",
  (WidgetTester tester) async {

  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  await tester.pumpWidget(MaterialApp(home: Scaffold(body: DicePage())));
  await tester.pump();
  
  
  Widget myButton = FlatButton(onPressed: (() { changeDiceFace(); }), child: Image.asset('images/dice1.png'));

  await tester.tap(find.byWidget(myButton));
  await tester.pump();

  expect(find.image(AssetImage("images/dice$leftDiceNumber.png")), findsOneWidget);
  expect(find.image(AssetImage("images/dice$rightDiceNumber.png")), findsOneWidget);


  },
);

}
