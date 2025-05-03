import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onTap;
  final String text;

  const MyButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      onPressed: () => {onTap()},
      child: Text(text, style: Theme.of(context).textTheme.titleSmall),
    );
  }
}
