import 'package:flutter/material.dart';
import 'appbar.dart';
import 'drawer.dart';
import 'body.dart';

class RoutinePatrol extends StatelessWidget {
  RoutinePatrol({super.key});
  final items = List<String>.generate(20, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const RoutineAppBar()),
        drawer: const RoutineMenu(),
        body: RoutineBody2(
          title: '',
        ));
  }
}
