import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobile_app/big_widgets/email_verification_form.dart';
import 'package:flutter_mobile_app/models/POI.dart';
import 'package:flutter_mobile_app/screens/login.dart';
import 'package:flutter_mobile_app/styles/colors.dart';
import 'package:flutter_mobile_app/big_widgets/bottom_navbar.dart';
import 'package:flutter_mobile_app/big_widgets/location_selection_form.dart';
import 'package:flutter_mobile_app/big_widgets/sign_up_form.dart';
import 'package:flutter_mobile_app/utils/account_provider.dart';
import 'package:flutter_mobile_app/utils/location_provider.dart';
import 'package:flutter_mobile_app/utils/screen_transitions.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SignUpPage(title: 'SignUp');
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});
  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controlling
  final controller = PageController();
  int currentStep = 1;

  final MapController _mapController = MapController();

  // Locations

  List<POI> pois = [];
  POI? home;
  POI? work;

  // Switching to Login
  void switchToLogin() {
    slideFrom(context, Login(), replace: true, fromLeft: true);
  }

  // Proccessing Sign Up
  void onSignUp(
    String? name,
    String? email,
    String? password, {
    bool toApp = false,
  }) {
    if (name != null) {
      Provider.of<AccountProvider>(context, listen: false).setName(name);
    } else {
      print("name not set");
    }

    if (email != null) {
      Provider.of<AccountProvider>(context, listen: false).setEmail(email);
    } else {
      print("email not set");
    }

    if (password != null) {
      Provider.of<AccountProvider>(
        context,
        listen: false,
      ).setPassword(password);
    } else {
      print("password not set");
    }
    if (toApp) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => BottomNavBar()),
      );
    }
    controller.animateToPage(
      1, // target page index
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut, // this is your animation style
    );
    setStep(1);
  }

  void onEmailVerification(String code) {
    controller.animateToPage(
      2, // target page index
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut, // this is your animation style
    );
    setStep(2);
  }

  void onLocationSelection(POI? home, POI? work, bool isTrainUser) {
    if (home != null) {
      Provider.of<LocationProvider>(context, listen: false).setHome(home);
    }
    if (work != null) {
      Provider.of<LocationProvider>(context, listen: false).setWork(work);
    }
    print(home);
    print(work);
    // if home and work is not not, or isTrainUser=false then...
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => BottomNavBar()),
    );
    // widget.onSignUp();
  }

  void setStep(int step) {
    setState(() {
      currentStep = step;
    });
  }

  // Proccessing Location Selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.lightPink,
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: [
          SignUpForm(
            controller: controller,
            setStep:
                (step) => setState(() {
                  currentStep = step;
                }),
            onSignUp: onSignUp,
            switchToLogin: switchToLogin,
          ),
          EmailVerificationForm(
            controller: controller,
            setStep: setStep,
            onSubmit: onEmailVerification,
          ),
          LocationSelectionForm(
            mapController: _mapController,
            controller: controller,
            setStep: setStep,
            onLocationSelection: onLocationSelection,
          ),
        ],
      ),
    );
  }
}
