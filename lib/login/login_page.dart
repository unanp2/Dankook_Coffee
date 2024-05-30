import 'package:dankookcoffee/models/appbar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: 400,
        height: 720,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Text(
              '단국 커피 로그인',
              style: TextStyle(fontWeight: FontWeight.w700, ),
            )
          ],
        ),
      ),
    );
  }
}
