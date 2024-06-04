import 'package:dankookcoffee/home_page.dart';
import 'package:dankookcoffee/login/login_page.dart';
import 'package:dankookcoffee/login/register_page.dart';
import 'package:dankookcoffee/models/appbar.dart';
import 'package:dankookcoffee/models/black_button.dart';
import 'package:dankookcoffee/models/mint_text_button.dart';
import 'package:dankookcoffee/models/white_button.dart';
import 'package:flutter/material.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({super.key});

  @override
  State<LoginHomePage> createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        width: 400,
        height: 720,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.lightBlue,
              Colors.white, // 0% 불투명도의 흰색
            ],
                stops: [
              0.0,
              1.0
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80,),
            Container(
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/login_symbol.png'),
                      fit: BoxFit.fill)),
            ),
            SizedBox(height: 130,),
            Container(
              width: 360,
              height: 56,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/login_logo.png'),
                      fit: BoxFit.fill)),
            ),
            SizedBox(height: 10,),
            BlackButton(button_text: "Login", button_page: LoginPage(),),
            SizedBox(height: 10,),
            WhiteButton(button_text: "Register", button_page: RegisterPage(),),
            SizedBox(height: 50,),
            MintTextButton(button_text: 'Continue as a guest', button_widget: HomePage(),)
          ],
        ),
      ),
    );
  }
}
