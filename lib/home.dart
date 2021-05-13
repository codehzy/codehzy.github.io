import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            color: Colors.red,
            child: Text('跳转info'),
            onPressed: () {
              Navigator.pushNamed(context, '/info');
            },
          ),
        ),
      ),
    );
  }
}
