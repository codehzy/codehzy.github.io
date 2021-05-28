import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(),
        preferredSize: Size.fromHeight(0),
      ),
      body: Container(
        child: Column(
          children: [
            FlatButton(
              color: Colors.red,
              child: Text('跳转info'),
              onPressed: () {
                Navigator.pushNamed(context, '/info');
              },
            ),
            FlatButton(
              color: Colors.red,
              child: Text('跳转future'),
              onPressed: () {
                Navigator.pushNamed(context, '/future');
              },
            ),
            FlatButton(
              color: Colors.red,
              child: Text('跳转socket'),
              onPressed: () {
                Navigator.pushNamed(context, '/socketLearn');
              },
            ),
            FlatButton(
              color: Colors.red,
              child: Text('跳转数据操作'),
              onPressed: () {
                Navigator.pushNamed(context, '/Data');
              },
            ),
            FlatButton(
              color: Colors.red,
              child: Text('跳转写入数据'),
              onPressed: () {
                Navigator.pushNamed(context, '/CouldData');
              },
            ),
            FlatButton(
              color: Colors.red,
              child: Text('跳转'),
              onPressed: () {
                Navigator.pushNamed(context, '/Test');
              },
            ),
          ],
        ),
      ),
    );
  }
}
