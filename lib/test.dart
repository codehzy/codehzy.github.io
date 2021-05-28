import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

int a = 1;

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
      ),
      body: Column(
        children: [
          Text('${a}'),
          FlatButton(
              onPressed: () {
                setState(() {
                  a = 2;
                });
              },
              color: Colors.red,
              child: Text('按钮一')),
          FlatButton(
              onPressed: () {
                print(a);
              },
              color: Colors.amber,
              child: Text('打印'))
        ],
      ),
    );
  }
}
