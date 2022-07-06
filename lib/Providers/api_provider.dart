import 'package:flutter/material.dart';
import 'dart:async';
import 'package:muslim_app/Model/prayertime.dart';
import 'package:dio/dio.dart';
import 'package:quran/quran.dart' as quran;

class ApiProvider extends ChangeNotifier {
  final String url =
      'http://api.aladhan.com/v1/timingsByCity?city=Egypt&country=Cairo&method=4';
  final String url2 =
      'https://cdn.jsdelivr.net/npm/quran-json@3.1.2/dist/quran.json';
  final String saba7 = 'http://www.hisnmuslim.com/api/ar/27.json';

  final Dio dio = Dio();

  Future<Data> getApiData() async {
    Response response = await dio.get(url);
    Data praylist = Data.fromJson(response.data);
    return praylist;
  }

  Future<List> getQuranApi() async {
    Response response = await dio.get(url2);
    List list = response.data;
    return list;
  }

  Future<Map> getAzkarApi() async {
    Response response = await dio.get(saba7);
    Map list = response.data;
    return list;
  }

  String sum(List sura, int num) {
    String sum = '';
    for (int i = 0; i < sura.length; i++) {
      sum = sum + quran.getVerse(num + 1, i + 1, verseEndSymbol: true) + ' ';
    }
    return sum;
  }
}
