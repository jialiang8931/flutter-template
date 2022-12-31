// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';

class RoutineBody extends StatelessWidget {
  RoutineBody({super.key});
  final items = List<String>.generate(20, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset('assets/images/main.jpg', height: 600));
  }
}

class RoutineBody2 extends StatefulWidget {
  final String title;
  RoutineBody2({required this.title, super.key});

  @override
  _RoutineBody2State createState() => _RoutineBody2State();
}

class _RoutineBody2State extends State<RoutineBody2> {
  String _title;
  _RoutineBody2State() : _title = '';

  @override
  void initState() {
    super.initState();
    _title = widget.title;
  }

  final List<Widget> _widgets = [
    Center(child: Image.asset('assets/images/main.jpg', height: 600)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [..._widgets],
    )));
  }
}
