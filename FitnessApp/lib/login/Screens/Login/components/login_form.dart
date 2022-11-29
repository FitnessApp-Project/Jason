// import 'dart:js_util';

import 'package:flutter/material.dart';

import 'package:FitnessApp/HomePage.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';
import '../../../Screens/Login/login_screen.dart';
import 'package:FitnessApp/rootPage.dart';
import 'package:FitnessApp/authentication.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
    this.globalKey,
    this.globalKey1,
    this.fromKey
  }) : super(key: key);
  final GlobalKey? globalKey;
  final GlobalKey? globalKey1;
  final GlobalKey? fromKey;



  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            TextFormField(
              key: globalKey,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                key:globalKey1 ,
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Your password",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding/ 2),
            Hero(
              tag: "login_btn",
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        // return HomePage();
                        return RootPage(
                          auth: new Auth(),
                        );
                      },
                    ),
                  );
                },
                child: Text(
                  "登入".toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding/2),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
