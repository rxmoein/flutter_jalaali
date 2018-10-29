import 'package:test/test.dart';
import 'package:jalaali/jalaali.dart';

void main() {
  test('Current Shamsi Date', () {
    var currentDate = JalaaliDate.now();
    print(currentDate.toString());
    expect(1, 1);
  });
}
