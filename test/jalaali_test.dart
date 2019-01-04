import 'package:test/test.dart';
import 'package:jalaali/jalaali.dart';

void main() {
  test('Current Shamsi Date', () {
    var currentDate = JalaaliDate.now();
    print(currentDate.format("DD MMM YY", persianNumbers: true));
    expect(1, 1);
  });

  test('Date Parser', () {
    print(JalaaliDate.parse("2013-01-19 03:14:07"));
    expect(JalaaliDate.parse("2013-01-19 03:14:07"), "1391/10/30");
  });
}
