import 'dart:developer';
import 'package:campusbuzz/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:campusbuzz/Home.dart';
import 'package:campusbuzz/createaccount.dart';
import 'package:auth_handler/auth_handler.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


class EmailVerificationScreen extends StatefulWidget {
  String pemailStr;
  String ppasswordStr;
  String pOtp;
  EmailVerificationScreen(
      {required this.pemailStr, required this.ppasswordStr , required this.pOtp});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState(pemailStr, ppasswordStr , pOtp);
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  String pemailStr;
  String ppasswordStr;
  String pOtp;
  _EmailVerificationScreenState(this.pemailStr, this.ppasswordStr, this.pOtp);
  // TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  AuthHandler authHandler = AuthHandler(); // Declare the AuthHandler instance

  @override
  void initState() {
    super.initState();



    // Configure the AuthHandler instance in the initState method
    authHandler.config(
      senderEmail: "campussbuzz@gmail.com",
      senderName: "Team - CampusBuzz",
      otpLength: 6,
    );
  }


    

  void createVerifiedAccount() async {
    try {
      // To prevent firebase Auth Exception(occurs if usere already exists)
      // create the account here
      UserCredential uc = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: pemailStr, password: ppasswordStr);
                    Navigator.pushReplacement(
                  context, CupertinoPageRoute(builder: (context) => Home()));        
    } on FirebaseAuthException catch(exp) {
      // Dialog box for User Already Exist
      log("Error occured $exp");
    }
  }
void sendOTP() async {
await authHandler.sendOtp(pemailStr);
try{

        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'OTP Sent',
          desc: 'A OTP has been sent on your Email',
          // btnCancelOnPress: () {},
          btnOkOnPress: () {
          }
            
        )..show();

}catch(e){
  log("Error:$e");
}
  }



void reSendOtp() async {
    try {
      await authHandler.sendOtp(pemailStr);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'OTP has been Resent',
        desc: 'Check your Inbox',
        // btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Failed to Send OTP',
        desc: 'Check your Email Address',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
    }
  }

  void verifyOTP(BuildContext context) async {
    await authHandler.sendOtp(pemailStr);

    String otpStr = otpController.text.trim();
    if (otpStr == "") {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        title: 'OTP not Entered',
        desc: 'Enter OTP to verify Email',
        // btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
    } else {
      try {
        
        bool checkOTP = await authHandler.verifyOtp(pOtp,otpStr);
        if (checkOTP) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Valid OTP',
            desc: 'Account Creation Started',
            // btnCancelOnPress: () {},
            btnOkOnPress: () {
              createVerifiedAccount();

            },
          )..show();
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Invalid OTP',
            desc: 'Enter valid OTP to verify Email',
            // btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )..show();
        }
      } catch (e) {
        log("Error verifying OTP: $e");
      }
    }
  }

  @override
Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Almost There!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          
          const SizedBox(height: 20),
            const Text(
              "Hang in tight! Just one step left to unlock the CampusBuzz adventure. Enter the OTP we sent to your email.",
              style: TextStyle(
                fontSize: 20,
                // fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(),
              ),
            ),



            const SizedBox(height: 15),
            SizedBox(
              width: 100, // Button width
              height: 53, // Button height
              child: ElevatedButton(
                onPressed: () {
                verifyOTP(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF112031),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Verify Email',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ),












            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('OTP not recieived?'),
                TextButton(
                  child: const Text(
                    'Resend OTP',
                    style: TextStyle(fontSize: 20,color: Color(0xFF112031),
                    ),
                    
                  ),
                  onPressed: () {
                    reSendOtp();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
