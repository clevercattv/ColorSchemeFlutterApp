import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomColor {
  static const _MAX_VALUE = 0x100000000;
  final _random = Random();

  Color nextColor() => Color(_random.nextInt(_MAX_VALUE));
}
