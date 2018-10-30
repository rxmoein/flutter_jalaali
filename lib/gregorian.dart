import 'package:jalaali/math.dart';
import 'package:jalaali/shared.dart';

bool gregorianIsLeap(int year) {
  if ((year & 3) == 0 && ((year % 25) != 0 || (year & 15) == 0)) {
    return true;
  } else {
    return false;
  }
}

int gregorianDaysInMonth(int month, int year) {
  switch (month) {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
      return 31;
      break;
    case 4:
    case 6:
    case 9:
    case 11:
      return 30;
      break;
    case 02:
      return gregorianIsLeap(year) ? 29 : 28;
      break;
    default:
      return 0;
      break;
  }
}

int gregorianDaysInYear(int year) {
  return gregorianIsLeap(year) ? 366 : 365;
}

int _gregorianMonthInYear(int year) {
  return 12;
}

bool gregorianIsValid(int year, int month, int day) {
  if (month <= _gregorianMonthInYear(year) &&
      day <= gregorianDaysInMonth(month, year)) {
    return true;
  }
  return false;
}

int gregorianToJdn(int year, int month, int day) {
  int c0 = fdiv((month - 3), 12);
  int x1 = month - (12 * c0) - 3;
  int x4 = year + c0;
  Div d = pdiv(x4, 100);
  int jd = fdiv(146097 * d.quot, 4) +
      fdiv(36525 * d.rem, 100) +
      fdiv(153 * x1 + 2, 5) +
      day +
      1721119;
  return jd;
}

DateData jdnToGregorian(int jd) {
  Div x3 = pdiv(4 * jd - 6884477, 146097);
  Div x2 = pdiv(100 * (x3.rem ~/ 4) + 99, 36525);
  Div x1 = pdiv(5 * (x2.rem ~/ 100) + 2, 153);
  int c0 = (x1.quot + 2) ~/ 12;

  int day = (x1.rem ~/ 5) + 1;
  int month = x1.quot - 12 * c0 + 3;
  int year = 100 * x3.quot + x2.quot + c0;

  return DateData(year, month, day);
}
