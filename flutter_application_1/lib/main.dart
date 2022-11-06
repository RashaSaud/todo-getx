import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'V/todo.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //create a text
      home: Todo(),
    );
  }
}
