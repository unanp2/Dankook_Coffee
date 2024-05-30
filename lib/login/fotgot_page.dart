import 'package:dankookcoffee/home_page.dart';
import 'package:dankookcoffee/login/login_page.dart';
import 'package:dankookcoffee/login/register_page.dart';
import 'package:dankookcoffee/models/input_gray_button.dart';
import 'package:dankookcoffee/models/login_banner.dart';
import 'package:dankookcoffee/models/mint_text_button.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  TextEditingController _emailController = TextEditingController();
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
                      '비밀 번호 찾기',
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
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        String username = _emailController.text;
                        bool namecheck = false;
                        bool passwordcheck = false;
                        if (username == 'a@a') {
                          namecheck = true;
                        }
                        if (namecheck && passwordcheck) {
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
                            "Send Code",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 360,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 70,
                        ),
                        Text(
                          "Remember password?",
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
