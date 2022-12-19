import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return const Echo(text: "hello world");
    return MaterialApp(
      title: 'JJL Flutter APP',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const CounterWidget(),
      // home: const MyHomePage2(title: 'QQ123'),
    );
  }
}

class Echo extends StatelessWidget {
  const Echo({
    Key? key,
    required this.text,
    this.backgroundColor = Colors.grey,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}




class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, this.initValue = 0});

  final int initValue;

  @override
  // ignore: library_private_types_in_public_api
  _CounterWidgetState createState() => _CounterWidgetState();
}


class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint("build, $_counter");

    // return Text('QQQ');
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('$_counter'),
          //点击后计数器自增
          onPressed: () => setState(
            () => {
              // debugPrint('before, $_counter'),
              _counter++,
              debugPrint('after, $_counter'),
            
            },
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget ");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}