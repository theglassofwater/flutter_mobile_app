import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/screens/login.dart';
import 'package:flutter_mobile_app/screens/sign_up.dart';
import 'package:flutter_mobile_app/styles/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OnboardingPage(title: 'Onboarding');
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key, required this.title});
  final String title;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.lightPink,
      appBar: AppBar(
        backgroundColor: MyColors.lightPink,
        title: Padding(
          padding: EdgeInsets.only(top: 30, left: 11),
          child: Row(
            children: [
              Icon(Icons.train_rounded),
              SizedBox(width: 10),
              Text(
                "Welcome to DelayMate",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: [
          _page("Take the guesswork out of your commute with DelayMate."),
          _page("Join now and stay ahead of every delay."),
        ],
      ),

      //
      persistentFooterButtons: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 32),
          child: Column(
            spacing: 30,
            children: [
              SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: WormEffect(),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      onPressed:
                          () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            ),
                          },
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed:
                          () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            ),
                          },
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _page(String text) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, left: 30, right: 50),
            child: Text(
              text,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 150),
            child: Lottie.asset(
              "assets/images/json/train_curved.json",
              height: 200,
              width: 200,
              repeat: false,
            ),
          ),
        ],
      ),
    );
  }
}
