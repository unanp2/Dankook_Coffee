import 'package:flutter/material.dart';
import '../database/DatabaseHelper.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  final FocusNode _userIdFocusNode = FocusNode();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _passwordConfirmFocusNode = FocusNode();

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  final _formKey = GlobalKey<FormState>();
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_userIdFocusNode);
    });
  }

  Future<void> _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      String userId = _userIdController.text;
      String username = _usernameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;

      // 중복 확인
      bool usernameExists = await _databaseHelper.userExists(username, email);
      if (usernameExists) {
        setState(() {
          _errorMessage = '이미 존재하는 사용자 이름 또는 이메일입니다';
        });
        return;
      }

      await _databaseHelper.insertUser({
        'user_id': userId,
        'profile_picture_url': '',
        'login_id': username,
        'password': password,
        'nickname': username,
        'email': email,
      });

      setState(() {
        _errorMessage = '회원가입에 성공하였습니다. 로그인 해주세요.';
      });

      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('회원 가입', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '단국 커피 회원 가입',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
                ),
                SizedBox(height: 60),
                TextFormField(
                  controller: _userIdController,
                  focusNode: _userIdFocusNode,
                  decoration: InputDecoration(hintText: '아이디를 입력하세요'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '아이디를 입력하세요';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _usernameController,
                  focusNode: _usernameFocusNode,
                  decoration: InputDecoration(hintText: '이름을 입력하세요'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이름을 입력하세요';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  decoration: InputDecoration(hintText: '이메일을 입력하세요'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이메일을 입력하세요';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return '유효한 이메일 주소를 입력하세요';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: true,
                  decoration: InputDecoration(hintText: '비밀번호를 입력하세요'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력하세요';
                    }
                    if (value.length < 6) {
                      return '비밀번호는 최소 6자 이상이어야 합니다';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _passwordConfirmController,
                  focusNode: _passwordConfirmFocusNode,
                  obscureText: true,
                  decoration: InputDecoration(hintText: '비밀번호를 확인하세요'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 확인하세요';
                    }
                    if (value != _passwordController.text) {
                      return '비밀번호가 일치하지 않습니다';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _register,
                  child: Text('회원가입'),
                ),
                SizedBox(height: 20),
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
