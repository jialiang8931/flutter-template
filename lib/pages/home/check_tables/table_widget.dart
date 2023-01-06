import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:first_project/pages/home/appbar.dart';
import 'package:first_project/pages/home/drawer.dart';
import 'package:flutter/services.dart';

class TableNumber extends StatelessWidget {
  final int tableNumber;
  const TableNumber(this.tableNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('$tableNumber');
  }
}

class TableNumberWidget extends StatefulWidget {
  final int tableNumber;
  const TableNumberWidget({super.key, required this.tableNumber});

  @override
  // ignore: library_private_types_in_public_api
  _TableNumberWidgetState createState() => _TableNumberWidgetState();
}

class _TableNumberWidgetState extends State<TableNumberWidget> {
  List<Widget> _widgets = [];
  late List<dynamic> dataList;

  @override
  void initState() {
    super.initState();
    _fetchTableNumberDescription(widget.tableNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const RoutineAppBar()),
      drawer: const RoutineMenu(),
      body: Center(
          child: Column(
        children: [..._widgets],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Perform some action
        },
        tooltip: '上傳資料',
        child: const Icon(Icons.arrow_circle_up),
      ),
    );
  }

  void _fetchTableNumberDescription(int tableNumber) async {
    Dio dio = Dio();
    Response response = await dio.get(
        'https://api.irmp.tw/wra10-ysz-linebot-api/routine/daily/definition/$tableNumber');
    if (response.statusCode == 200) {
      List data = response.data;

      Map<String, List<Map<String, dynamic>>> dataByCate2 = {};
      for (Map<String, dynamic> element in data) {
        String cate2 = element['cate_2'];
        if (!dataByCate2.containsKey(cate2)) {
          dataByCate2[cate2] = [element];
        } else {
          dataByCate2[cate2]?.add(element);
        }
      }

      List<Map<String, dynamic>> tmpDataList = dataByCate2.entries.map((entry) {
        return {
          "column_name": entry.key,
          "elements": entry.value,
        };
      }).toList();
      dataList = tmpDataList;

      setState(() {
        Map<String, dynamic> firstElement = dataList[0]['elements'][0];
        String title =
            '${firstElement['table_no']}. ${firstElement['table_name']}';
        Widget tableTitleWidget = Text(title);
        _widgets = dataList.map((map) {
          return ExpansionTile(
            title: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(120, 132, 168, 229),
                ),
                child: Text(map['column_name'])),
            children: [
              SingleChildScrollView(
                  child: Column(children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: map['elements'].length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> element = map['elements'][index];
                    String? checkContent = element['check_content'];
                    String? cate1 = element['cate_1'];
                    checkContent = checkContent ?? '$cate1 - 當前數值';

                    String checkType = element['check_type'];
                    String hintText;
                    String initialValue;
                    switch (checkType) {
                      case 'boolean':
                        initialValue = '正常';
                        hintText = '正常/異常';
                        break;
                      case 'value':
                        initialValue = '';
                        hintText = '請輸入觀測值';
                        break;
                      case 'criteria':
                        initialValue = '';
                        hintText =
                            '請輸入數值(${element['check_cri_min']} ~ ${element['check_cri_max']})';
                        break;
                      case 'needConfirm':
                        checkContent = '$cate1 - $checkContent';
                        initialValue = '';
                        hintText = '正常/異常 (${element['note']})';
                        break;
                      default:
                        initialValue = '';
                        hintText = '';
                    }

                    return Row(children: [
                      Text('$checkContent: '),
                      Expanded(
                        child: TextFormField(
                          initialValue: initialValue,
                          onChanged: (s) {},
                          decoration: InputDecoration(
                            hintText: hintText,
                          ),
                        ),
                      ),
                    ]);
                  },
                )
              ])),
            ],
          );
        }).toList();
        _widgets = [tableTitleWidget, ..._widgets];
      });
    } else {
      setState(() {
        _widgets = [Text("Error: ${response.statusCode}")];
      });
    }
  }
}
