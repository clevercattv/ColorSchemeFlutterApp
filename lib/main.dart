import 'package:color_chooser_app/scheme/color_scheme.dart' as Scheme;
import 'package:color_chooser_app/scheme/complementary_scheme.dart';
import 'package:color_chooser_app/scheme/square_scheme.dart';
import 'package:color_chooser_app/scheme/triadic_scheme.dart';
import 'package:color_chooser_app/util/random_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ColorSchemeApp());
}

class ColorSchemeApp extends StatelessWidget {
  static const APP_TITLE = 'Color scheme application';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ColorSchemePage(),
    );
  }
}

class ColorSchemePage extends StatefulWidget {
  ColorSchemePage({Key key}) : super(key: key);

  @override
  _ColorSchemeWidgetState createState() => _ColorSchemeWidgetState();
}

class _ColorSchemeWidgetState extends State<ColorSchemePage> {
  static const _APP_BAR_TEXT = 'Solid Software test task';
  static const _MIDDLE_SCREEN_TEXT = 'Hey there';

  final _randomColor = RandomColor();
  final _navigationFunctions = [];
  final _colorSchemes = <Scheme.ColorScheme>[
    ComplementaryScheme(),
    TriadicScheme(),
    SquareScheme()
  ];

  int _colorSchemeIndex = 0;
  int _navigationPageIndex = 0;
  Color _backgroundColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    _navigationFunctions.addAll([_mainPage, _colorChooserPage]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_APP_BAR_TEXT),
      ),
      body: _selectedNavigationPage(context),
      bottomNavigationBar: BottomNavigationBar(
        key: Key('bottom_navigation'),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_late),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.color_lens),
            label: 'Color scheme',
          ),
        ],
        currentIndex: _navigationPageIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _changeNavigationPage,
      ),
    );
  }

  void _changeNavigationPage(int index) => setState(() {
        _navigationPageIndex = index;
      });

  void _changeBackground() => setState(() {
        _backgroundColor = _randomColor.nextColor();
      });

  void _changeColorScheme(int index) => setState(() {
        _colorSchemeIndex = index;
      });

  Widget _selectedNavigationPage(BuildContext context) {
    return _navigationFunctions.elementAt(_navigationPageIndex)(context);
  }

  Scheme.ColorScheme _selectedColorScheme() {
    return _colorSchemes.elementAt(_colorSchemeIndex);
  }

  Widget _mainPage(BuildContext context) => GestureDetector(
        onTap: _changeBackground,
        child: Center(
          child: Container(
            key: Key('main_container'),
            decoration: BoxDecoration(
              color: _backgroundColor,
            ),
            child: _borderedMiddleText(),
          ),
        ),
      );

  Widget _borderedMiddleText() => Center(
    child: Stack(
      children: [
        Text(
          _MIDDLE_SCREEN_TEXT,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.5
              ..color = Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          _MIDDLE_SCREEN_TEXT,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );

  Widget _colorChooserPage(BuildContext context) {
    List<Widget> colors = <Widget>[
      ..._selectedColorScheme()
          .generateSchemeColors(_backgroundColor)
          .map((color) => Container(
                color: color,
                child: Center(
                  child:
                      Text('RGB(${color.red}, ${color.green}, ${color.blue})'),
                ),
              ))
    ];
    colors.first = GestureDetector(
      onTap: _changeBackground,
      child: colors.first,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        ...colors.map((color) => Expanded(child: color)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlineButton(
              onPressed: () => _changeColorScheme(0),
              child: const Text('Complementary'),
            ),
            OutlineButton(
              onPressed: () => _changeColorScheme(1),
              child: const Text('Triadic'),
            ),
            OutlineButton(
              onPressed: () => _changeColorScheme(2),
              child: const Text('Square'),
            ),
          ],
        )
      ],
    );
  }
}
