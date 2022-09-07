import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/Model/prayertime.dart';
import 'package:muslim_app/data.dart';

class CustomProvider extends ChangeNotifier {
  int count = 00000;
  String convertTime(strDate) {
    final now = DateTime.now().toString();
    final dateFormat = DateFormat('yyyy-MM-dd ');
    final stringFormat = dateFormat.format(DateTime.parse(now));
    final time = stringFormat + strDate;

    final dateFormat2 = DateFormat('hh:mm a');
    final stringFormat2 = dateFormat2.format(DateTime.parse(time));
    return stringFormat2;
  }

  String convertTime2(strDate) {
    final now = DateTime.now().toString();
    final dateFormat = DateFormat('yyyy-MM-dd ');
    final stringFormat = dateFormat.format(DateTime.parse(now));
    final time = stringFormat + strDate;
    final dateFormat2 = DateFormat('HH:mm');
    final stringFormat2 = dateFormat2.format(DateTime.parse(time));
    return stringFormat2;
  }

  DateTime convertDateTime(strDate) {
    final now = DateTime.now().toString();
    final dateFormat = DateFormat('yyyy-MM-dd ');
    final stringFormat = dateFormat.format(DateTime.parse(now));
    final time = stringFormat + strDate;
    return DateTime.parse(time);
  }

  String nextprayer(Timings timings) {
    final now = DateTime.now().toString();
    final dateFormat = DateFormat('HH:mm');
    final timeFormat = dateFormat.format(DateTime.parse(now));
    final time = convertDateTime(timeFormat);
    final fajr = convertDateTime(convertTime2(timings.fajr));
    final sunrise = convertDateTime(convertTime2(timings.sunrise));
    final dhuhr = convertDateTime(convertTime2(timings.dhuhr));
    final asr = convertDateTime(convertTime2(timings.asr));
    final maghrib = convertDateTime(convertTime2(timings.maghrib));
    final isha = convertDateTime(convertTime2(timings.isha));
    if (fajr.isBefore(time) && sunrise.isAfter(time)) {
      return 'الشروق ${convertTime(timings.sunrise)}';
    } else if (sunrise.isBefore(time) && dhuhr.isAfter(time)) {
      return 'الظهر ${convertTime(timings.dhuhr)}';
    } else if (dhuhr.isBefore(time) && asr.isAfter(time)) {
      return 'العصر ${convertTime(timings.asr)}';
    } else if (asr.isBefore(time) && maghrib.isAfter(time)) {
      return 'المغرب ${convertTime(timings.maghrib)}  ';
    } else if (maghrib.isBefore(time) && isha.isAfter(time)) {
      return 'العشاء ${convertTime(timings.isha)}';
    } else {
      return 'الفجر ${convertTime(timings.fajr)}';
    }
  }

  String nextprayerDate(Timings timings) {
    final now = DateTime.now().toString();
    final dateFormat = DateFormat('HH:mm');
    final timeFormat = dateFormat.format(DateTime.parse(now));
    final time = convertDateTime(timeFormat);
    final fajr = convertDateTime(convertTime2(timings.fajr));
    final sunrise = convertDateTime(convertTime2(timings.sunrise));
    final dhuhr = convertDateTime(convertTime2(timings.dhuhr));
    final asr = convertDateTime(convertTime2(timings.asr));
    final maghrib = convertDateTime(convertTime2(timings.maghrib));
    final isha = convertDateTime(convertTime2(timings.isha));
    if (fajr.isBefore(time) && sunrise.isAfter(time)) {
      return timings.sunrise;
    } else if (sunrise.isBefore(time) && dhuhr.isAfter(time)) {
      return timings.dhuhr;
    } else if (dhuhr.isBefore(time) && asr.isAfter(time)) {
      return timings.asr;
    } else if (asr.isBefore(time) && maghrib.isAfter(time)) {
      return timings.maghrib;
    } else if (maghrib.isBefore(time) && isha.isAfter(time)) {
      return timings.isha;
    } else {
      return timings.fajr;
    }
  }

  String replaceNumber(String input) {
    const english = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      'PM',
      'AM'
    ];
    const farsi = [
      '٠',
      '١',
      '٢',
      '٣',
      '٤',
      '٥',
      '٦',
      '٧',
      '٨',
      '٩',
      'مساءاً',
      'صباحاً'
    ];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }

    return input;
  }

  String randomNum() {
    int randomNumber = Random().nextInt(messages.length);
    return messages[randomNumber];
  }

  void increasecount() {
    count = count + 00001;
    notifyListeners();
  }

  void reset() {
    count = 0;
    notifyListeners();
  }
}
