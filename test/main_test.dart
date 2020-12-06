import 'package:color_chooser_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Widget mainPage test!', () {
    testWidgets('Initiate color must be blue!', (WidgetTester tester) async {
      Color expectedColor = Colors.blue;
      await tester.pumpWidget(ColorSchemeApp());

      var finder = find.byKey(Key('main_container'));
      Widget widget = tester.widget(finder);
      Decoration decoration = (widget as Container).decoration;
      BoxDecoration boxDecoration = decoration as BoxDecoration;

      expect(boxDecoration.color, expectedColor);
    });

    testWidgets('Background color doesn\'t changes!', (WidgetTester tester) async {
      Color expectedColor = Colors.blue;
      await tester.pumpWidget(ColorSchemeApp());

      var finder = find.byKey(Key('main_container'));
      await tester.tap(finder);
      await tester.pump();

      Widget widget = tester.widget(finder);
      Decoration decoration = (widget as Container).decoration;
      BoxDecoration boxDecoration = decoration as BoxDecoration;

      expect(boxDecoration.color, isNot(equals(expectedColor)));
    });

    testWidgets('There is no Hey there text!', (WidgetTester tester) async {
      String expectedText = 'Hey there';
      await tester.pumpWidget(ColorSchemeApp());

      expect(find.text(expectedText), findsWidgets);
    });

  });

  group('Color scheme tests!', () {
    testWidgets('Navigation didn\'t work!', (WidgetTester tester) async {
      String middleText = 'Hey there';
      List<String> expectedText = [
        'RGB(33, 150, 243)',
        'RGB(243, 150, 33)',
        'Complementary',
        'Triadic',
        'Square',
      ];
      await tester.pumpWidget(ColorSchemeApp());

      await tester.tap(find.text('Color scheme'));
      await tester.pump();

      expect(find.text(middleText), findsNothing);
      expectedText.forEach((text) => expect(find.text(text), findsOneWidget));
    });

    testWidgets('Background color didn\'t change after tap main color!', (WidgetTester tester) async {
      List<String> expectedText = [
        'Complementary',
        'Triadic',
        'Square',
      ];
      List<String> unhopedText = [
        'RGB(33, 150, 243)',
        'RGB(243, 150, 33)',
      ];
      await tester.pumpWidget(ColorSchemeApp());

      await tester.tap(find.text('Color scheme'));
      await tester.pump();
      await tester.tap(find.text('RGB(33, 150, 243)'));
      await tester.pump();

      unhopedText.forEach((text) => expect(find.text(text), findsNothing));
      expectedText.forEach((text) => expect(find.text(text), findsOneWidget));
    });

    testWidgets('Triadic color scheme return unexpected colors!', (WidgetTester tester) async {
      List<String> expectedText = [
        'RGB(33, 150, 243)',
        'RGB(150, 243, 33)',
        'RGB(243, 33, 150)',
      ];
      await tester.pumpWidget(ColorSchemeApp());

      await tester.tap(find.text('Color scheme'));
      await tester.pump();
      await tester.tap(find.text('Triadic'));
      await tester.pump();

      expectedText.forEach((text) => expect(find.text(text), findsOneWidget));
    });

    testWidgets('Square color scheme return unexpected colors!', (WidgetTester tester) async {
      List<String> expectedText = [
        'RGB(33, 150, 243)',
        'RGB(33, 243, 150)',
        'RGB(150, 33, 243)',
        'RGB(150, 243, 33)',
      ];
      await tester.pumpWidget(ColorSchemeApp());

      await tester.tap(find.text('Color scheme'));
      await tester.pump();
      await tester.tap(find.text('Square'));
      await tester.pump();

      expectedText.forEach((text) => expect(find.text(text), findsOneWidget));
    });
  });

}
