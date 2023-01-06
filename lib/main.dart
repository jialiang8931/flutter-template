import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_proxy/http_proxy.dart';
import 'package:dio/dio.dart';
import 'pages/home/home.dart';

Dio dio = Dio();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RoutinePatrol(),
    );
  }
}
