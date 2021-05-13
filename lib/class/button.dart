import 'package:flutter/material.dart';
import 'package:company_demo/util/screen_util.dart';

class MyButton extends StatelessWidget {
  final width;
  final height;
  final text;
  final color;
  final size;
  final fontColor;
  final fontWeiget;
  final action;
  const MyButton({
    Key key,
    this.height,
    this.text,
    this.color,
    this.width,
    this.size,
    this.fontColor,
    this.fontWeiget,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    final shape =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(height / 2));

    return FlatButton(
      onPressed: action,
      minWidth: width,
      child: Text(
        text,
        style: TextStyle(
            fontSize: size,
            color: fontColor,
            fontWeight: fontWeiget,
            fontFamily: " PingFangSC-Regular, PingFang SC;"),
      ),
      shape: shape,
      color: color,
    );
  }
}
