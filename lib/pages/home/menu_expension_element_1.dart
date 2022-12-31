import 'package:flutter/material.dart';

class Expension1 extends StatelessWidget {
  const Expension1({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('操作檢查紀錄總表'),
      children: [
        ListTile(
          title: const Text('當日概況'),
          onTap: () {
            Navigator.pop(context);
            debugPrint('ssss');
          },
        ),
      ],
    );
  }
}
