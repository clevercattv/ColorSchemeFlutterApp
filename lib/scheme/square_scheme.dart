import 'dart:ui';

import 'color_scheme.dart';

class SquareScheme extends ColorScheme {
  @override
  List<Color> generateSchemeColors(Color color) {
    return [
      color,
      Color.fromARGB(color.alpha, color.red, color.blue, color.green),
      Color.fromARGB(color.alpha, color.green, color.red, color.blue),
      Color.fromARGB(color.alpha, color.green, color.blue, color.red),
    ];
  }
}