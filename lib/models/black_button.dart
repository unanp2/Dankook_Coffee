import '../login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlackButton extends StatelessWidget {
  String button_text;
  Widget button_page;
  BlackButton({required this.button_text, required this.button_page});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => button_page));
      },
      child: Container(
        height: 56,
        width: 360,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.black),
        child: Center(
          child: Text(
            button_text,
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
