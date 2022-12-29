import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'utils/getUserData.dart';

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
      // home: const CounterWidget(),
      // home: const MyHomePage2(title: 'QQ123'),
      home: const MyHomePage3(),
    );
  }
}

// class Echo extends StatelessWidget {
//   const Echo({
//     Key? key,
//     required this.text,
//     this.backgroundColor = Colors.grey,
//   }) : super(key: key);

//   final String text;
//   final Color backgroundColor;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         color: backgroundColor,
//         child: Text(text),
//       ),
//     );
//   }
// }

// class CounterWidget extends StatefulWidget {
//   const CounterWidget({super.key, this.initValue = 0});

//   final int initValue;

//   @override
//   // ignore: library_private_types_in_public_api
//   _CounterWidgetState createState() => _CounterWidgetState();
// }

// class _CounterWidgetState extends State<CounterWidget> {
//   int _counter = 0;

//   @override
//   void initState() {
//     super.initState();
//     //初始化状态
//     _counter = widget.initValue;
//     debugPrint("initState");
//   }

//   @override
//   Widget build(BuildContext context) {
//     // debugPrint("build, $_counter");

//     // return Text('QQQ');
//     return Scaffold(
//       body: Center(
//         child: TextButton(
//           child: Text('$_counter'),
//           //点击后计数器自增
//           onPressed: () => setState(
//             () => {
//               // debugPrint('before, $_counter'),
//               _counter++,
//               debugPrint('after, $_counter'),
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void didUpdateWidget(CounterWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     debugPrint("didUpdateWidget ");
//   }

//   @override
//   void deactivate() {
//     super.deactivate();
//     debugPrint("deactivate");
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     debugPrint("dispose");
//   }

//   @override
//   void reassemble() {
//     super.reassemble();
//     debugPrint("reassemble");
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     debugPrint("didChangeDependencies");
//   }
// }

// import 'package:flutter/material.dart';

// void main() => runApp(const SliderApp());

// class SliderApp extends StatelessWidget {
//   const SliderApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//         home: TextField(
//       obscureText: true,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         labelText: 'Password',
//       ),
//     ));
//   }
// }

// class SliderExample extends StatefulWidget {
//   const SliderExample({super.key});

//   @override
//   State<SliderExample> createState() => _SliderExampleState();
// }

// class _SliderExampleState extends State<SliderExample> {
//   double _currentSliderValue = 20.2;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Slider')),
//       body: Slider(
//         value: _currentSliderValue,
//         min: -10.0,
//         max: 40.5,
//         divisions: ((40.5 - (-10)) * 20).toInt(),
//         label: _currentSliderValue.toStringAsFixed(2),
//         // round().toString(),
//         onChanged: (double value) {
//           setState(() {
//             _currentSliderValue = value;
//           });
//         },
//       ),
//     );
//   }
// }
