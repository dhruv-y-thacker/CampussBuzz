import 'package:campusbuzz/emailVerfication.dart';
import 'package:flutter/material.dart';
import 'welcomeback.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:auth_handler/auth_handler.dart';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:campusbuzz/emailVerfication.dart';
import 'package:campusbuzz/main.dart';
import "Home.dart";
import 'previewScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: CreateAccountScreen(),
//   ));
// }
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Check if a user with the given email already exists
  Future<bool> isUserExists(String email) async {
    try {
      var users = await _auth.fetchSignInMethodsForEmail(email);
      return users.isNotEmpty;
    } catch (e) {
      print("Error checking user existence: $e");
      return false;
    }
  }

  // Other authentication methods like creating an account, signing in, etc.
  // ...
}

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({
    super.key,
  });

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
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

  void sigInviaGoogle(BuildContext context) async {
    log("Selected Google SignIn");

    //Create firebase auth
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    //SignOut all previous accounts
    await googleSignIn.signOut();

    //Trigger auth  flow
    GoogleSignInAccount? googleUser = await googleSignIn.signInSilently();
    if (googleUser == null) {
      googleUser = await googleSignIn.signIn();
    }

    //obtain details
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    //create user using details

    final AuthCredential uc = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //sigin in the user
    final UserCredential userCredential = await auth.signInWithCredential(uc);

    //navigation
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => Home()));
  }

  void createAccount(BuildContext context) async {
    String emailStr = _emailController.text.trim();
    String passwordStr = _passwordController.text.trim();
    String cPasswordStr = _confirmPasswordController.text.trim();
    String fNameStr = fNameController.text.trim();
    String lNameStr = lNameController.text.trim();

    FirebaseAuth auth = FirebaseAuth.instance;

    User? currentUser = auth.currentUser;
    User? uc = FirebaseAuth.instance.currentUser;

    bool userExists = await AuthService().isUserExists(emailStr);

    if (userExists) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        title: 'Account Already Exists',
        desc: 'SignIn with Registered Email',
        // btnCancelOnPress: () {},
        btnOkOnPress: () {
          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) => WelcomeBackScreen()));
        },
      )..show();
    } else {
      try {
        String pemailStr = _emailController.text.trim();
        String checkOtp = await authHandler.sendOtp(pemailStr);
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => EmailVerificationScreen(
                    pemailStr: emailStr,
                    ppasswordStr: passwordStr,
                    pOtp: checkOtp)));
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
        log("$e");
      }
    }
  }

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  TextEditingController lNameController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String _passwordError = '';
  String _confirmPasswordError = '';
  String _emailError = '';

  // Password strength criteria
  bool _hasUppercase = false;
  bool _hasDigits = false;
  bool _hasSpecialCharacters = false;

  void _validatePassword(String value) {
    setState(() {
      _hasUppercase = value.contains(RegExp(r'[A-Z]'));
      _hasDigits = value.contains(RegExp(r'\d'));
      _hasSpecialCharacters = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });

    if (value.isEmpty) {
      setState(() {
        _passwordError = 'Password is required';
      });
    } else if (value.length < 8) {
      setState(() {
        _passwordError = 'Password must be at least 8 characters';
      });
    } else if (!(_hasUppercase && _hasDigits && _hasSpecialCharacters)) {
      setState(() {
        _passwordError =
            'Password must include uppercase, digits, and special characters';
      });
    } else {
      setState(() {
        _passwordError = '';
      });
    }
  }

  void _validateConfirmPassword(String value) {
    if (value.isEmpty) {
      setState(() {
        _confirmPasswordError = 'Confirm Password is required';
      });
    } else if (value != _passwordController.text) {
      setState(() {
        _confirmPasswordError = 'Passwords do not match';
      });
    } else {
      setState(() {
        _confirmPasswordError = '';
      });
    }
  }

  void _validateEmail(String value) {
    bool isValidEmail =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
    if (value.isEmpty) {
      setState(() {
        _emailError = 'Email is required';
      });
    } else if (!isValidEmail) {
      setState(() {
        _emailError = 'Invalid email format';
      });
    } else if (value.contains(' ')) {
      setState(() {
        _emailError = 'Email should not contain spaces';
      });
    } else {
      setState(() {
        _emailError = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: TextButton(
              onPressed: () {
                // Handle preview button press
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white, // Changed color
              ),
              child: const Text(
                'Preview',
                style: TextStyle(
                  color: Color(0xFFE93030),
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Your Journey Starts Here',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          
          const SizedBox(height: 20),
            const Text(
              "Begin by sharing your details.",
              style: TextStyle(
                fontSize: 20,
                // fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),





            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: fNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: lNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _emailController,
                onChanged: _validateEmail, // Added email validation
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorText: _emailError.isNotEmpty ? _emailError : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                onChanged: _validatePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorText: _passwordError.isNotEmpty ? _passwordError : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                onChanged: _validateConfirmPassword,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorText: _confirmPasswordError.isNotEmpty
                      ? _confirmPasswordError
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 360, // Button width
              height: 53, // Button height
              child: ElevatedButton(
                onPressed: () {
                  if (_emailError.isEmpty &&
                      _passwordError.isEmpty &&
                      _confirmPasswordError.isEmpty) {
                    createAccount(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const WelcomeBackScreen(),
                    //   ),
                    // );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF112031),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'or',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: 360,
              height: 53,
              decoration: BoxDecoration(
                color: const Color.fromARGB(231, 235, 230, 230),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  // Handle continue with Google button press
                  sigInviaGoogle(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png', height: 26),
                    const SizedBox(width: 10),
                    const Text(
                      'Continue with Google',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
