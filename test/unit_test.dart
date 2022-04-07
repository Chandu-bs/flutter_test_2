import 'package:flutter_test_2/main.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../util/class.dart';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  
test('checking dice function', (() {
  
//setup

Dicefunction dicefunction = Dicefunction(leftDiceNumber: 1, rightDiceNumber: 1);

//do
dicefunction.changeDiceFace();

//test
 expect(dicefunction.leftDiceNumber, 4);


}));





}