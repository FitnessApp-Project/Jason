// import 'package:untitled1/auth.dart';
// import 'package:untitled1/pages/home_page.dart';
// import 'package:untitled1/pages/login_register_page.dart';
import 'package:body_detection_example/cc/tabBar.dart';
import 'package:flutter/material.dart';
import 'package:body_detection_example/auth.dart';
import 'cc/Sports menu/homepage.dart';
import 'package:body_detection_example/cc/login/Screens/Login/login_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return tabBar();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
