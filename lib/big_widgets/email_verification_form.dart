import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/screens/login.dart';
import 'package:flutter_mobile_app/styles/colors.dart';
import 'package:flutter_mobile_app/widgets/text_field.dart';
import 'package:flutter_mobile_app/widgets/topBar.dart';

class EmailVerificationForm extends StatelessWidget {
  final Function onSubmit;
  final PageController controller;
  final void Function(int step) setStep;

  const EmailVerificationForm({
    super.key,
    required this.onSubmit,
    required this.controller,
    required this.setStep,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topBar(currentStep: 2, setStep: setStep, controller: controller),
          Spacer(), // Put image or something
          MyTextField(
            labelText: "Email Verification Code",
            icon: Icon(Icons.pin),
          ),
          SizedBox(height: 150),
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
                onPressed: () => (controller.jumpToPage(2)),
                child: Text(
                  " Submit Code ",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an acount?"),
              TextButton(
                onPressed:
                    () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => Login()),
                    ),
                child: Text(
                  "Login",
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
