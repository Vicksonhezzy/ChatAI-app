import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'https://test-chat-ai.onrender.com/users/';
final Dio dio = Dio();

///Used to make a dio get request
Future<dynamic> getRequest({required String url}) async {
  try {
    var header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer ${UserData.get()?.token}'
    };
    var res = await http.get(Uri.parse(baseUrl + url), headers: header);
    // var res = await dio.get(baseUrl + url, options: Options(headers: header));
    // print('data = ${res.data['data']}');
    // print('data = ${res.body}');
    return json.decode(res.body)['data'];
  } on DioError catch (e) {
    print("Error = ${e.message}");
    return [];
  }
}

///Used to make a dio post
Future<dynamic> postRequest({String? url, Map<String, dynamic>? body}) async {
  try {
    // var header = {
    //   'Accept': 'application/json',
    //   'Content-Type': 'application/json',
    //   // 'Authorization': 'Bearer ${UserData.get()?.token}'
    // };
    var res = await http.post(Uri.parse(baseUrl + url!), body: body!);
    // var res = await dio.post(baseUrl + url!,
    //     data: json.encode(body), options: Options(headers: header));
    return json.decode(res.body)['data'];
  } on DioError catch (e) {
    print("Error = ${e.response!.data}");
    return e.response!.data;
  }
}
