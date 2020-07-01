# summerfluttershow

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.】




#这里是对代码检测的分析

1.将分析选项文件analysis_options.yaml放置在包的根目录中，与pubspec文件位于同一目录中.
note:分析选项文件的常规名称以前是.analysis_options （注意前导点和缺少的.yaml后缀）.
     我们希望在将来的版本中.analysis_options支持.analysis_options名称，
     因此我们建议您将.analysis_options文件重命名为analysis_options.yaml .
2.样本分析选项文件：
    include: package:pedantic/analysis_options.1.8.0.yaml

    analyzer:
    exclude: [build/**]
    strong-mode:
    implicit-casts: false

    linter:
    rules:
    - camel_case_types
该示例说明了最常见的顶级条目：
1.include:使用include: url可以从指定的URL引入选项，在上面样本分析选项文件中，是从pedantic软件包中的文件中引入.
2.使用analyzer:条目可自定义静态分析，启用更严格的类型检查，排除文件，忽略特定规则或更改规则的严重性 .
3。条目配置linter规则

