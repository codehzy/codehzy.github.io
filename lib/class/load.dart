import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Load extends StatefulWidget {
  const Load({Key key}) : super(key: key);

  @override
  _LoadState createState() => _LoadState();
}

bool isLoading = false;
class _LoadState extends State<Load> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }


  void getHttp() async {
    try {
      var response = await Dio().get('https://api.github.com/users');
      print(response);
      setState(() {
        isLoading = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('加载'),
        ),
        body: Container(
            child: isLoading
                ? Column(
                    children: [
                      FlatButton(
                        onPressed: () {},
                        child: Text('123'),
                        color: Colors.red,
                      ),
                    ],
                  )
                : Text('加载中')));
  }
}
