import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/styles/colors.dart';
import 'package:flutter_mobile_app/widgets/text_field.dart';

class LoginForm extends StatelessWidget {
  final Function onLogin;
  final Function switchToSignUp;
  const LoginForm({
    super.key,
    required this.onLogin,
    required this.switchToSignUp,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(), // Put image or something
          MyTextField(labelText: "Email", icon: Icon(Icons.person)),
          SizedBox(height: 35),
          MyTextField(labelText: "Password", icon: Icon(Icons.key)),
          SizedBox(height: 80),
          Row(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                onPressed: () => onLogin(),
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
              Text("Don't have an acount?"),
              TextButton(
                onPressed: () => switchToSignUp(),
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
