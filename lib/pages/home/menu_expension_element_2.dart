import 'package:flutter/material.dart';
import 'package:first_project/utils/axios.dart' as axios;
import 'check_tables/table_widget.dart';

final checkTables = <String>[
  '水位/流量/氣象 監測系統',
  '影像/門禁安全 監測系統',
  '水情管理及展示系統－分洪資訊',
  '水情管理及展示系統－集水區資訊',
  '分洪警報/簡報展示 系統',
  '大螢幕投影系統檢測',
  '閘門開度控制圖控軟體及硬體系統',
  '其他電氣系統',
];

class Expension2 extends StatelessWidget {
  const Expension2({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(title: const Text('操作檢查紀錄表'), children: [
      SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: checkTables.length,
              shrinkWrap: true,
              // physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text('${i + 1}: ${checkTables[i]}'),
                  onTap: () {
                    debugPrint('${i + 1}: ${checkTables[i]}');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TableNumberWidget(tableNumber: i + 1)));

                    // Navigator.pop(context);
                  },
                );
              },
            )
          ],
        ),
      )
    ]);
  }
}













//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(title: const Text('操作檢查紀錄表'), children: <Widget>[
//       ListView(shrinkWrap: false, children: [
//         ListView.builder(
//           itemCount: checkTables.length,
//           shrinkWrap: true,
//           // physics: const AlwaysScrollableScrollPhysics(),
//           itemBuilder: (context, i) {
//             return ListTile(
//               title: Text('${i + 1}: ${checkTables[i]}'),
//               onTap: () {
//                 debugPrint('${i + 1}: ${checkTables[i]}');
//                 Navigator.pop(context);
//               },
//             );
//           },
//         ),
//       ])
//     ]);
//   }
// }
