import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MyFutureLearn extends StatelessWidget {
  MyFutureLearn({Key key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.multiline,
            controller: controller,
            minLines: 5,
            maxLines: 10,
          ),
          /// 读写文件
          // FlatButton(onPressed: () async {
          //   // 1. 拼凑合法路径
          //   var dir = await getTemporaryDirectory().timeout(Duration(seconds: 1));
          //
          //   // 2. 构建File对象
          //   var file = File('${dir.path}/a.txt');
          //
          //   // 3. 写入文件
          //   await file.writeAsString(controller.value.text);
          //
          //   print('success');
          //
          //   // 4. 读取文件
          //   try{
          //     var res = await file.readAsString().timeout(Duration(seconds: 3));
          //     print(res);
          //   } catch(err) {
          //     print(err.toString());
          //   }
          // }, color: Colors.blue, child: Text('保存'))


          /// 读写二进制文件
          FlatButton(onPressed: () async{
            Navigator.pushNamed(context, '/imgLoading');

            // 1. 目录
            final root = await getTemporaryDirectory();

            // 2. 文件对象
            final file = File('${root.path}/a.txt');

            // 3. 读写
            // var bytes = utf8.encode('asdzx');
            // await file.writeAsBytes(bytes);
            // print('success');

            var bytes = await file.readAsBytes();
            print(bytes);
            print(utf8.decode(bytes));

          },color: Colors.blue, child: Text('保存并跳转ImageLoading'))
        ],
      ),
    );
  }
}
