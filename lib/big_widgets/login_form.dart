import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/styles/colors.dart';

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
                // height: 50,
                onPressed: () => onLogin(),
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => BottomNavBar()),
                // ),
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SignUp()),
                // ),
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
