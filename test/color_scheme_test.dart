
import 'dart:ui';

import 'package:color_chooser_app/scheme/complementary_scheme.dart';
import 'package:color_chooser_app/scheme/square_scheme.dart';
import 'package:color_chooser_app/scheme/triadic_scheme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Color scheme null argument tests!', () {
    test('ComplementaryScheme must throw exception on null!', () {
      expect(() => ComplementaryScheme().generateSchemeColors(null),
          throwsA(isInstanceOf<NoSuchMethodError>()));
    });

    test('TriadicScheme must throw exception on null!', () {
      expect(() => TriadicScheme().generateSchemeColors(null),
          throwsA(isInstanceOf<NoSuchMethodError>()));
    });

    test('SquareScheme must throw exception on null!', () {
      expect(() => SquareScheme().generateSchemeColors(null),
          throwsA(isInstanceOf<NoSuchMethodError>()));
    });
  });

  group('Color schemes tests!', () {
    const int r = 255;
    const int g = 128;
    const int b = 0;
    var color = Color.fromARGB(255, r, g, b);

    test('ComplementaryScheme.generateSchemeColors return incorrect result!', () {
      List<Color> expectedColors = [
        color,
        Color.fromARGB(color.alpha, color.blue, color.green, color.red),
      ];

      expect(ComplementaryScheme().generateSchemeColors(color), expectedColors);
    });

    test('TriadicScheme.generateSchemeColors return incorrect result!', () {
      List<Color> expectedColors = [
        color,
        Color.fromARGB(color.alpha, color.green, color.blue, color.red),
        Color.fromARGB(color.alpha, color.blue, color.red, color.green),
      ];

      expect(TriadicScheme().generateSchemeColors(color), expectedColors);
    });

    test('SquareScheme.generateSchemeColors return incorrect result!', () {
      List<Color> expectedColors = [
        color,
        Color.fromARGB(color.alpha, color.red, color.blue, color.green),
        Color.fromARGB(color.alpha, color.green, color.red, color.blue),
        Color.fromARGB(color.alpha, color.green, color.blue, color.red),
      ];

      expect(SquareScheme().generateSchemeColors(color), expectedColors);
    });
  });
}