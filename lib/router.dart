import 'package:company_demo/Future/socket.dart';
import 'package:company_demo/home.dart';
import 'package:company_demo/class/info.dart';
import 'package:company_demo/Future/future.dart';
import 'package:company_demo/Future/img_load.dart';
import 'package:company_demo/leanCloud/couldData.dart';
import 'package:company_demo/leanCloud/data.dart';
import 'package:company_demo/test.dart';

import 'package:flutter/material.dart';

final routes = {
  '/': (BuildContext context) => Home(),
  '/info': (BuildContext context) => Info(),
  '/future': (BuildContext context) => MyFutureLearn(),
  '/imgLoading': (BuildContext context) => ImgLoading(),
  '/socketLearn': (BuildContext context) => SocketLearn(),
  '/Data': (BuildContext context) => Data(),
  '/CouldData': (BuildContext context) => CouldData(),
  '/Test': (BuildContext context) => Test(),
};
