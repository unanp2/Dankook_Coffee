import 'package:flutter/material.dart';
import '../home_page.dart';
import '../login/login_page.dart';
import '../models/input_gray_button.dart';
import '../models/mint_text_button.dart';
import '../database/DatabaseHelper.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _loginIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '비밀 번호 찾기',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
              ),
              SizedBox(height: 60),
              InputGrayButton(
                text_controller: _loginIdController,
                button_text: 'Enter your login ID',
              ),
              SizedBox(height: 20),
              InputGrayButton(
                text_controller: _emailController,
                button_text: 'Enter your email',
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () async {
                  String loginId = _loginIdController.text;
                  String email = _emailController.text;

                  DatabaseHelper dbHelper = DatabaseHelper();
                  bool userExists = await dbHelper.userExists(loginId, email);

                  if (userExists) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid login ID or email')),
                    );
                  }
                },
                child: Container(
                  height: 56,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      "Send Code",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Remember password?",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  MintTextButton(
                    button_text: 'Login Now',
                    button_widget: LoginPage(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
