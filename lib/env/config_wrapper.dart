import 'package:flutter/material.dart';
import 'package:summerfluttershow/common/config/config.dart';
import 'package:summerfluttershow/env/env_config.dart';

///InheritedWidget 共享环境配置
class ConfigWrapper extends StatelessWidget {
  final EnvConfig config;

  final Widget child;

  ConfigWrapper({Key key, this.config, this.child});

  @override
  Widget build(BuildContext context) {
    ///设置Config.DEBUG 静态变量
    Config.DEBUG = config.debug;
    print("ConfigWrapper build ${Config.DEBUG}");
    return _InheritedConfig(config: this.config, child: this.child);
  }

  static EnvConfig of(BuildContext context) {
    final _InheritedConfig inheritedConfig =
        context.inheritFromWidgetOfExactType(_InheritedConfig);
    return inheritedConfig.config;
  }
}

class _InheritedConfig extends InheritedWidget {
  final EnvConfig config;

  _InheritedConfig({Key key, @required this.config, @required child})
      : assert(child != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedConfig oldWidget) {
    return config != oldWidget.config;
  }
}
