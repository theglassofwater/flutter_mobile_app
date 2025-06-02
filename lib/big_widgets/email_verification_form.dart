import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/widgets/text_field.dart';
import 'package:flutter_mobile_app/widgets/topBar.dart';

class EmailVerificationForm extends StatefulWidget {
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
  State<EmailVerificationForm> createState() => _EmailVerificationFormState();
}

class _EmailVerificationFormState extends State<EmailVerificationForm> {
  String code = "";
  bool isCodeValid = true;

  @override
  void initState() {
    super.initState();
    // codeController.addListener(onCodeChanged);
  }

  @override
  void dispose() {
    // codeController.removeListener(onCodeChanged);
    // codeController.dispose();
    super.dispose();
  }

  void setCode(_code) {
    setState(() {
      code = _code;
      // Assuming verification codes are 6 digits - adjust as needed
      // isCodeValid = code.length == 6 && RegExp(r'^\d{6}$').hasMatch(code);
    });
  }

  void handleSubmit() {
    if (isCodeValid) {
      // Call the parent's onSubmit function with the verification code
      widget.onSubmit(code);
    } else {
      // Show error message or handle invalid code
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 6-digit verification code'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topBar(
            currentStep: 2,
            setStep: widget.setStep,
            controller: widget.controller,
          ),
          const Spacer(), // Put image or something
          MyTextField(
            labelText: "Email Verification Code",
            icon: const Icon(Icons.pin),
            // controller: codeController,
            // keyboardType: TextInputType.number,
            // maxLength: 6,
            onChange: setCode, // Keep this if MyTextField requires it
          ),
          const SizedBox(height: 190),
          Row(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: isCodeValid ? Colors.black : Colors.grey,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                ),
                onPressed: handleSubmit,
                child: Text(
                  " Submit Code ",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 180),
        ],
      ),
    );
  }
}

// class EmailVerificationForm extends StatelessWidget {
//   final Function onSubmit;
//   final PageController controller;
//   final void Function(int step) setStep;

//   const EmailVerificationForm({
//     super.key,
//     required this.onSubmit,
//     required this.controller,
//     required this.setStep,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           topBar(currentStep: 2, setStep: setStep, controller: controller),
//           Spacer(), // Put image or something
//           MyTextField(
//             labelText: "Email Verification Code",
//             icon: Icon(Icons.pin),
//             onChange: () {},
//           ),
//           SizedBox(height: 190),
//           Row(
//             spacing: 30,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               MaterialButton(
//                 color: Colors.black,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//                 onPressed: () => (controller.jumpToPage(2)),
//                 child: Text(
//                   " Submit Code ",
//                   style: Theme.of(context).textTheme.titleSmall,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 180),
//         ],
//       ),
//     );
//   }
// }
