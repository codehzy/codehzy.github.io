import 'package:company_demo/class/class_detail.dart';
import 'package:company_demo/model/class_Intro_model.dart';
import 'package:flutter/material.dart';
import 'package:company_demo/util/screen_util.dart';
import 'package:leancloud_storage/leancloud.dart';

class ClassTabBar extends StatefulWidget {
  classIntroModel childTab;

  ClassTabBar({Key key, this.childTab}) : super(key: key);

  @override
  _ClassTabBarState createState() => _ClassTabBarState();
}

class _ClassTabBarState extends State<ClassTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool isLoading = false;

  List<LCObject> ClassList;

  getData() async {
    // LCQuery<LCObject> query = LCQuery('List');
    // LCObject List = await query.get('60adf0a120506d7de54006c7');
    // // int id = List['id'];
    // print(List);
    LCQuery<LCObject> findList = new LCQuery('List');
    findList.orderByAscending('sortid');

    // students 是包含满足条件的 Student 对象的数组
    ClassList = await findList.find();

    print(ClassList);
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
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
        getTabBarPages(widget.childTab)
      ],
    );
  }

  Widget getTabBar() {
    // LeanCloud.initialize(
    //     'dkaJmPAQtIrw6PvXIp92AEdy-gzGzoHsz', 'D6kmuNVJVS5JKRlYpF4YhL12',
    //     server: 'https://dkajmpaq.lc-cn-n1-shared.com',
    //     // to use your own custom domain
    //     queryCache: new LCQueryCache() // optinoal, enable cache
    //     );
    //
    // void getData() async {
    //   LCQuery<LCObject> query = LCQuery('List');
    //   LCObject List = await query.get('60adf0a120506d7de54006c7');
    //   // int id = List['id'];
    //   print(List);
    // }

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

  Widget getTabBarPages(classIntroModel a) {
    // List childDetail = [];
    final screen = Screen(context);

    return Expanded(
      flex: 1,
      child: TabBarView(
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClassDetailPage(childDetail: a),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(top: screen.calc(10)),
                      width: screen.width,
                      height: screen.calc(5),
                      decoration: new BoxDecoration(color: Color(0xffF2F4F7)),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        print(widget.childTab.teachInfo.name);
                      },
                      child: Image.asset('assets/class_list.png')),
                  Container(
                    width: screen.width,
                    height: screen.calc(5),
                    decoration: new BoxDecoration(color: Color(0xffF2F4F7)),
                  ),
                ],
              ),
            ),
          ),
          isLoading
              ? SingleChildScrollView(
                  child: Column(
                    // children: [Text('123')],
                    children: ClassList.map((item) => Container(
                          margin: EdgeInsets.only(left: screen.calc(16)),
                          width: screen.width,
                          height: screen.calc(77),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: screen.calc(16), top: screen.calc(17)),
                            child: Row(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        // margin: EdgeInsets.only(
                                        //     top: screen.calc(4)),
                                        child: Text(
                                          item['id'].toString(),
                                          style: TextStyle(
                                              fontSize: screen.calc(16),
                                              height: screen.calc(1.3),
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffB5BaC2)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: screen.calc(7)),
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
                                ),
                                Spacer(),
                                item['vip']
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            right: screen.calc(21)),
                                        child: FlatButton(
                                            color: Color.fromRGBO(
                                                73, 131, 245, 0.1),
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
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(
                                            right: screen.calc(36)),
                                        child: Image.asset(
                                          'assets/icon_lock.png',
                                          color: Color(0xffB5BAC2),
                                          width: screen.calc(10),
                                          height: screen.calc(12),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        )).toList(),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [Text('请稍等')],
                  ),
                )
        ],
        controller: _tabController,
      ),
    );
  }
}
