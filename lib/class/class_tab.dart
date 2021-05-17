import 'package:flutter/material.dart';
import 'package:company_demo/util/screen_util.dart';

class ClassTabBar extends StatefulWidget {
  const ClassTabBar({Key key}) : super(key: key);

  @override
  _ClassTabBarState createState() => _ClassTabBarState();
}

class _ClassTabBarState extends State<ClassTabBar> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this,length: 6);
  }

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(text: "热门"),
            Tab(text: "推荐"),
            Tab(text: "关注"),
            Tab(text: "收藏"),
            Tab(text: "新增"),
            Tab(text: "点赞"),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          Center(
              child: Text("这是热门的内容")
          ),
          Center(
              child: Text("这是推荐的内容")
          ),
          Center(
              child: Text("这是关注的内容")
          ),
          Center(
              child: Text("这是收藏的内容")
          ),
          Center(
              child: Text("这是新增的内容")
          ),
          Center(
              child: Text("这是点赞的内容")
          )
        ],
        controller: _tabController,
      ),
    );
  }
}
