import 'package:company_demo/class/class_detail.dart';
import 'package:flutter/material.dart';
import 'package:company_demo/util/screen_util.dart';

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
              children: [
                ListTile(title: Text("TITLE")),
                ListTile(title: Text("TITLE")),
                ListTile(title: Text("TITLE")),
                ListTile(title: Text("TITLE")),
                ListTile(title: Text("TITLE")),
                ListTile(title: Text("TITLE")),
                ListTile(title: Text("TITLE")),
                ListTile(title: Text("TITLE")),
                ListTile(title: Text("TITLE")),
                ListTile(title: Text("TITLE")),
                ListTile(title: Text("TITLE")),
                ListTile(title: Text("TITLE")),
                ListTile(title: Text("TITLE")),
                ListTile(title: Text("TITLE")),
                ListTile(title: Text("TITLE")),
              ],
            ),
          )
        ],
        controller: _tabController,
      ),
    );
  }
}
