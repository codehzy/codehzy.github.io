import 'package:flutter/material.dart';
import 'package:company_demo/util/screen_util.dart';

class ClassSub extends StatelessWidget {
  const ClassSub({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    final textStyletop = TextStyle(
        fontSize: screen.calc(16),
        fontWeight: FontWeight.w600,
        color: Color(0xffB9815C));
    final textStyleBottom = TextStyle(
        fontSize: screen.calc(12),
        fontWeight: FontWeight.w400,
        color: Color(0xff657281));

    return Container(
      child: Row(
        children: [
          Container(
            width: screen.calc(166),
            margin: EdgeInsets.only(left: screen.calc(16)),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: screen.calc(101),
                        padding:
                        EdgeInsets.only(right: screen.calc(6)),
                        child: Text('V4会员以上', style: textStyletop),
                      ),
                      Container(
                        child: Text(
                          '￥999',
                          style: textStyletop,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin:
                        EdgeInsets.only(right: screen.calc(53)),
                        child: Text('普通会员', style: textStyleBottom),
                      ),
                      Container(
                        child: Text(
                          '￥2999',
                          style: textStyleBottom,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: screen.calc(17)),
            width: screen.calc(100),
            height: screen.calc(36),
            decoration: new BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [
                      0.0,
                      1.0
                    ],
                    colors: [
                      Color.fromRGBO(224, 175, 144, 1.0),
                      Color.fromRGBO(204, 140, 98, 1.0),
                    ])),
            child: FlatButton(
              onPressed: () {
                print('立即订阅');
              },
              child: Text(
                '立即订阅',
                style: TextStyle(
                    fontSize: screen.calc(16),
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
