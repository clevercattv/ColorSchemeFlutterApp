import 'dart:math';

import 'package:flutter/cupertino.dart';

class RandomColor {
  static const _MAX_VALUE = 0xFFFFFFFF;
  final _random = Random();

  Color nextColor() => Color(_random.nextInt(_MAX_VALUE));
}
