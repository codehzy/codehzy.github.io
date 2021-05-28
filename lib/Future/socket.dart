import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';

class SocketLearn extends StatelessWidget {
  const SocketLearn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('标题')),
      body: Column(
        children: [
          FlatButton(
            child: Text('请求', style: TextStyle(
                color: Colors.white
            )),
            color: Colors.blue,
            onPressed: ()async{
              //1.连接
              var socket=await Socket.connect('/pname/flutter/file/1.json', 80);

              //2.发送请求
              socket.add(utf8.encode('GET /1.json HTTP/1.1\r\n'));
              //头
              socket.add(utf8.encode('Host: /pname/flutter/file/1.json\r\n'));
              socket.add(utf8.encode('Connection: close\r\n'));
              socket.add(utf8.encode('\r\n'));

              //3.接收数据
              print('接收的：');
              socket.listen((event) {
                var list=utf8.decode(event).split('\r\n');

                //第一行
                var list2=list[0].split(' ');
                final version=list2[0];
                final statusCode=int.parse(list2[1]);
                final status=list2[2];

                //头
                final headers={};
                String body;
                for(int i=1;i<list.length;i++){
                  if(list[i]==''){
                    body=list[i+1];
                    break;
                  }

                  var list2=list[i].split(': ');

                  headers[list2[0]]=list2[1];
                  // print(list2);
                }

                //
                print(headers);
                print(json.decode(body));
              });
            },
          ),
        ],
      ),
    );
  }
}
