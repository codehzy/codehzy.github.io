import 'package:flutter/material.dart';
import 'package:company_demo/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter',
      routes: routes,
      initialRoute: '/',
    );
  }
}
