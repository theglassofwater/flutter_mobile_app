import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/styles/colors.dart';
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
  String name = "";
  String email = "";
  String password = "";
  String repeatPassword = "";

  void setName(_name) {
    setState(() {
      name = _name;
    });
  }

  void setEmail(_email) {
    setState(() {
      email = _email;
    });
  }

  void setPassword(_password) {
    setState(() {
      password = _password;
    });
  }

  void setRepeatPassword(_password) {
    setState(() {
      repeatPassword = _password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),

      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topBar(
            currentStep: 1,
            setStep: widget.setStep,
            controller: widget.controller,
          ),
          SizedBox(height: 200), // Put image or something
          MyTextField(
            labelText: "Full name",
            icon: Icon(Icons.person),
            onChange: setName,
          ),
          SizedBox(height: 35),
          MyTextField(
            labelText: "Email",
            icon: Icon(Icons.email),
            isEmail: true,
            onChange: setEmail,
          ),
          SizedBox(height: 35),
          MyTextField(
            labelText: "Password",
            icon: Icon(Icons.key),
            isPassword: true,
            onChange: setPassword,
          ),
          SizedBox(height: 35),
          MyTextField(
            labelText: "Repeat Password",
            icon: Icon(Icons.password_rounded),
            isPassword: true,
            onChange: setRepeatPassword,
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
              MyButton(
                onTap:
                    () => widget.onSignUp(name, email, password, toApp: true),
                text: " Register ",
              ),
              MyButton(
                onTap: () => {widget.onSignUp(name, email, password)},
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
      ),
    );
  }
}
