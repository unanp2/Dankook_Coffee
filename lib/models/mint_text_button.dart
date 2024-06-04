import 'package:flutter/material.dart';

class MintTextButton extends StatelessWidget {
  String button_text;
  Widget button_widget;
  MintTextButton({required this.button_text, required this.button_widget});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => button_widget));
      },
      child: Text(
        button_text,
        style: TextStyle(color: Color.fromARGB(255, 0, 182, 195)),
      ),
    );
  }
}
