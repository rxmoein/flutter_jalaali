import 'package:test/test.dart';
import 'package:jalaali/jalaali.dart';

void main() {
  test('Current Shamsi Date', () {
    var currentDate = JalaaliDate.now();
    print(currentDate.format("DD MMM YY", persianNumbers: true));
    expect(1, 1);
  });
}
