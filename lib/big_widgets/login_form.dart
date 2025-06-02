import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/styles/colors.dart';
import 'package:flutter_mobile_app/widgets/text_field.dart';

class LoginForm extends StatefulWidget {
  final void Function(String email, String password) onLogin;
  final VoidCallback switchToSignUp;

  const LoginForm({
    super.key,
    required this.onLogin,
    required this.switchToSignUp,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = "";
  String password = "";

  void setEmail(String _email) {
    setState(() {
      email = _email;
    });
  }

  void setPassword(String _password) {
    setState(() {
      password = _password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          MyTextField(
            labelText: "Email",
            icon: Icon(Icons.person),
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
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                onPressed: () => widget.onLogin(email, password),
                child: Text(
                  " Login ",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(
                onPressed: widget.switchToSignUp,
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: MyColors.darkPurple),
                ),
              ),
            ],
          ),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}
