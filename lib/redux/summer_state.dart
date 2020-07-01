import 'package:flutter/material.dart';
import 'package:summerfluttershow/model/user.dart';
import 'package:summerfluttershow/redux/locale_redux.dart';
import 'package:summerfluttershow/redux/theme_redux.dart';
import 'package:summerfluttershow/redux/user_redux.dart';

///全局的共享数据
class SummerState {
  ///用户登录的数据
  User userInfo;

  ///主题
  ThemeData themeData;

  ///当前手机平台默认语言
  Locale platformLocale;

  ///语言
  Locale locale;

  ///构造方法
  SummerState({this.userInfo, this.themeData, this.locale});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///Reducer接受两个参数，一个是state，是共享的状态，单一的数据，一个是action，一般是一个方法，操作state，并将操作后的state返回
///我们自定义了 appReducer 用于创建 store
SummerState summerReducer(SummerState summerState, action) {
  return SummerState(
      userInfo: UserReducer(summerState.userInfo, action),
      themeData: ThemeDataReducer(summerState.themeData, action),
      locale: LocaleReducer(summerState.locale, action));
}
