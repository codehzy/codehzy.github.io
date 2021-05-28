import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';

class CouldData extends StatelessWidget {
  const CouldData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('写入数据'),
      ),
      body: Container(
        child: Column(
          children: [
            FlatButton(
                onPressed: () {
                  Insert();
                },
                color: Colors.red,
                child: Text('写入课程列表数据')),
            FlatButton(
                onPressed: () {
                  InsertIntro();
                },
                color: Colors.red,
                child: Text('写入课程介绍')),
          ],
        ),
      ),
    );
  }

  /// 插入课程列表数据
  void Insert() async {
    // 为属性赋值
    for (var i = 1; i < 20; i++) {
      await SetData(i);
    }

    // List['id'] = 1;
    // List['title'] = '只做30天新手：交易员的实战特训';
    // List['time'] = '23.02';
    // List['vip'] = true;
    // await List.save();
    // print('写入完成');
  }

  SetData(int i) async {
    String ID = '';
    if (i < 10) {
      ID = '0${i}';
    } else {
      ID = '${i}';
    }
    // 构建对象
    LCObject List = LCObject("List");
    List['id'] = ID;
    List['sortid'] = i;
    List['title'] = '只做30天新手：交易员的实战特训';
    List['time'] = '23.02';
    List['vip'] = true;
    Duration(milliseconds: 2000);
    // 将对象保存到云端
    await List.save();
    print(List);
  }

  /// 课程介绍
  void InsertIntro() async {
    // 构建对象
    LCObject Intro = LCObject("Intro");

    Intro['classDetail'] = {
      "title": '私募机构的秘密 ',
      "detail":
          '腾讯网从2003年创立至今,已经成为集新闻信息,区域垂直生活服务、社会化媒体资讯和产品为一体的互联网媒体平台。腾讯网下设新闻、科技、财经、娱乐、体育、汽车、时尚等多个频道,充分满足用户对不，带领斯小三解读市场动态，课程结束时间为5月18日。'
    };
    Intro['classCount'] = {
      "listCount": "11",
      "playCount": "2345",
      "c": "234215",
    };
    Intro['teachInfo'] = {
      "avatar": 'https://codehzy.cn/pname/flutter/assets/tech_avatar.png',
      "name": 'Easorn',
      "follow": false,
      "classImage": "https://codehzy.cn/pname/flutter/assets/class_list.png",
      "classHeaderImage":
          "https://codehzy.cn/pname/flutter/assets/k_thread.png",
    };
    Intro['userState'] = {
      "vipLevel": 'V4会员以上',
      "price": '999',
      "level": '普通会员',
      "comPrice": "2999"
    };

    await Intro.save();
    print('写入成功');
  }
}
