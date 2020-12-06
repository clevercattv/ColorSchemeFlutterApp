import 'dart:ui';

import 'color_scheme.dart';

class TriadicScheme extends ColorScheme {
  @override
  List<Color> generateSchemeColors(Color color) {
    return [
      color,
      Color.fromARGB(color.alpha, color.green, color.blue, color.red),
      Color.fromARGB(color.alpha, color.blue, color.red, color.green),
    ];
  }
}