import 'package:flutter/material.dart';
import 'menu_expension_element_1.dart';
import 'menu_expension_element_2.dart';

class RoutineMenu extends StatelessWidget {
  const RoutineMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('導覽列'),
          ),
          Expension1(),
          Expension2(),
        ],
      ),
    );
  }
}
