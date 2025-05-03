import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/screens/login.dart';
import 'package:flutter_mobile_app/styles/colors.dart';
import 'package:flutter_mobile_app/widgets/bottom_navbar.dart';
import 'package:flutter_mobile_app/widgets/button.dart';
import 'package:flutter_mobile_app/widgets/topBar.dart';

class SignUpForm extends StatefulWidget {
  final PageController controller;
  final void Function(int step) setStep;
  final Function onSignUp;
  final Function switchToLogin;

  const SignUpForm({
    super.key,
    required this.controller,
    required this.setStep,
    required this.onSignUp,
    required this.switchToLogin,
  });

  @override
  State<StatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...topBar(
          currentStep: 1,
          setStep: widget.setStep,
          controller: widget.controller,
        ),
        Spacer(), // Put image or something
        FadeInUp(
          delay: Duration(milliseconds: 300),
          duration: Duration(milliseconds: 800),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: "Email",
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(height: 35),
        FadeInUp(
          delay: Duration(milliseconds: 300),
          duration: Duration(milliseconds: 800),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.key),
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(height: 35),
        FadeInUp(
          delay: Duration(milliseconds: 300),
          duration: Duration(milliseconds: 800),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.key),
              labelText: "Repeat Password",
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        FadeInUp(
          delay: Duration(milliseconds: 300),
          duration: Duration(milliseconds: 800),
          child: Row(
            children: [
              Checkbox(
                value: agreedToTerms,
                onChanged: (bool? value) {
                  setState(() {
                    agreedToTerms = value ?? false;
                  });
                },
              ),
              Text("I agree to the terms and conditions"),
            ],
          ),
        ),
        SizedBox(height: 50),
        Row(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(onTap: () => widget.onSignUp(), text: " Register "),
            MyButton(
              onTap: () => {widget.controller.jumpToPage(1), widget.setStep(1)},
              text: "Next Step",
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an acount?"),
            TextButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  ),
              child: Text(
                "Login",
                style: TextStyle(color: MyColors.darkPurple),
              ),
            ),
          ],
        ),
        SizedBox(height: 70),
      ],
    );
  }
}
