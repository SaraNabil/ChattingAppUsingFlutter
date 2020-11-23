import 'package:chat_app/components/rounded_button.dart';
import 'package:chat_app/components/rounded_input_field.dart';
import 'package:chat_app/components/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'chats_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          color: Colors.white,
          height: size.height,
          width: double.infinity,
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/login_img.png',
                  height: size.height / 2,
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedInputField(
                  hintText: 'Email',
                  icon: Icons.mail,
                  textEditingController: _emailController,
                  validatorText: 'Please Fill email field',
                ),
                RoundedPasswordField(
                  textEditingController: _passController,
                  validatorText: 'Please Fill password field',
                ),
                RoundedButton(
                  text: 'Login',
                  press: () async {
                    //todo login code from firebase
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passController.text.trim())
                        .then((value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatsPage())));
                    print(_emailController.text);
                  },
                )
              ],
            ),
          )),
    );
  }

  void userLogin(String email, String password) async {
    try {} on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
