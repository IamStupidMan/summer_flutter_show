import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redux/redux.dart';
import 'package:summerfluttershow/redux/summer_state.dart';
import 'package:summerfluttershow/style/summer_color.dart';
import 'package:summerfluttershow/utils/navigator_utils.dart';
import 'package:summerfluttershow/widget/diff_scale_text.dart';
import 'package:summerfluttershow/widget/mole_widget.dart';

/**
 * 欢迎页
 */

class WelcomePage extends StatefulWidget {
  static final String sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool hadInit = false;

  String text = "";
  double fontSize = 76;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    ///防止多次进入
    Store<SummerState> store = StoreProvider.of(context);
    new Future.delayed(const Duration( milliseconds: 500), () {
      setState(() {
        text = "Welcome";
        fontSize = 60;
      });
    });
    new Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      setState(() {
        text = "GSYGithubApp";
        fontSize = 60;
      });
    });
    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
//      UserDao.initUserInfo(store).then((res) {
//        if (res != null && res.result) {
//          NavigatorUtils.goHome(context);
//        } else {
//          NavigatorUtils.goLogin(context);
//        }
//        return true;
//      });
      if (true) {
        NavigatorUtils.goHome(context);
      } else {
        NavigatorUtils.goLogin(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<SummerState>(
      builder: (context, store) {
        double size = 200;
        return Material(
          child: new Container(
            color: SummerColor.white,
            child: Stack(
              children: <Widget>[
                new Center(
                  child: new Image(
                      image: new AssetImage('static/images/welcome.png')),
                ),
                Align(
                  alignment: Alignment(0.0, 0.3),
                  child: DiffScaleText(
                    text: text,
                    textStyle: GoogleFonts.akronim().copyWith(
                      color: SummerColor.primaryDarkValue,
                      fontSize: fontSize,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 0.8),
                  child: Mole(),
                ),
                new Align(
                  alignment: Alignment.bottomCenter,
                  child: new Container(
                    width: size,
                    height: size,
                    child: new FlareActor("static/file/flare_flutter_logo_.flr",
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fill,
                        animation: "Placeholder"),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
