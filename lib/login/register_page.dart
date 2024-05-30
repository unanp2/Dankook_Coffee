import 'package:dankookcoffee/home_page.dart';
import 'package:dankookcoffee/login/fotgot_page.dart';
import 'package:dankookcoffee/login/login_page.dart';
import 'package:dankookcoffee/models/input_gray_button.dart';
import 'package:dankookcoffee/models/login_banner.dart';
import 'package:dankookcoffee/models/mint_text_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();

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
                      '단국 커피 회원 가입',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    InputGrayButton(
                      text_controller: _usernameController,
                      button_text: 'Enter your name',
                    ),
                    SizedBox(
                      height: 12,
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
                    SizedBox(
                      height: 12,
                    ),
                    InputGrayButton(
                      text_controller: _passwordConfirmController,
                      button_text: 'Confirm password',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        String username = _usernameController.text;
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        String password_confirm = _passwordConfirmController.text;
            
                        bool id_check = false;
                        bool password_check = false;
            
                        if (username == 'a') {
                          id_check = true;
                        }
                        if (password == password_confirm) {
                          password_check = true;
                        }
                        if (id_check && password_check) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginPage()));
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
                            "Register",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LoginBanner(),
                    SizedBox(
                      height: 70,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "Already have an account?",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        MintTextButton(
                            button_text: 'Login Now',
                            button_widget: LoginPage()),
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
