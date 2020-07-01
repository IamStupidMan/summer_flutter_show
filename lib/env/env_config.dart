import 'package:json_annotation/json_annotation.dart';

///环境配置
class EnvConfig {
  final String env;
  final bool debug;
  final String app_name;
  final String api_host;
  final String app_icon;

  EnvConfig({
    this.env,
    this.debug,
    this.app_name,
    this.api_host,
    this.app_icon,
  });

  ///根据json创建环境配置
  static EnvConfig getEnvConfig(Map<dynamic, dynamic> json) {
    return EnvConfig(
      env: json['env'] as String,
      debug: json['debug'] as bool,
      app_name: json['app_name'] as String,
      api_host: json['api_host'] as String,
      app_icon: json['app_icon'] as String,
    );
  }
}
