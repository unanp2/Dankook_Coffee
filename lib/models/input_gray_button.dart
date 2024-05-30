import 'package:flutter/material.dart';

class InputGrayButton extends StatelessWidget {
  TextEditingController text_controller;
  String button_text;
  InputGrayButton({required this.text_controller, required this.button_text});

    @override
  Widget build(BuildContext context) {
    return TextField(
      controller: text_controller,
      decoration: InputDecoration(
          labelText: button_text,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 243, 243, 243))),
          filled: true,
          fillColor: Color.fromARGB(255, 243, 243, 243)),
      style: TextStyle(color: Colors.grey),
    );
  }
}
