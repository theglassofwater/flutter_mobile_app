import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/screens/login.dart';
import 'package:flutter_mobile_app/styles/colors.dart';
import 'package:flutter_mobile_app/big_widgets/bottom_navbar.dart';
import 'package:flutter_mobile_app/utils/screen_transitions.dart';
import 'package:flutter_mobile_app/widgets/button.dart';
import 'package:flutter_mobile_app/widgets/text_field.dart';
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
        topBar(
          currentStep: 1,
          setStep: widget.setStep,
          controller: widget.controller,
        ),
        Spacer(), // Put image or something
        MyTextField(labelText: "Full name", icon: Icon(Icons.person)),
        SizedBox(height: 35),
        MyTextField(labelText: "Email", icon: Icon(Icons.email)),
        SizedBox(height: 35),
        MyTextField(labelText: "Password", icon: Icon(Icons.key)),
        SizedBox(height: 35),
        MyTextField(
          labelText: "Repeat Password",
          icon: Icon(Icons.password_rounded),
        ),
        SizedBox(height: 35),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: FadeInUp(
            delay: Duration(milliseconds: 300),
            duration: Duration(milliseconds: 800),
            child: Row(
              spacing: 10,
              children: [
                Checkbox(
                  value: agreedToTerms,
                  onChanged: (bool? value) {
                    setState(() {
                      agreedToTerms = value ?? false;
                    });
                  },
                ),
                Text("I agree to the Terms and Conditions"),
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        Row(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(onTap: () => widget.onSignUp(), text: " Register "),
            MyButton(
              onTap:
                  () => {
                    widget.controller..animateToPage(
                      1, // target page index
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut, // this is your animation style
                    ),
                    widget.setStep(1),
                  },
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
              onPressed: () => widget.switchToLogin(),
              child: Text(
                "Login",
                style: TextStyle(color: MyColors.darkPurple),
              ),
            ),
          ],
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
