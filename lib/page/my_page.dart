import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

/**
 * 主页动态tab页
 * Created by guoshuyu
 * Date: 2018-07-16
 */
class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  @override
  DynamicPageState createState() => DynamicPageState();
}

class DynamicPageState extends State<MyPage> {


  @override
  void initState() {
    super.initState();

  }




  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
    );
  }
}
