import 'package:jalaali/shared.dart';

/// Translates input format to a readable string date
String translate(String input, DateData date, bool persianNumbers) {
  input = input.replaceAll("YYYY", date.year.toString());
  input = input.replaceAll("YY", date.year.toString().substring(2, 4));
  input = input.replaceAll("MMM", _getJalaaliMonthName(date.month));
  input = input.replaceAll("MM", date.month.toString().padLeft(2, "0"));
  input = input.replaceAll("M", date.month.toString());
  input = input.replaceAll("DDD", _getPersianNumber(date.day));
  input = input.replaceAll("DD", date.day.toString().padLeft(2, "0"));
  input = input.replaceAll("D", date.day.toString());
  if (persianNumbers) {
    input = translateNumbers(input);
  }
  return input;
}

String translateNumbers(String input) {
  input = input.replaceAll("0", "۰");
  input = input.replaceAll("1", "۱");
  input = input.replaceAll("2", "۲");
  input = input.replaceAll("3", "۳");
  input = input.replaceAll("4", "۴");
  input = input.replaceAll("5", "۵");
  input = input.replaceAll("6", "۶");
  input = input.replaceAll("7", "۷");
  input = input.replaceAll("8", "۸");
  input = input.replaceAll("9", "۹");
  return input;
}

/// Returns jalaali month name
String _getJalaaliMonthName(int month) {
  switch (month) {
    case 1:
      return "فروردین";
    case 2:
      return "اردیبهشت";
    case 3:
      return "خرداد";
    case 4:
      return "تیر";
    case 5:
      return "مرداد";
    case 6:
      return "شهریور";
    case 7:
      return "مهر";
    case 8:
      return "آبان";
    case 9:
      return "آذر";
    case 10:
      return "دی";
    case 11:
      return "بهمن";
    case 12:
      return "اسفند";
    default:
      return "خطا";
  }
}

String _getPersianNumber(int number) {
  String output;
  switch (number) {
    case 1:
      output = "یک";
      break;
    case 2:
      output = "دو";
      break;
    case 3:
      output = "سه";
      break;
    case 4:
      output = "چهار";
      break;
    case 5:
      output = "پنج";
      break;
    case 6:
      output = "شش";
      break;
    case 7:
      output = "هفت";
      break;
    case 8:
      output = "هشت";
      break;
    case 9:
      output = "نه";
      break;
    case 10:
      output = "ده";
      break;
    case 11:
      output = "یازده";
      break;
    case 12:
      output = "دوازده";
      break;
    case 13:
      output = "سیزده";
      break;
    case 14:
      output = "چهارده";
      break;
    case 15:
      output = "پانزده";
      break;
    case 16:
      output = "شانزده";
      break;
    case 17:
      output = "هفده";
      break;
    case 18:
      output = "هجده";
      break;
    case 19:
      output = "نونزده";
      break;
    case 20:
      output = "بیست";
      break;
    case 21:
      output = "بیست و یک";
      break;
    case 22:
      output = "بیست و دو";
      break;
    case 23:
      output = "بیست و سه";
      break;
    case 24:
      output = "بیست و چهار";
      break;
    case 25:
      output = "بیست و پنج";
      break;
    case 26:
      output = "بیست و شش";
      break;
    case 27:
      output = "بیست و هفت";
      break;
    case 28:
      output = "بیست و هشت";
      break;
    case 29:
      output = "بیست و نه";
      break;
    case 30:
      output = "سی";
      break;
    case 31:
      output = "سی و یک";
      break;
    case 32:
      output = "سی و دو";
      break;
    default:
      return "خطا";
  }
  return output + "م";
}
