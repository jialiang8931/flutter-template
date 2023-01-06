import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<void> getWRA10Data(int userNumber) async {
  Dio dio = Dio();

  try {
    // String url = 'https://randomuser.me/api/?nat=US&results=$userNumber';
    String url =
        'https://api.irmp.tw/wra10-ysz-linebot-api/routine/daily/overview/latest';
    Response response = await dio.get(url);

    // Print the response data
    print('資料比數: ${response.data}');
  } on DioError catch (e) {
    print('wwwww');
    print(e);
  }
}
