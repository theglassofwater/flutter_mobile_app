import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/screens/settings.dart';
import 'package:flutter_mobile_app/screens/sign_up.dart';
import 'package:flutter_mobile_app/styles/colors.dart';
import 'package:flutter_mobile_app/widgets/bottom_navbar.dart';

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
  int _counter = 0;

  void _incrementCounter(int num) {
    setState(() {
      _counter += num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: MyColors.lightPink,
        toolbarHeight: 50,
        title: Text(widget.title),
        centerTitle: true,
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(), // Put image or something
            FadeInUp(
              delay: Duration(milliseconds: 300),
              duration: Duration(milliseconds: 1200),
              child: TextField(
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.green),
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
                style: TextStyle(color: Colors.green),
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
                  onPressed:
                      () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavBar(),
                          ),
                        ),
                      },
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
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      ),
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
      ),
    );
  }
}
