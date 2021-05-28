import 'package:company_demo/model/class_Intro_model.dart';
import 'package:company_demo/util/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';

classIntroModel childDetail1; // 父级传递的课程信息数据

class ClassDetailPage extends StatefulWidget {
  classIntroModel childDetail; // 父级传递的课程信息数据
  ClassDetailPage({Key key, this.childDetail}) : super(key: key);

  @override
  _ClassDetailPageState createState() => _ClassDetailPageState();
}

class _ClassDetailPageState extends State<ClassDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    final Intro = widget.childDetail;
    // print(widget.childDetail.teachInfo.name);
    return Container(
      margin: EdgeInsets.only(
          left: screen.calc(16), top: screen.calc(16), right: screen.calc(16)),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    print(widget.childDetail.teachInfo.name);
                  },
                  child: Container(
                    child: Text(
                      // '123',
                      widget.childDetail.teachInfo.name,
                      style: TextStyle(
                          fontSize: screen.calc(20),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: screen.calc(10)),
                  child: Text(
                    '腾讯网从2003年创立至今,已经成为集新闻信息,区域垂直生活服务、社会化媒体资讯和产品为一体的互联网媒体平台。腾讯网下设新闻、科技、财经、娱乐、体育、汽车、时尚等多个频道,充分满足用户对不，带领斯小三解读市场动态，课程结束时间为5月18日。',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screen.calc(18)),
                  child: Row(
                    children: [
                      Container(
                        child: Text('共11节 课程视频',
                            style: TextStyle(
                                fontSize: screen.calc(12),
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1C2D41))),
                      ),
                      Spacer(),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: screen.calc(69),
                              height: screen.calc(17),
                              child: Text(
                                '2566此播放 ',
                                style: TextStyle(
                                    fontSize: screen.calc(12),
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff657281)),
                              ),
                            ),
                            Container(
                              constraints: new BoxConstraints(
                                maxWidth: 74,
                              ),
                              // width: screen.calc(74),
                              height: screen.calc(17),
                              child: Text(
                                '·  2526人已订阅',
                                style: TextStyle(
                                    fontSize: screen.calc(12),
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff657281)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// 课程详情及导师介绍
                Container(
                  margin: EdgeInsets.only(top: screen.calc(26)),
                  width: screen.calc(342),
                  height: screen.calc(62),
                  decoration: new BoxDecoration(color: Color(0xffF2F4F7)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: screen.calc(screen.calc(12)),
                            top: screen.calc(12),
                            bottom: screen.calc(12)),
                        child: Container(
                          width: screen.calc(38),
                          height: screen.calc(38),
                          margin: EdgeInsets.only(right: screen.calc(12)),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/tech_avatar.png')),
                              borderRadius:
                                  BorderRadius.circular(screen.calc(38))),
                        ),
                      ),
                      Container(
                          child: Text(
                        '黄某某',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: screen.calc(16),
                            color: Color(0xff1C2D41)),
                      )),
                      Spacer(),
                      Container(
                        width: screen.calc(75),
                        height: screen.calc(28),
                        decoration: new BoxDecoration(
                            borderRadius:
                                new BorderRadius.circular(screen.calc(100)),

                            /// 渐变色
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [
                                  0.0,
                                  1.0,
                                ],
                                colors: [
                                  Color.fromRGBO(60, 93, 255, 0.2),
                                  Color.fromRGBO(103, 134, 254, 0.2),
                                ])),
                        margin: EdgeInsets.only(right: screen.calc(22)),
                        child: FlatButton(
                            onPressed: () {
                              print('关注了黄某某');
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icon_add.png',
                                  height: screen.calc(12),
                                  color: Color(0xff4175DC),
                                ),
                                Text(' 关注',
                                    style: TextStyle(
                                      fontSize: screen.calc(12),
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff4175DC),
                                    )),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
