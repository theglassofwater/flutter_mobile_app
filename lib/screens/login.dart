import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/screens/sign_up.dart';
import 'package:flutter_mobile_app/styles/colors.dart';
import 'package:flutter_mobile_app/big_widgets/bottom_navbar.dart';
import 'package:flutter_mobile_app/big_widgets/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LoginPage(title: 'Login');
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Processing Login
  void onLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => BottomNavBar()),
    );
  }

  void switchToSignUp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => SignUp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.lightPink,
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: MyColors.lightPink,
        toolbarHeight: 50,
        title: Text(widget.title),
        centerTitle: true,
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
      ),

      body: LoginForm(onLogin: onLogin, switchToSignUp: switchToSignUp),
    );
  }
}
