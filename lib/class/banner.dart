import 'package:flutter/material.dart';
import 'package:company_demo/class/button.dart';
import 'package:company_demo/util/screen_util.dart';

class ClassBanner extends StatelessWidget {
  const ClassBanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: screen.calc(16),
                bottom: screen.calc(13),
                left: screen.calc(24)),
            height: screen.calc(64),
            child: Image.asset(
              'assets/icon_koudai.png',
              fit: BoxFit.fill,
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: screen.calc(22)),
            child: MyButton(
              width: screen.calc(68),
              height: screen.calc(28),
              text: '打开',
              color: Colors.white,
              action: () {
                print('打开app');
              },
            ),
          ),
        ],
      ),
    );
  }
}
