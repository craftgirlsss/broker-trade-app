import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockup_one/src/components/appbars.dart';
import 'package:mockup_one/src/components/buttons.dart';
import 'package:mockup_one/src/components/textstyle.dart';
import 'package:mockup_one/src/helpers/time_converter.dart';
import 'package:mockup_one/src/views/login/create.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  OtpFieldController otpController = OtpFieldController();
  int secondsRemaining = 60;
  bool enableResend = false;
  Timer? timer;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: kDefaultAppBarCustom(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text("VERIFICATION CODE", style: kDefaultTextStyleSubtitleSplashScreen(color: Colors.black87)),
              ),
              const SizedBox(height: 15),
              Center(child: Image.asset('assets/images/otp_image.png')),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text("Enter Verification Code", style: kDefaultTextStyleCustom(color: Colors.black, fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text("Please input OTP Code where we have sent to your WhatsApp number", style: kDefaultTextStyleCustom(color: Colors.black54, fontSize: 15),),
              ),
              const SizedBox(height: 20),   
              Center(
                child: OTPTextField(
                  otpFieldStyle: OtpFieldStyle(
                    backgroundColor: Colors.indigo.withOpacity(0.1),
                    borderColor: Colors.indigo.withOpacity(0.2),
                    enabledBorderColor: Colors.indigo.withOpacity(0.2),
                  ),
                  controller: otpController,
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceEvenly,
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 10,
                  style: kDefaultTextStyleCustom(fontSize: 17),
                  onChanged: (pin) {
                    print("Changed: " + pin);
                  },
                  onCompleted: (pin) {
                    // otpController.clear();
                    print("Completed: " + pin);
                  },
                ),
              ),
              const SizedBox(height: 20),
              enableResend == true ? Container() : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Resend OTP in  ', style: kDefaultTextStyleCustom(),
                  ),
                  Text(
                    intToTimeLeft(secondsRemaining),
                    style: kDefaultTextStyleCustom(fontWeight: FontWeight.normal, color: Colors.black54),
                  ),
                ],
              ),
              enableResend ? Center(
                child: TextButton(
                  onPressed: enableResend ? resendCode : null,
                  child: Text("Resend OTP", style: kDefaultTextStyleCustom(fontSize: 16, color: Colors.indigo.withOpacity(0.9),),),
                ),
              ) : Container(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 30,
          child: kDefaultButtonLogin(
            onPressed: (){
              Get.to(() => const SignUp());
            },
            title: "S U B M I T"
          ),
        ),
      ),
    );
  }

  void resendCode() {
    //other code here
    setState((){
      enableResend = false;
    });
  }
  
  @override
  dispose(){
    timer?.cancel();
    super.dispose();
  }
}