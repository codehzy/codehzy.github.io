import 'package:flutter/material.dart';
import 'package:company_demo/router.dart';
import 'package:leancloud_storage/leancloud.dart';

Future<void> main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LeanCloud.initialize(
        'dkaJmPAQtIrw6PvXIp92AEdy-gzGzoHsz', 'D6kmuNVJVS5JKRlYpF4YhL12',
        server: 'https://dkajmpaq.lc-cn-n1-shared.com',
        // to use your own custom domain
        queryCache: new LCQueryCache() // optinoal, enable cache
        );
    return MaterialApp(
      title: 'flutter',
      routes: routes,
      initialRoute: '/',
    );
  }
}
