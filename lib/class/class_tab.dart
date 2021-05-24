import 'package:company_demo/class/class_detail.dart';
import 'package:flutter/material.dart';
import 'package:company_demo/util/screen_util.dart';

const ClassList = [
  {"id": 01, 'title': '只做30天新手：交易员的实战特训', 'time': "23.02", "vip": true},
  {"id": 02, 'title': '财经课堂的第一课', 'time': "23.02", "vip": true},
  {"id": 03, 'title': '只做30天新手：交易员的实战特训', 'time': "23.02", "vip": true},
  {"id": 04, 'title': '只做30天新手：交易员的实战特训', 'time': "23.02", "vip": false},
  {"id": 05, 'title': '只做30天新手：交易员的实战特训', 'time': "23.02", "vip": false},
  {"id": 06, 'title': '只做30天新手：交易员的实战特训', 'time': "23.02", "vip": false},
  {"id": 07, 'title': '只做30天新手：交易员的实战特训', 'time': "23.02", "vip": false},
  {"id": 08, 'title': '只做30天新手：交易员的实战特训', 'time': "23.02", "vip": false},
  {"id": 09, 'title': '只做30天新手：交易员的实战特训', 'time': "23.02", "vip": false},
];

class ClassTabBar extends StatefulWidget {
  const ClassTabBar({Key key}) : super(key: key);

  @override
  _ClassTabBarState createState() => _ClassTabBarState();
}

class _ClassTabBarState extends State<ClassTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    // return Scaffold(
    //   appBar: PreferredSize(
    //     preferredSize: Size.fromHeight(screen.calc(20)),
    //     child: AppBar(
    //       // 不显示返回
    //       automaticallyImplyLeading: false,
    //       // 隐藏标题
    //       flexibleSpace: SafeArea(
    //         top: false,
    //         // bottom:true,
    //         child: getTabBar(),
    //       ),
    //     ),
    //   ),
    //   body: getTabBarPages(),
    // );
    return Column(
      children: [
        Container(
          child: getTabBar(),
        ),
        getTabBarPages()
      ],
    );
  }

  Widget getTabBar() {
    return TabBar(
      tabs: [
        Tab(
          child: Text(
            '课程介绍',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Tab(
          child: Text(
            '课程大纲',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
      controller: _tabController,
    );
  }

  Widget getTabBarPages() {
    final screen = Screen(context);
    return Expanded(
      flex: 1,
      child: TabBarView(
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClassDetail(),
                  Container(
                    margin: EdgeInsets.only(top: screen.calc(10)),
                    width: screen.width,
                    height: screen.calc(5),
                    decoration: new BoxDecoration(color: Color(0xffF2F4F7)),
                  ),
                  Image.asset('assets/class_list.png'),
                  Container(
                    width: screen.width,
                    height: screen.calc(5),
                    decoration: new BoxDecoration(color: Color(0xffF2F4F7)),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children:
                ClassList.map((item) => Container(
                  margin: EdgeInsets.only(left: screen.calc(16)),
                  width: screen.width,
                  height: screen.calc(77),
                  child: Container(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: screen.calc(16), top: screen.calc(17)),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    item['id'].toString(),
                                    style: TextStyle(
                                        fontSize: screen.calc(16),
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffB5BaC2)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: screen.calc(7)),
                                  child: Text(
                                    item['title'],
                                    style: TextStyle(
                                        fontSize: screen.calc(15),
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff1C2D41)),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(
                                    left: screen.calc(7),
                                    top: screen.calc(5),
                                  ),
                                  child: Text(
                                    item['time'],
                                    style: TextStyle(
                                        fontSize: screen.calc(12),
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff657281)),
                                  ))
                            ],
                          ),
                          Spacer(),
                          item['vip'] ? Container(
                            margin: EdgeInsets.only(right: screen.calc(21)),
                            child: FlatButton(
                                color: Color.fromRGBO(73, 131, 245, 0.1),
                                minWidth: screen.calc(40),
                                height: screen.calc(21),
                                onPressed: () {},
                                child: Text(
                                  '试看',
                                  style: TextStyle(
                                      fontSize: screen.calc(12),
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff4175DC)),
                                )),
                          ) : Container(
                              margin: EdgeInsets.only(right: screen.calc(36)),
                            child: Image.asset('assets/icon_lock.png',color: Color(0xffB5BAC2),width: screen.calc(10),height: screen.calc(12),),
                          )
                        ],
                      ),
                    ),
                  ),
                )).toList()
              ,
            ),
          )
        ],
        controller: _tabController,
      ),
    );
  }
}

// Container(
// margin: EdgeInsets.only(left: screen.calc(16)),
// width: screen.width,
// height: screen.calc(77),
// child: Container(
// decoration: new BoxDecoration(
// // color: Colors.red
// ),
// child: Container(
// margin: EdgeInsets.only(
// left: screen.calc(16), top: screen.calc(17)),
// child: Row(
// children: [
// Container(
// child: Column(
// children: [
// Container(
// child: Text(
// '01',
// style: TextStyle(
// fontSize: screen.calc(16),
// fontWeight: FontWeight.w600,
// color: Color(0xffB5BaC2)),
// ),
// ),
// ],
// ),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// margin: EdgeInsets.only(left: screen.calc(7)),
// child: Text(
// '只做30天新手：交易员的实战特训',
// style: TextStyle(
// fontSize: screen.calc(15),
// fontWeight: FontWeight.w500,
// color: Color(0xff1C2D41)),
// )),
// Container(
// margin: EdgeInsets.only(
// left: screen.calc(7),
// top: screen.calc(5),
// ),
// child: Text(
// '时长23.02',
// style: TextStyle(
// fontSize: screen.calc(12),
// fontWeight: FontWeight.w400,
// color: Color(0xff657281)),
// ))
// ],
// ),
// Spacer(),
// Container(
// margin: EdgeInsets.only(right: screen.calc(21)),
// child: FlatButton(
// color: Color.fromRGBO(73, 131, 245, 0.1),
// minWidth: screen.calc(40),
// height: screen.calc(21),
// onPressed: () {},
// child: Text(
// '试看',
// style: TextStyle(
// fontSize: screen.calc(12),
// fontWeight: FontWeight.w600,
// color: Color(0xff4175DC)),
// )),
// )
// ],
// ),
// ),
// ),
// )
