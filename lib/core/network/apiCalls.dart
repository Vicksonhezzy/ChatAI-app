// ignore_for_file: file_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

/// Used to make a http get request
Future<dynamic> getRequest({required String url}) async {
  try {
    var header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var res = await http.get(Uri.parse(baseUrl + url), headers: header);
    return json.decode(res.body)['data'];
  } on DioError catch (e) {
    if (kDebugMode) {
      print("Error = ${e.message}");
    }
    return [];
  }
}

/// Used to make a http post
Future<dynamic> postRequest({String? url, Map<String, dynamic>? body}) async {
  try {
    var res = await http.post(Uri.parse(baseUrl + url!), body: body!);
    return json.decode(res.body)['data'];
  } on DioError catch (e) {
    return e.response!.data;
  }
}
