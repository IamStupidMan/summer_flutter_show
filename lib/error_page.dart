import 'package:flutter/material.dart';
import 'package:summerfluttershow/style/summer_color.dart';
import 'package:summerfluttershow/utils/common_utils.dart';

class ErrorPage extends StatefulWidget {
  final String errorMessage;
  final FlutterErrorDetails details;

  ErrorPage(this.errorMessage, this.details);

  @override
  ErrorPageState createState() => ErrorPageState();
}

class ErrorPageState extends State<ErrorPage> {
  static List<Map<String, dynamic>> sErrorStack =
      new List<Map<String, dynamic>>();
  static List<String> sErrorName = new List<String>();

  final TextEditingController textEditingController =
      new TextEditingController();

  addError(FlutterErrorDetails details) {
    try {
      var map = Map<String, dynamic>();
      map["error"] = details.toString();
//      LogsInterceptors.addLogic(
//          sErrorName, details.exception.runtimeType.toString());
//      LogsInterceptors.addLogic(sErrorStack, map);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: SummerColor.primaryValue,
      child: new Center(
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: width,
          decoration: new BoxDecoration(
            color: Colors.white.withAlpha(30),
            gradient:
                RadialGradient(tileMode: TileMode.mirror, radius: 0.1, colors: [
              Colors.white.withAlpha(10),SummerColor.primaryValue.withAlpha(100),
            ]),
            borderRadius: BorderRadius.all(Radius.circular(width / 2)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image(
                  image: new AssetImage(SummerIcons.DEFAULT_USER_ICON),
                  width: 90.0,
                  height: 90.0),
              new SizedBox(
                height: 11,
              ),
              Material(
                child: new Text(
                  "Error Occur",
                  style: new TextStyle(fontSize: 24, color: Colors.white),
                ),
                color: SummerColor.primaryValue,
              ),
              new SizedBox(
                height: 40,
              ),
              new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlatButton(
                      color: SummerColor.white.withAlpha(100),
                      onPressed: () {
                        String content = widget.errorMessage;
                        textEditingController.text = content;
//                        CommonUtils.showEditDialog(
//                            context,
//                            GSYLocalizations.i18n(context).home_reply,
//                            (title) {}, (res) {
//                          content = res;
//                        }, () {
//                          if (content == null || content.length == 0) {
//                            return;
//                          }
//                          CommonUtils.showLoadingDialog(context);
//                          IssueDao.createIssueDao(
//                              "CarGuo", "gsy_github_app_flutter", {
//                            "title": GSYLocalizations.i18n(context).home_reply,
//                            "body": content
//                          }).then((result) {
//                            Navigator.pop(context);
//                            Navigator.pop(context);
//                          });
//                        },
//                            titleController: new TextEditingController(),
//                            valueController: textEditingController,
//                            needTitle: false);
                      },
                      child: Text("Report")),
                  new SizedBox(
                    width: 40,
                  ),
                  new FlatButton(
                      color: SummerColor.white.withAlpha(100),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Back"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
