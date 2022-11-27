// import 'dart:html';

import 'package:FitnessApp/game/GameIn.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/login//responsive.dart';


import '../../components/background.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

import 'dart:ui';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Background(
    //   child: SingleChildScrollView(
    //     child: Responsive(
    //       mobile: const MobileLoginScreen(),
    //     //   desktop: Row(
    //     //     children: [
    //     //       const Expanded(
    //             child: LoginScreenTopImage(),
    //     //       ),
    //     //       Expanded(
    //     //         child: Row(
    //     //           mainAxisAlignment: MainAxisAlignment.center,
    //     //           children: const [
    //     //             SizedBox(
    //     //               width: 450,
    //     //               child: LoginForm(),
    //     //             ),
    //     //           ],
    //     //         ),
    //     //       ),
    //     //     ],
    //     //   ),
    //     ),
    //   ),
    // );
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.orange,
        body: Background(
            child:Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: const MobileLoginScreen()
            )
        )
    );
  }
}

class MobileLoginScreen extends StatefulWidget{
  const MobileLoginScreen({ super.key });
  @override
  _MobileLoginScreenState createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> with WidgetsBindingObserver {

  double _keyboardHeight = 0;
  final _scrollController = ScrollController();
  GlobalKey globalKey = GlobalKey();
  GlobalKey globalKey1 = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    print("initState");
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    print("dispose");
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    print("didChangeMetrics");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var pageHeight = MediaQuery.of(context).size.height;

      //弹出的键盘高度
      double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
      //获取监听的widget
      RenderBox? emailBox = globalKey.currentContext
          ?.findRenderObject() as RenderBox?;
      RenderBox? passwordBox = globalKey1.currentContext
          ?.findRenderObject() as RenderBox?;
      if (emailBox == null || passwordBox == null) {
        return;
      }
      //元件到底部的高度
      final emailBoxHeight = (pageHeight - emailBox.localToGlobal(Offset.zero).dy)-emailBox.size.height;
      final passwordBoxHeight = (pageHeight - passwordBox.localToGlobal(Offset.zero).dy) -passwordBox.size.height;
      //获取该widget距底部的长度
      final offsetYForEmail = keyboardHeight - emailBoxHeight;
      final offsetYForPassword = keyboardHeight - passwordBoxHeight ;
      // 判断当收起键盘，页面滑动到初始位置
      print("emailBox.size " + emailBox.size.height.toString());
      if(keyboardHeight == 0){
        _scrollController.jumpTo(0);
      } else {
        //判断键盘挡住控件就滑动
        if (offsetYForEmail > 0) { //判断键盘挡住控件就滑动
          //这里让scrollView向上滑动，滑动到控件距离键盘
          _scrollController.animateTo(
              (offsetYForEmail), duration: Duration(milliseconds: 100),
              curve: Curves.ease);
        }else if (offsetYForPassword > 0) { //判断键盘挡住控件就滑动
          //这里让scrollView向上滑动，滑动到控件距离键盘
          _scrollController.animateTo(
              (offsetYForPassword.abs()), duration: Duration(milliseconds: 100),
              curve: Curves.ease);
        }
      }

      print("emailBoxHeight" + emailBoxHeight.toString());
      print("passwordBoxHeight" + passwordBoxHeight.toString());
      print("keyboardHeight"+ keyboardHeight.toString());//升起約３４６
      print("offsetYForEmail"+offsetYForEmail.toString());//541
      print("offsetYForPassword"+offsetYForPassword.toString());//541
      print("_scrollController.offset " + (_scrollController.offset).toString());
    });

    // TODO: implement didChangeMetrics
    // var pageHeight = MediaQuery.of(context).size.height;
    // if(pageHeight<0){
    //   return;
    // }
    //
    // final keyboardTopPixels = MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom;
    // final keyboardTopPoint  = keyboardTopPixels / MediaQuery.of(context).devicePixelRatio;
    // final keyboardHeight = pageHeight - keyboardTopPoint;
    //
    // RenderBox? renderbox =
    //   _globalKey.currentContext?.findRenderObject() as RenderBox?;
    // if(renderbox == null){
    //   return;
    // }
    // final bottomOffset = renderbox.localToGlobal(Offset(0, renderbox.size.height));
    // final targetDy = bottomOffset.dy;
    // final offsetY = keyboardHeight - (pageHeight - targetDy) + _scrollController.offset;
    //
    //   print("KeyboardHeight " + targetDy.toString());
    //   print("offsetY" + offsetY.toString());
    //
    // if (targetDy == 0) {
    //   _scrollController.jumpTo(0);
    // }else if(offsetY > 0){
    //   _scrollController.animateTo(offsetY, duration: kTabScrollDuration, curve: Curves.ease);
    // }

  }


  // TODO: implement didChangeMetrics
  // var pageHeight = MediaQuery.of(context).size.height;
  // if(pageHeight<0){
  //   return;
  // }
  //
  // final keyboardTopPixels = MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom;
  // final keyboardTopPoint  = keyboardTopPixels / MediaQuery.of(context).devicePixelRatio;
  // final keyboardHeight = pageHeight - keyboardTopPoint;
  //
  // setState(() {
  //   _keyboardHeight = keyboardHeight;
  // });
  //
  // if(keyboardHeight <= 0){
  //   return;
  // }
  // RenderBox? renderbox =
  //     _targetWidgetKey.currentContext?.findRenderObject() as RenderBox?;
  // if(renderbox == null){
  //   return;
  // }
  // final bottomOffset = renderbox.localToGlobal(Offset(0, renderbox.size.height));
  // final targetDy = bottomOffset.dy;
  // final offsetY = keyboardHeight - (pageHeight - targetDy) + _scrollController.offset;
  //
  // if(offsetY > 0){
  //   _scrollController.animateTo(offsetY, duration: kTabScrollDuration, curve: Curves.ease);
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(top: 70),
        controller: _scrollController,
        children: [
          const LoginScreenTopImage(),
          Row(
            // key:_targetWidgetKey,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Expanded(
                flex: 8,
                child: LoginForm(globalKey: globalKey, globalKey1: globalKey1)
              ),
              Spacer(),
            ],
          ),
          // SizedBox(height: _keyboardHeight),
        ],
      ),
    );
  }
// child: Container(
// color: Colors.amber,
// child: Text('1', style: TextStyle(fontSize: 100)),
// ),
}
