import 'dart:math';
import 'package:flutter/material.dart';

class Dicefunction {
  
Dicefunction({required this.leftDiceNumber, required this.rightDiceNumber});

int leftDiceNumber;
int rightDiceNumber;

  void changeDiceFace() {
    
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
   
  }

  }