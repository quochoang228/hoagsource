import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  bool get isToday {
    final nowDate = DateTime.now();
    return year == nowDate.year && month == nowDate.month && day == nowDate.day;
  }

  bool get isYesterday {
    final nowDate = DateTime.now();
    const oneDay = Duration(days: 1);
    return nowDate.subtract(oneDay).isSameDate(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }

  bool isSameYear(DateTime other) {
    return year == other.year;
  }

  /// return current time in milliseconds
  int toMillisecondsTimeStamp() => millisecondsSinceEpoch;

  int toTimeStamp() => (millisecondsSinceEpoch ~/ 1000).toInt();

  /// return true if given year is an leap year
  bool leapYear() {
    bool leapYear = false;

    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true) {
      leapYear = false;
    } else if (year % 4 == 0) {
      leapYear = true;
    }

    return leapYear;
  }

  /// returns number of days in given month
  int daysInMonth(int monthNum) {
    List<int> monthLength = List.filled(12, 0);

    monthLength[0] = 31;
    monthLength[2] = 31;
    monthLength[4] = 31;
    monthLength[6] = 31;
    monthLength[7] = 31;
    monthLength[9] = 31;
    monthLength[11] = 31;
    monthLength[3] = 30;
    monthLength[8] = 30;
    monthLength[5] = 30;
    monthLength[10] = 30;

    if (leapYear()) {
      monthLength[1] = 29;
    } else {
      monthLength[1] = 28;
    }

    return monthLength[monthNum - 1];
  }

  String toTime(BuildContext context) =>
      TimeOfDay.fromDateTime(asLocal()).format(context);

  /// Return DateTime with zero millisecond and microsecond
  DateTime resetMillisecond() {
    return DateTime(year, month, day, hour, minute, second);
  }

  DateTime daysBefore(int days) => subtract(Duration(days: days));

  DateTime daysAfter(int days) => add(Duration(days: days));

  DateTime nextDayStart() => onlyDate().daysAfter(1);

  // DateTime localTimeToday() => DateTime.now().let(
  //       (DateTime now) => DateTime(
  //         now.year,
  //         now.month,
  //         now.day,
  //         hour,
  //         minute,
  //         second,
  //         millisecond,
  //         microsecond,
  //       ),
  //     );

  DateTime clone() => DateTime(
      year, month, day, hour, minute, second, millisecond, microsecond);

  DateTime atDate({int? y, int? m, int? d}) =>
      DateTime(y ?? year, m ?? month, d ?? day);

  DateTime nextYear() => clone().atDate(y: year + 1);

  DateTime nextMonth() => clone().atDate(m: month + 1);

  DateTime onlyDate() =>
      isUtc ? DateTime.utc(year, month, day) : DateTime(year, month, day);

  DateTime onlyMonth() =>
      isUtc ? DateTime.utc(year, month) : DateTime(year, month);

  DateTime onlyTime([int? kHour, int? kMinute]) =>
      DateTime.utc(1970, 1, 1, kHour ?? hour, kMinute ?? minute, 0, 0, 0);

  DateTime atTime(int kHour, int kMinute, [int? kSecond]) =>
      DateTime(year, month, day, kHour, kMinute, kSecond ?? 0, 0, 0);

  DateTime utcTimeFirstDaySinceEpoch() =>
      DateTime.utc(1970, 1, 1, hour, minute, second, millisecond, microsecond);

  // Convert local time as current utc
  // DateTime.now() = 2021-01-25 18:49:03.049422
  // DateTime.asUtc() = 2021-01-25 18:49:03.049422
  // DateTime.toUtc() = 2021-01-25 11:49:03.056208Z
  DateTime asUtc() => isUtc
      ? this
      : DateTime.utc(
          year, month, day, hour, minute, second, millisecond, microsecond);

  DateTime asLocal() => !isUtc
      ? this
      : DateTime(
          year, month, day, hour, minute, second, millisecond, microsecond);

  /// 2020-04-03T11:57:00
  String toDateTimeString() {
    return DateFormat('yyyy-MM-ddThh:mm:ss').format(this);
  }

  /// 11:00 AM
  String toHmaa() {
    return DateFormat('hh:mm aaaa').format(this);
  }
}
