import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redux/src/store.dart';
import 'package:summerfluttershow/model/user.dart';
import 'package:summerfluttershow/page/welcome_page.dart';
import 'package:summerfluttershow/redux/summer_state.dart';
import 'package:summerfluttershow/style/summer_color.dart';
import 'package:summerfluttershow/utils/common_utils.dart';

import 'http/code.dart';
import 'localization/default_localizations.dart';
import 'localization/gsy_localizations_delegate.dart';
import 'page/home/home_page.dart';
import 'utils/navigator_utils.dart';

class FlutterApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlutterAppState();
  }
}

class FlutterAppState extends State<FlutterApp> {
  ///定义一个store，保存全局共享的数据
  final store = new Store(summerReducer,
      initialState: new SummerState(
          userInfo: User.empty(),
          themeData: CommonUtils.getThemeData(SummerColor.primarySwatch),
          locale: Locale('zh', 'CH')));

  @override
  Widget build(BuildContext context) {
    ///全局状态共享，通过 StoreProvider 应用 store
    return StoreProvider(
      store: store,
      child: StoreBuilder<SummerState>(
        builder: (context, store) {
          store.state.platformLocale = WidgetsBinding.instance.window.locale;
          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GSYLocalizationsDelegate.delegate,
            ],
            supportedLocales: [store.state.locale],
            locale: store.state.locale,
            theme: store.state.themeData,
            home: HomePage(),
//              routes: {
//                WelcomePage.sName: (context) {
////                  _context = context;
////                  DebugLabel.showDebugLabel(context);
//                  return WelcomePage();
//                },
//                HomePage.sName: (context) {
////                  _context = context;
//                  return NavigatorUtils.pageContainer(new HomePage());
//                },
//
//              }
          );
        },
      ),
    );
  }
}

mixin HttpErrorListener on State<FlutterApp> {

  StreamSubscription stream;

  BuildContext _context;

  @override
  void initState() {
    super.initState();

    ///Stream演示event bus
//    stream = eventBus.on<HttpErrorEvent>().listen((event) {
//      errorHandleFunction(event.code, event.message);
//    });
  }


  errorHandleFunction(int code,String message){
    switch(code){
      case Code.NETWORK_ERROR:
        showToast(GSYLocalizations.i18n(_context).network_error);
        break;
      case 401:
        showToast(GSYLocalizations.i18n(_context).network_error_401);
        break;
      case 403:
        showToast(GSYLocalizations.i18n(_context).network_error_403);
        break;
      case 404:
        showToast(GSYLocalizations.i18n(_context).network_error_404);
        break;
      case 422:
        showToast(GSYLocalizations.i18n(_context).network_error_422);
        break;
      case Code.NETWORK_TIMEOUT:
      //超时
        showToast(GSYLocalizations.i18n(_context).network_error_timeout);
        break;
      case Code.GITHUB_API_REFUSED:
      //Github API 异常
        showToast(GSYLocalizations.i18n(_context).github_refused);
        break;
      default:
        showToast(GSYLocalizations.i18n(_context).network_error_unknown +
            " " +
            message);
        break;
    }
  }


  @override
  void dispose() {
    if(stream != null){
      stream.cancel();
      stream = null;
    }
    super.dispose();
  }

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT);
  }

}
