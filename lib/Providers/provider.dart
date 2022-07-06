import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/Model/prayertime.dart';
import 'package:muslim_app/data.dart';

class CustomProvider extends ChangeNotifier {
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
      return '${convertTime(timings.sunrise)}  الشروق';
    } else if (sunrise.isBefore(time) && dhuhr.isAfter(time)) {
      return '${convertTime(timings.dhuhr)}  الظهر';
    } else if (dhuhr.isBefore(time) && asr.isAfter(time)) {
      return '${convertTime(timings.asr)}  العصر';
    } else if (asr.isBefore(time) && maghrib.isAfter(time)) {
      return '${convertTime(timings.maghrib)}  المغرب';
    } else if (maghrib.isBefore(time) && isha.isAfter(time)) {
      return '${convertTime(timings.isha)}  العشاء';
    } else {
      return '${convertTime(timings.fajr)}  الفجر';
    }
  }

  String randomNum() {
    int randomNumber = Random().nextInt(messages.length);
    return messages[randomNumber];
  }
}
