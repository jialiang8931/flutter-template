import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage3> {
  List<Widget> _widgets = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [..._widgets],
    )));
  }

  void _fetchData() async {
    Dio dio = Dio();
    Response response =
        await dio.get('https://randomuser.me/api/?nat=US&results=10');
    if (response.statusCode == 200) {
      // If the call is successful, parse the JSON data
      List data = response.data['results'];
      setState(() {
        // Update the list of widgets
        _widgets = data.map((item) => Text(item['name']['first'])).toList();
      });
    } else {
      // If the call is not successful, display an error message
      setState(() {
        _widgets = [Text("Error: ${response.statusCode}")];
      });
    }
  }
}
