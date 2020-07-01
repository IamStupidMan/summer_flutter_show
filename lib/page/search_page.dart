import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

/**
 * 搜索页面
 * Created by guoshuyu
 * on 2018/7/24.
 */
class SearchPage extends StatefulWidget {
  final Offset centerPosition;

  SearchPage(this.centerPosition);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

///实现 PreferredSizeWidget 实现自定义 appbar bottom 控件


