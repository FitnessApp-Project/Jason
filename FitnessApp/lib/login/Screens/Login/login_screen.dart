// import 'dart:html';

import 'package:FitnessApp/authentication.dart';
import 'package:FitnessApp/game/GameIn.dart';
import 'package:flutter/material.dart';
import 'package:FitnessApp/login//responsive.dart';


import '../../components/background.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

import 'dart:ui';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({required this.auth, required this.onSignedIn});

  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LoginScreenState();
}

enum FormMode { LOGIN, SIGNUP }

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver{

  double _keyboardHeight = 0;
  final _scrollController = ScrollController();
  GlobalKey globalKey = GlobalKey();
  GlobalKey globalKey1 = GlobalKey();
  final _formKey = new GlobalKey<FormState>();
  late String _email;
  late String _password;
  String _errorMessage = "";
  FormMode _formMode = FormMode.LOGIN;
  bool _isIos = false;
  bool _isLoading = false;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   print("initState");
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  // }
  //
  // @override
  // void dispose() {
  //   print("dispose");
  //   // TODO: implement dispose
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }
  //
  // @override
  // void didChangeMetrics() {
  //   print("didChangeMetrics");
  //
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     var pageHeight = MediaQuery.of(context).size.height;
  //
  //     //弹出的键盘高度
  //     double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
  //     //获取监听的widget
  //     RenderBox? emailBox = globalKey.currentContext
  //         ?.findRenderObject() as RenderBox?;
  //     RenderBox? passwordBox = globalKey1.currentContext
  //         ?.findRenderObject() as RenderBox?;
  //     if (emailBox == null || passwordBox == null) {
  //       return;
  //     }
  //     //元件到底部的高度
  //     final emailBoxHeight = (pageHeight - emailBox.localToGlobal(Offset.zero).dy)-emailBox.size.height;
  //     final passwordBoxHeight = (pageHeight - passwordBox.localToGlobal(Offset.zero).dy) -passwordBox.size.height;
  //     //获取该widget距底部的长度
  //     final offsetYForEmail = keyboardHeight - emailBoxHeight;
  //     final offsetYForPassword = keyboardHeight - passwordBoxHeight ;
  //     // 判断当收起键盘，页面滑动到初始位置
  //     print("emailBox.size " + emailBox.size.height.toString());
  //     if(keyboardHeight == 0){
  //       _scrollController.jumpTo(0);
  //     } else {
  //       //判断键盘挡住控件就滑动
  //       if (offsetYForEmail > 0) { //判断键盘挡住控件就滑动
  //         //这里让scrollView向上滑动，滑动到控件距离键盘
  //         _scrollController.animateTo(
  //             (offsetYForEmail), duration: Duration(milliseconds: 100),
  //             curve: Curves.ease);
  //       }else if (offsetYForPassword > 0) { //判断键盘挡住控件就滑动
  //         //这里让scrollView向上滑动，滑动到控件距离键盘
  //         _scrollController.animateTo(
  //             (offsetYForPassword.abs()), duration: Duration(milliseconds: 100),
  //             curve: Curves.ease);
  //       }
  //     }
  //
  //     print("emailBoxHeight" + emailBoxHeight.toString());
  //     print("passwordBoxHeight" + passwordBoxHeight.toString());
  //     print("keyboardHeight"+ keyboardHeight.toString());//升起約３４６
  //     print("offsetYForEmail"+offsetYForEmail.toString());//541
  //     print("offsetYForPassword"+offsetYForPassword.toString());//541
  //     print("_scrollController.offset " + (_scrollController.offset).toString());
  //   });
  //
  //   // TODO: implement didChangeMetrics
  //   // var pageHeight = MediaQuery.of(context).size.height;
  //   // if(pageHeight<0){
  //   //   return;
  //   // }
  //   //
  //   // final keyboardTopPixels = MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom;
  //   // final keyboardTopPoint  = keyboardTopPixels / MediaQuery.of(context).devicePixelRatio;
  //   // final keyboardHeight = pageHeight - keyboardTopPoint;
  //   //
  //   // RenderBox? renderbox =
  //   //   _globalKey.currentContext?.findRenderObject() as RenderBox?;
  //   // if(renderbox == null){
  //   //   return;
  //   // }
  //   // final bottomOffset = renderbox.localToGlobal(Offset(0, renderbox.size.height));
  //   // final targetDy = bottomOffset.dy;
  //   // final offsetY = keyboardHeight - (pageHeight - targetDy) + _scrollController.offset;
  //   //
  //   //   print("KeyboardHeight " + targetDy.toString());
  //   //   print("offsetY" + offsetY.toString());
  //   //
  //   // if (targetDy == 0) {
  //   //   _scrollController.jumpTo(0);
  //   // }else if(offsetY > 0){
  //   //   _scrollController.animateTo(offsetY, duration: kTabScrollDuration, curve: Curves.ease);
  //   // }
  //
  // }

  Widget progressWidget(){
    if(_isLoading){
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  void showSignupForm() {
    _formKey.currentState?.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void showLoginForm() {
    _formKey.currentState?.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  void errorWidget() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      print("_errorMessage " + _errorMessage.toString());
    }
  }

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()) {
      String userId = "";
      try {
        if (_formMode == FormMode.LOGIN) {
          userId = await widget.auth.signIn(_email, _password);
        } else {
          userId = await widget.auth.signUp(_email, _password);
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null) {
          widget.onSignedIn();
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.toString();
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
                child:  Expanded(
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
                              child: LoginForm(globalKey: globalKey, globalKey1: globalKey1, fromKey: _formKey)
                          ),
                          Spacer(),
                        ],
                      ),
                      // SizedBox(height: _keyboardHeight),
                    ],
                  ),
                )
            )
        )
    );
  }
}
