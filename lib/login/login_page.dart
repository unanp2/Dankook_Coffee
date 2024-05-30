import 'package:dankookcoffee/home_page.dart';
import 'package:dankookcoffee/login/fotgot_page.dart';
import 'package:dankookcoffee/login/register_page.dart';
import 'package:dankookcoffee/models/input_gray_button.dart';
import 'package:dankookcoffee/models/login_banner.dart';
import 'package:dankookcoffee/models/mint_text_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 400,
              height: 720,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '단국 커피 로그인',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    InputGrayButton(
                      text_controller: _emailController,
                      button_text: 'Enter your email',
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    InputGrayButton(
                      text_controller: _passwordController,
                      button_text: 'Enter your password',
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 210,
                        ),
                        MintTextButton(
                            button_text: 'Forgot password?',
                            button_widget: ForgotPage())
                      ],
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        bool emailcheck = false;
                        bool passwordcheck = false;
                        if (email == 'a@a') {
                          emailcheck = true;
                        }
                        if (password == 'aa') {
                          passwordcheck = true;
                        }
                        if (emailcheck && passwordcheck) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomePage()));
                        }
                      },
                      child: Container(
                        height: 56,
                        width: 360,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    LoginBanner(),
                    SizedBox(height: 160,),
                    Row(
                      children: [
                        SizedBox(width: 50,),
                        Text("Don't have an account?", style: TextStyle(fontWeight: FontWeight.w700),),
                        MintTextButton(button_text: 'Register Now', button_widget: RegisterPage()),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
