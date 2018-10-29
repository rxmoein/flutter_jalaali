import 'package:jalaali/shared.dart';

/// Number of days in a cycle
const int cycle_days = 1029983;

/// Number of years in a cycle
const int cycle_years = 2820;

/// 365 + leapRatio
const double year_length = 365.24219858156028368;

/// 475/01/01 AP, start of 2820 cycle
const int hijri_shamsi_epoch = 2121446;

/// 683.0 / 2820.0
const double leap_threshold = 0.24219858156028368;

/// Determines if shamsi year is leap or not
bool shamsiIsLeap(int year) {
  double result = (year + 2346) * leap_threshold;
  double frac = result - result.toInt();
  if (frac < leap_threshold) {
    return true;
  } else {
    return false;
  }
}

/// Returns shamsi days in month
int shamsiDaysInMonth(int month, int year) {
  if (month > 0 && month <= 12) {
    return month < 7 ? 31 : month < 12 || shamsiIsLeap(year) ? 30 : 29;
  }
  return 0;
}

/// Returns shamsi days in year
int _shamsiDaysInYear(int year) {
  return shamsiIsLeap(year) ? 366 : 365;
}

// Returns shamsi months in tyear
int shamsiMonthInYear(int year) {
  return 12;
}

/// Returns cycle number
int _cycle(int jdn) {
  int offset = jdn - hijri_shamsi_epoch;
  int cycleNo = offset ~/ cycle_days;
  if (offset < 0) {
    --cycleNo;
  }
  return cycleNo;
}

int shamsiIsValid(int year, int month, int day) {
  if (year < 0) ++year;
  if (day > 0 && day <= shamsiDaysInMonth(month, year)) {
    return 1;
  }
  return 0;
}

int cycleStart(int jdn) {
  int era = _cycle(jdn);
  int start = hijri_shamsi_epoch + era * cycle_days;
  return start;
}

/// Returns first day of year in a cycle
int fdoyc(int year, int cycleNo) {
  /// Day in cycle
  double dc = (year * year_length);
  int fdoyc = dc.floor();
  return hijri_shamsi_epoch + cycleNo * cycle_days + fdoyc;
}

int fdoy(int year) {
  int cycleNumber = year ~/ cycle_years;
  // First day of year in a cycle
  int fdoyc;
  // Day number in cycle
  double dc;
  year -= 475;
  if (year < 0) {
    cycleNumber--;
  }
  year -= (cycleNumber * cycle_years);
  dc = (year * year_length);
  fdoyc = dc.floor();
  return hijri_shamsi_epoch + cycleNumber * cycle_days + fdoyc;
}

/// Convert shamsi to julian day number
int shamsiToJdn(int year, int month, int day) {
  /* Adjust the offset of year 0 */
  int era = 0;
  int dy = 0;
  int yc = 0;
  int fd = 0;
  int i = 0;
  if (year < 0) {
    ++year;
  }
  era = (year - 475) ~/ cycle_years;
  if ((year - 475) < 0) {
    --era;
  }
  yc = (year - 475) - era * cycle_years;
  fd = fdoyc(yc, era);
  dy = 0;
  for (i = 1; i < month; ++i) {
    dy += shamsiDaysInMonth(i, year);
  }
  dy += day;
  return fd + dy - 1;
}

DateData jdnToShamsi(int jd) {
  int c = _cycle(jd);
  int yc = ((jd - cycleStart(jd)) ~/ year_length);
  int y = yc + 475 + c * 2820;
  int d = jd - fdoyc(yc, c) + 1;
  int m = 0;
  if (d > _shamsiDaysInYear(y)) {
    y++;
    d = 1;
  }
  if (y <= 0) {
    y--;
  }
  for (m = 1; m < 12; ++m) {
    if (d > shamsiDaysInMonth(m, y)) {
      d -= shamsiDaysInMonth(m, y);
    } else {
      break;
    }
  }

  return new DateData(y, m, d);
}
