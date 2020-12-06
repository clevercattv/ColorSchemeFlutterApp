import 'dart:ui';

import 'color_scheme.dart';

class ComplementaryScheme extends ColorScheme {
  @override
  List<Color> generateSchemeColors(Color color) {
    return [
      color,
      Color.fromARGB(color.alpha, color.blue, color.green, color.red),
    ];
  }
}