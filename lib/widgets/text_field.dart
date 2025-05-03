import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // final Function onTap;
  final String labelText;
  final Icon? icon;

  const MyTextField({super.key, required this.labelText, this.icon});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: Duration(milliseconds: 300),
      duration: Duration(milliseconds: 800),
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          prefixIcon: icon ?? null,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
