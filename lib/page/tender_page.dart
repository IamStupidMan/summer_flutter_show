import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

/**
 * 主页动态tab页
 * Created by guoshuyu
 * Date: 2018-07-16
 */
class TenderPage extends StatefulWidget {
  TenderPage({Key key}) : super(key: key);

  @override
  DynamicPageState createState() => DynamicPageState();
}

class DynamicPageState extends State<TenderPage> {


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
