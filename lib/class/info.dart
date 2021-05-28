import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:company_demo/util/screen_util.dart';
import 'package:company_demo/class/header.dart';
import 'package:company_demo/class/class_tab.dart';
import 'package:company_demo/class/banner.dart';
import 'package:company_demo/class/class_subscribe.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:company_demo/model/class_Intro_model.dart';

class Info extends StatefulWidget {
  const Info({Key key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

bool isLoad = false;

class _InfoState extends State<Info> {
  // List classIntro = [];
  classIntroModel a1;

  @override
  initState() {
    super.initState();
    GetClassIntro(a1);
  }

  @override
  void dispose() {
    super.dispose();
    isLoad = false;
  }

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          flexibleSpace: SafeArea(
            top: false,
            child: Container(),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: Container(
        height: screen.height,
        child: (Column(
          children: [
            // kIsWeb
            //     ? Header(
            //         title: 'K线快速入门',
            //       )
            //     : Container(),
            kIsWeb
                ? Container(
                    height: screen.calc(64),
                    child: Container(
                        width: screen.width,
                        decoration: BoxDecoration(

                            /// 渐变色
                            gradient: LinearGradient(
                                //渐变位置
                                begin: Alignment.topLeft, //右上
                                end: Alignment.bottomRight, //左下
                                stops: [
                              0.0,
                              1.0
                            ], //[渐变起始点, 渐变结束点]
                                //渐变颜色[始点颜色, 结束颜色]
                                colors: [
                              Color.fromRGBO(61, 100, 255, 1),
                              Color.fromRGBO(83, 131, 252, 1)
                            ])),

                        /// 口袋贵金属引导app
                        child: ClassBanner()),
                  )
                : Container(),
            Stack(
              children: [
                Container(
                    height: screen.calc(210),
                    child: Image.asset('assets/k_thread.png')),
                Positioned(
                    left: screen.calc(10),
                    top: screen.calc(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Image.asset(
                          'assets/icon_back.png',
                          color: Colors.white,
                          height: screen.calc(17),
                        ),
                      ),
                    )),
                Positioned(
                    right: screen.calc(10),
                    top: screen.calc(10),
                    child: GestureDetector(
                      onTap: () {
                        print('分享课程');
                      },
                      child: Container(
                        child: Image.asset(
                          'assets/icon_share.png',
                          color: Colors.white,
                          height: screen.calc(17),
                        ),
                      ),
                    )),
              ],
            ),
            Expanded(
              child: Container(
                  height: screen.height - screen.calc(210),
                  child: isLoad
                      ? ClassTabBar(childTab: a1)
                      : Container(child: Text('请稍等'))),
            ),
            ClassSub(),
          ],
        )),
      ),
    );
  }

  /// 读取课程介绍数据
  // classIntroModel a;
  GetClassIntro(a) async {
    LCObject classIntro;
    LCQuery<LCObject> Intro = LCQuery('Intro');
    classIntro = await Intro.get('60af56753a9657317b5d44ed');
    // print('打印');
    // print('hello${classIntro['teachInfo']}');
    /// JSON转model
    a1 = classIntroModel(
      teachInfo: TeachInfo.fromJson(classIntro['teachInfo']),
    );
    setState(() {
      isLoad = true;
    });
  }
}

class PlatformUtils {
  bool _isWeb() {
    return kIsWeb == true;
  }

  bool _isAndroid() {
    return _isWeb() ? false : Platform.isAndroid;
  }

  bool _isIOS() {
    return _isWeb() ? false : Platform.isIOS;
  }

  bool _isMacOS() {
    return _isWeb() ? false : Platform.isMacOS;
  }

  bool _isWindows() {
    return _isWeb() ? false : Platform.isWindows;
  }

  bool _isFuchsia() {
    return _isWeb() ? false : Platform.isFuchsia;
  }

  bool _isLinux() {
    return _isWeb() ? false : Platform.isLinux;
  }

  bool get isWeb => _isWeb();

  bool get isAndroid => _isAndroid();

  bool get isIOS => _isIOS();

  bool get isMacOS => _isMacOS();

  bool get isWindows => _isWindows();

  bool get isFuchsia => _isFuchsia();

  bool get isLinux => _isLinux();
}
