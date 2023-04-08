import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class NumbersService extends ChangeNotifier {
  final Dio _dio = Dio();
  static const String _baseUrl = 'numbersapi.com';
  bool random = false;
  String? number;
  String? day;
  String? month;
  String message = '';

  isRandom(bool value) {
    random = value;
    number = null;
    notifyListeners();
  }

  Future<String> _getInformation(String path) async {
    final Uri url;

    if (random) {
      url = Uri.http(_baseUrl, 'random/$path');
    } else if (number != null) {
      url = Uri.http(_baseUrl, '${number!}/$path');
    } else {
      isRandom(true);
      url = Uri.http(_baseUrl, 'random/$path');
    }

    final response = await _dio.get(url.toString());

    message = response.data;

    isRandom(false);

    return message;
  }

  Future<String> getInformationTrivia() async {
    return await _getInformation('trivia');
  }

  Future<String> getInformationMath() async {
    return await _getInformation('math');
  }

  Future<String> getInformationYear() async {
    return await _getInformation('year');
  }

  Future<String> getInformationDate() async {
    final Uri url;

    if (random) {
      url = Uri.http(_baseUrl, 'random/date');
    } else if (month != null && day != null) {
      url = Uri.http(_baseUrl, '${month!}/${day!}/date');
    } else {
      isRandom(true);
      url = Uri.http(_baseUrl, 'random/date');
    }

    final response = await _dio.get(url.toString());

    message = response.data;
    month = null;
    day = null;

    return message;
  }
}
