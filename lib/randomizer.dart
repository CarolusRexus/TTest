import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'dart:math';

class ColorsRandomizer {
  final _colorSub = BehaviorSubject<Color>();
  Stream<Color> get randomColor => _colorSub.stream;

  //
  void updateColor() async {
    print('Color update request');

    _colorSub.add(getRandomColor());
  }

  //
  Color getRandomColor() {
    List<int> argb = List.generate(4, (_) => rand255());
    print('ARGB $argb');
    return Color.fromARGB(argb[0], argb[1], argb[2], argb[3]); //nice
  }

  //
  int rand255() {
    return Random().nextInt(255);
  }
}
