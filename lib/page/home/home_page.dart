import 'dart:async';
import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:summerfluttershow/localization/default_localizations.dart';
import 'package:summerfluttershow/style/summer_color.dart';
import 'package:summerfluttershow/utils/navigator_utils.dart';
import 'package:summerfluttershow/widget/gsy_tabbar_widget.dart';
import 'package:summerfluttershow/widget/gsy_title_bar.dart';

import '../dynamic_page.dart';
import '../my_page.dart';
import '../tender_page.dart';
import 'widget/home_drawer.dart';

/**
 * 主页
 * Created by guoshuyu
 * Date: 2018-07-16
 */
class HomePage extends StatefulWidget {
  static final String sName = "home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  final GlobalKey<DynamicPageState> dynamicKey = new GlobalKey();
//  final GlobalKey<TrendPageState> trendKey = new GlobalKey();
//  final GlobalKey<MyPageState> myKey = new GlobalKey();

  /// 不退出
  Future<bool> _dialogExitApp(BuildContext context) async {
    ///如果是 android 回到桌面
    if (Platform.isAndroid) {
      AndroidIntent intent = AndroidIntent(
        action: 'android.intent.action.MAIN',
        category: "android.intent.category.HOME",
      );
      await intent.launch();
    }

    return Future.value(false);
  }

  _renderTab(icon, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Icon(icon, size: 16.0), new Text(text)],
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(SummerIcons.MAIN_DT, GSYLocalizations.i18n(context).home_dynamic),
      _renderTab(SummerIcons.MAIN_QS, GSYLocalizations.i18n(context).home_trend),
      _renderTab(SummerIcons.MAIN_MY, GSYLocalizations.i18n(context).home_my),
    ];

    ///增加返回按键监听
    return WillPopScope(
      onWillPop: () {
        return _dialogExitApp(context);
      },
      child: new GSYTabBarWidget(
        drawer: new HomeDrawer(),
        type: TabType.bottom,
        tabItems: tabs,
        tabViews: [
          new DynamicPage(),
          new TenderPage(),
          new MyPage(),
        ],
        backgroundColor: SummerColor.primarySwatch,
        indicatorColor: SummerColor.white,
        title: GSYTitleBar(
          GSYLocalizations.of(context).currentLocalized.app_name,
          iconData: SummerIcons.MAIN_SEARCH,
          needRightLocalIcon: true,
          onRightIconPressed: (centerPosition) {
            NavigatorUtils.goSearchPage(context, centerPosition);
          },
        ),
      ),
    );
  }
}
