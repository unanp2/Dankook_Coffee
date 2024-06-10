import 'package:flutter/material.dart';
import '../home_page.dart';
import '../login/fotgot_page.dart';
import '../login/register_page.dart';
import '../database/DatabaseHelper.dart';
import '../models/input_gray_button.dart';
import '../models/login_banner.dart';
import '../models/mint_text_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _idFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  String _errorMessage = '';

  Future<void> _login() async {
    String email = _idController.text;
    String password = _passwordController.text;
    bool checkUser = await _databaseHelper.checkUser(email, password);
    if (checkUser) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      setState(() {
        _errorMessage = '아이디 또는 비밀번호가 잘못되었습니다.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '단국 커피 로그인',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
                  ),
                  SizedBox(height: 60),
                  TextField(
                    controller: _idController,
                    focusNode: _idFocusNode,
                    decoration: InputDecoration(
                      hintText: '아이디를 입력하세요',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '비밀번호를 입력하세요',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      MintTextButton(
                        button_text: '비밀번호를 잊으셨나요?',
                        button_widget: ForgotPage(),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: _login,
                    child: Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text(
                          "로그인",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  if (_errorMessage.isNotEmpty)
                    Text(
                      _errorMessage,
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  LoginBanner(),
                  SizedBox(height: 160),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "계정이 없으신가요?",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      MintTextButton(
                        button_text: '지금 가입하기',
                        button_widget: RegisterPage(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
