import 'package:flutter/material.dart';
import 'package:company_demo/util/screen_util.dart';
import 'package:company_demo/class/header.dart';
import 'package:company_demo/class/banner.dart';
import 'package:company_demo/class/class_tab.dart';

class Info extends StatelessWidget{
  const Info({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screen.height,
          child: (
              Column(
            children: [
              Header(
                title: 'K线快速入门',
              ),
              Container(
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
                    child: ClassBanner()),
              ),
              Container(
                child: Image.asset(('assets/k_thread.png'))
              ),
              /// TODO： TabBar切换出错，具体代码看下面这个组件对应文件
              ClassTabBar(),
            ],
          )),
        ),
      ),
    );
  }
}
