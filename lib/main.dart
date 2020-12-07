import 'package:flutter/material.dart';
import 'package:task_2/tab_controller/tab_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: TabControllerScreen(),
    );
  }
}
