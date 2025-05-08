import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobile_app/big_widgets/email_verification_form.dart';
import 'package:flutter_mobile_app/models/Address.dart';
import 'package:flutter_mobile_app/models/Location.dart';
import 'package:flutter_mobile_app/models/POI.dart';
import 'package:flutter_mobile_app/screens/login.dart';
import 'package:flutter_mobile_app/services/overpass_api.dart';
import 'package:flutter_mobile_app/styles/colors.dart';
import 'package:flutter_mobile_app/big_widgets/bottom_navbar.dart';
import 'package:flutter_mobile_app/big_widgets/location_selection_form.dart';
import 'package:flutter_mobile_app/big_widgets/sign_up_form.dart';
import 'package:flutter_mobile_app/utils/screen_transitions.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_mobile_app/models/POI.dart';

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

  List<POI> _pois = [];
  POI? homeStation = null;
  POI? workStation = null;

  // Switching to Login
  void switchToLogin() {
    slideFrom(context, Login(), replace: true, fromLeft: true);
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (_) => Login()),
    // );
  }

  // Proccessing Sign Up
  void onSignUp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => BottomNavBar()),
    );
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
            onSubmit: () => {},
          ),
          LocationSelection(
            mapController: _mapController,
            controller: controller,
            setStep: setStep,
            onSignUp: onSignUp,
          ),
        ],
      ),
    );
  }
}
