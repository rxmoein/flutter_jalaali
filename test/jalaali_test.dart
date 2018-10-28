import 'package:test/test.dart';

import 'package:jalaali/jalaali.dart';

void main() {
  test('Get current date', () {
    var s = JalaaliDate.now().toString(showTime: true);
    print(s);
    expect(1, 1);
  });
}
