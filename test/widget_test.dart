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

      Widget myButton = FlatButton(
          onPressed: (() {}), child: Image.asset('images/dice1.png'));

      expect(find.byWidget(myButton), findsNothing);
    },
  );

  testWidgets(
    "Checking the image",
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: DicePage())));
      await tester.pump();

      expect(
          find.image(const AssetImage('images/dice1.png')), findsNWidgets(2));
    },
  );

  testWidgets(
    "Tap functionality",
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: DicePage())));

      var myButton = find.byKey(const Key('diceImage'));

      await tester.tap(myButton);
      await tester.pump();

      List<String> imageNames = [
        'dice1.png',
        'dice2.png',
        'dice3.png',
        'dice4.png',
        'dice5.png',
        'dice6.png',
      ];
      var count = 0;

      for (String image in imageNames) {
        var matchings =
            tester.widgetList(find.image(AssetImage("images/$image"))).length;
        count = count + matchings;
      }

      expect(count, 2);
    },
  );
}
