import 'package:flutter/material.dart';
import 'package:company_demo/util/screen_util.dart';

class Header extends StatelessWidget {
  final title;
  const Header({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Image.asset(
                'assets/icon_back.png',
                color: Colors.black,
                height: screen.calc(17),
              ),
            ),
          ),
          Expanded(
              child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: screen.calc(22)),
            ),
          )),
          Container(
            margin: EdgeInsets.only(right: screen.calc(3)),
            child: Image.asset(
              'assets/icon_share.png',
              height: screen.calc(27),
            ),
          )
        ],
      ),
    );
  }
}
