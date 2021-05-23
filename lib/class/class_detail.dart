import 'package:company_demo/util/screen_util.dart';
import 'package:flutter/material.dart';

class ClassDetail extends StatelessWidget {
  const ClassDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return Container(
      margin: EdgeInsets.only(left: screen.calc(16),top: screen.calc(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text('私募机构的秘密',style: TextStyle(fontSize: screen.calc(20),fontWeight: FontWeight.w700),),
          ),
          Container(
            padding: EdgeInsets.only(top: screen.calc(10)),
            child: Text('腾讯网从2003年创立至今,已经成为集新闻信息,区域垂直生活服务、社会化媒体资讯和产品为一体的互联网媒体平台。腾讯网下设新闻、科技、财经、娱乐、体育、汽车、时尚等多个频道,充分满足用户对不，带领斯小三解读市场动态，课程结束时间为5月18日。',),
          )
        ],
      ),
    );
  }
}
