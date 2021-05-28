import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ImgLoading extends StatefulWidget {
  const ImgLoading({Key key}) : super(key: key);

  @override
  _ImgLoadingState createState() => _ImgLoadingState();
}

class _ImgLoadingState extends State<ImgLoading> {
  File file;

  @override
  Widget build(BuildContext context) {
    getTemporaryDirectory()
        .then((dir) => {file = File('${dir.path}/image_one.png')});

    /// 判断文件是否存在
    List<Widget> children = [];

    if (file != null) {
      children.add(Image.file(file));
    }

    return Scaffold(
      appBar: AppBar(title: Text('测试'),),
      body: Column(
        children: children,
      ),
    );
  }
}

// class ImgLoading extends StatefulWidget {
//   const ImgLoading({Key key}) : super(key: key);
//
//   @override
//   _ImgLoadingState createState() => _ImgLoadingState();
// }
//
// class _ImgLoadingState extends State<ImgLoading> {
//   Widget img;
//
//   @override
//   Widget build(BuildContext context) {
//     // final controller = TextEditingController();
//     List<Widget> children = [];
//
//     if (img != null) {
//       children.add(img);
//     }
//
//     /// 请求并显示图片
//
//     children.add(FlatButton(
//         onPressed: () async {
//           /// 1. 目录
//           final root = await getTemporaryDirectory();
//           final file = File('${root.path}/image_one.png');
//
//           /// 2. 读取文件
//           final data = await file.readAsBytes();
//
//           /// 3. setState更新数据
//           setState(() {
//             img = Image.memory(data);
//           });
//         },
//         color: Colors.blue,
//         child: Text('读取')));
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ImageLoading'),
//       ),
//       body: Column(children: children
//           // FlatButton(onPressed: () async {
//           //   // 1. 请求
//           //   var client = HttpClient();
//           //
//           //   // https://codehzy.cn/pname/flutter/assets/image_one.png
//           //   var uri = Uri(scheme: 'https',host: 'codehzy.cn',path: '/pname/flutter/assets/image_one.png');
//           //   print(uri);
//           //   var request = await client.getUrl(uri);
//           //   var response = await request.close();
//           //
//           //   var l = await response.toList();
//           //   List<int> data = [];
//           //   l.forEach((element) {
//           //     data.addAll(element);
//           //   });
//           //
//           //   // print(data.length);
//           //
//           //   // 2. 写入文件
//           //   var root = await getTemporaryDirectory();
//           //   var file = File('${root.path}/image_one.png');
//           //
//           //   await file.writeAsBytes(data);
//           //
//           //   print('写入成功');
//           //
//           // },color: Colors.blue, child: Text('请求保存图片'))
//           ),
//     );
//   }
// }
