import 'dart:async';

import 'package:flutter/material.dart';
import 'package:summerfluttershow/error_page.dart';

import 'app.dart';
import 'env/config_json.dart';
import 'env/config_wrapper.dart';
import 'env/env_config.dart';


void main() {
  ///捕获Flutter已经捕获的ERROR
  FlutterError.onError = (FlutterErrorDetails details) {
    reportError(details);
  };

  ///捕获Flutter未捕获的ERROR
  runZoned(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
      reportError(details);
      return ErrorPage(
          details.exception.toString() + "\n " + details.stack.toString(),
          details);
    };
//    runApp(ConfigWrapper(
//      child: FlutterApp(),
//      config: EnvConfig.getEnvConfig(ConfigJson.prod_config),
//    ));
    runApp(Container(
      width: 20.0,
      height: 20.0,
      color: Colors.yellow,
    ));
  });
}

///自行处理ERROR，这里选择简单处理，打印一下错误信息
void reportError(FlutterErrorDetails details) {
  ///do nothing
}

///给微任务队列插入一个任务
insertMicroTask(Function task) {
  Future.microtask(() {
    task();
  });
}
