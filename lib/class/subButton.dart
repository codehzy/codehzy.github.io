import 'package:flutter/material.dart';
import 'package:company_demo/util/screen_util.dart';

class SubButton extends StatelessWidget {
  const SubButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return FlatButton(
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
    );
  }
}
