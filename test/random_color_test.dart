
import 'package:color_chooser_app/util/random_color.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //yea we have little chance to get similar color
  test('RandomColor.nextColor() must return different colors!', () {
    var randomColor = RandomColor();
    expect(randomColor.nextColor(), isNot(equals(randomColor.nextColor())));
  });
}