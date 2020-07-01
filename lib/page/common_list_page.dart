import 'package:flutter/material.dart';

/**
 * 通用list
 * Created by guoshuyu
 * on 2018/7/22.
 */

class CommonListPage extends StatefulWidget {
  final String userName;

  final String reposName;

  final String showType;

  final String dataType;

  final String title;

  CommonListPage(this.title, this.showType, this.dataType,
      {this.userName, this.reposName});

  @override
  _CommonListPageState createState() => _CommonListPageState();
}

class _CommonListPageState extends State<CommonListPage> {
  _CommonListPageState();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(
        widget.title ?? "",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      )),
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
