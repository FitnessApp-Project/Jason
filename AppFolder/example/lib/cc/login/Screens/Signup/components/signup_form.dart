import 'package:body_detection_example/cc/tabBar.dart';
import 'package:flutter/material.dart';


import '../../../components/already_have_an_account_acheck.dart';
import 'package:body_detection_example/cc/helpers/Constants.dart';

import '../../Login/login_screen.dart';
import 'package:body_detection_example/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUpForm extends StatefulWidget{
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}
class _SignUpFormState extends State<SignUpForm> {
  String? errorMessage = '';
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
        await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }
  // Future<void> signInWithEmailAndPassword() async {
  //   try {
  //     await Auth().signInWithEmailAndPassword(
  //       email: _controllerEmail.text,
  //       password: _controllerPassword.text,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       errorMessage = e.message;
  //     });
  //   }
  // }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }

  // final _auth = FirebaseAuth.instance;
@override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    errorMessage = null;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            TextFormField(
              controller: _controllerEmail,
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
                controller: _controllerPassword,
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
            _errorMessage(),
            const SizedBox(height: defaultPadding / 2),
            ElevatedButton(
              onPressed: () async {
                // createUserWithEmailAndPassword();
                  try {
                    final newUser = await Auth().firebaseAuth
                        .createUserWithEmailAndPassword(
                        email: _controllerEmail.text,
                        password: _controllerPassword.text);
                    if (newUser != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => tabBar(),
                        ),
                      );
                    }
                  }catch (e) {
                    print(e);
                  }
                },
              child: Text("註冊".toUpperCase()),
            ),
            const SizedBox(height: defaultPadding/2),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
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
