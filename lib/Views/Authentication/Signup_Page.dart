import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_search/Views/Authentication/Login_Page.dart';
import 'package:doc_search/Views/Home/Home_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({super.key});
  static String verify = "";
  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  // Store verification ID and resend token
  // String _verificationId = '';
  int _resendToken = 0;
  String _countryCode = '+91';

  Future<void> _registerUser() async {
    try {
      // Send OTP to the user's mobile number
      await _auth.verifyPhoneNumber(
        phoneNumber: '$_countryCode${_mobileNumberController.text}',
        timeout: const Duration(minutes: 2),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verify the code
          await _auth.signInWithCredential(credential);
          await _saveUserData();
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Error sending OTP: $e');
        },
        codeSent: (String verificationId, int? resendToken) {
          Signup_Page.verify = verificationId;
          // _verificationId = verificationId;
          _resendToken = resendToken!;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('Auto-retrieval timed out');
        },
      );
    } catch (e) {
      print('Error during user registration: $e');
    }
  }

  Future<void> _saveUserData() async {
    try {
      String formattedMobileNumber = '+91${_mobileNumberController.text}';
      await _firestore.collection('Users').add({
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'mobileNumber': formattedMobileNumber,
        'city': _cityController.text,
      });
      print('User data saved successfully');
    } catch (e) {
      print('Error saving user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 3, 110, 198)));
    return SafeArea(
        child: Scaffold(
      body: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 3, 110, 198)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.white, size: 26),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  const Text(
                    'Join ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Doc',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 20, 20),
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Search',
                    style: TextStyle(
                        color: Color.fromARGB(255, 15, 252, 66),
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Hi, Welcome! 👋',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text(
                        'Are you a Doctor?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Register here ',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                    child: TextField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 82, 78, 78)),
                        prefixIcon:
                            Icon(Icons.person_2_outlined, color: Colors.black),
                        border: InputBorder.none, // Remove default underline
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                    child: TextField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 82, 78, 78)),
                        prefixIcon:
                            Icon(Icons.person_2_outlined, color: Colors.black),
                        border: InputBorder.none, // Remove default underline
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                    child: TextField(
                      controller: _mobileNumberController,
                      decoration: const InputDecoration(
                        hintText: 'Your Mobile Number',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 82, 78, 78)),
                        prefixIcon:
                            Icon(Icons.phone_android, color: Colors.black),
                        border: InputBorder.none, // Remove default underline
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                    child: TextField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                        hintText: 'Enter Your City',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 82, 78, 78)),
                        prefixIcon:
                            Icon(Icons.location_city, color: Colors.black),
                        border: InputBorder.none, // Remove default underline
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Yes, I understand and agree the Terms &\n Conditions",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _registerUser();
                      _saveUserData();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OTP_Entering_Page(
                            mobileNumber: _mobileNumberController.text,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 25, 67, 157),
                          borderRadius: BorderRadius.circular(10)),
                      // height: 40,
                      // width: 230,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30.0, vertical: 6),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                'Get Otp',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Login_Page()));
                      },
                      child: const Text(
                        ' Log in',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1.5,
                      width: 150,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      'or',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 1.5,
                      width: 150,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    height: 44,
                    width: 300,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                            height: 24,
                            width: 30,
                            'https://s3-alpha-sig.figma.com/img/ee6b/3f48/b89ad3b69027b4448422cdfd225c0901?Expires=1699228800&Signature=figvoE9HfxYgq8ZV4WeXdw8yYThj2vFISwHnUm3ygv7pCOrcNgG3qQxi41jf7duyAjKpQ4qmqTXbw7gRy674qLf1kleOWiCZ7Ci8TVHqd0-yHto80ZKgof6snUOJRYvwO1GHemfSkco7Z7be-deVKazxUJlgfGmg0FK9Eu1puQfaIIuaCWNBXHopU4-dmglnLn04hLr17dLmIDRqpeo2lP9XEo1W39-WM9IxrguCHnFBR9XeF-7URLTLFqVYfZhZSArtvbaIjo8ay2e1J4shUqTRv8YzFZs~ZtHrY4IxZ2YYh8PVx0Ng5RYK7ig9IsDqLmUTjo-yTmA-XVj~ft6b~Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                          ),
                          const Text(
                            'Login with facebook',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    height: 44,
                    width: 300,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                            height: 24,
                            width: 30,
                            'https://s3-alpha-sig.figma.com/img/0e8c/5336/ec40b19b6983a179020e0e933a042d6b?Expires=1699228800&Signature=B~1zFkzXaDodVf0zzDC9r2IBjoOsAIBd6WGx06wXjuS-Pl6OQXBNFSW12rrN8EEK6xuTfS6sb7xhPwItWTjdIIbg9yfZE9G2MuON6H9vRwj8JPUV9U81e24Fo4AL6fm2OH3NlK-CGOukuYygMQQXXHefm5yAnlyC~u-Ol72v~LCVmVcjzHaMVLBifqYd70RLq-Z3Hwm~4-GjfPKZRrQGcrO6PcHvCTn9QthNlBI7pqSPCrQ6sjb3COAhZrIr5FONCdZNpFoh50W~q~EYxY4sJJJqqex7RfYLQbmALHRQrfBRMlqN7mFxrKPcBkvY-Rq0QMIekVJshaFBHhFLOguN3w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                          ),
                          const Text(
                            'Login with Google',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]),
          )),
    ));
  }
}

class OTPInput extends StatefulWidget {
  @override
  _OTPInputState createState() => _OTPInputState();
}

// class _OTPInputState extends State<OTPInput> {
//   List<TextEditingController> controllers =
//       List.generate(6, (index) => TextEditingController());

class _OTPInputState extends State<OTPInput> {
  List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  List<bool> isDigitEntered = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            border: Border.all(
              color: isDigitEntered[index] ? Colors.green : Colors.grey,
            ),
          ),
          width: 35.0,
          height: 40,
          margin: const EdgeInsets.all(5.0),
          child: TextField(
            controller: controllers[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              border: InputBorder.none,
            ),
            onChanged: (value) {
              if (value.length == 1) {
                if (index < 5) {
                  FocusScope.of(context).nextFocus();
                } else {
                  // Handle submission when the last digit is entered.
                  String otp =
                      controllers.map((controller) => controller.text).join();
                  print("Entered OTP: $otp");
                  verifyOTPAndSignIn(otp);
                  // You can add your logic for OTP verification here.
                }
                setState(() {
                  isDigitEntered[index] = true;
                });
              } else {
                setState(() {
                  isDigitEntered[index] = false;
                });
              }
            },
          ),
        );
      }),
    );
  }
  
  Future<void> verifyOTPAndSignIn(String code) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: Signup_Page.verify,
        smsCode: code,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      // Now, you have access to the authenticated user

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomePage(user: user),
        ),
      );
    } catch (e) {
      // Handle OTP verification errors here
      print('Error verifying OTP: $e');
    }
  }

}

class OTP_Entering_Page extends StatefulWidget {
  // final String verificationId;
  final String mobileNumber;

  OTP_Entering_Page({required this.mobileNumber});

  @override
  State<OTP_Entering_Page> createState() => _OTP_Entering_PageState();
}

class _OTP_Entering_PageState extends State<OTP_Entering_Page> {
  final TextEditingController _otpController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 3, 110, 198)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.white, size: 26),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Almost There! ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Please enter the 6-digit code sent to your\nmobile number for verification.',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              OTPInput(),
              const SizedBox(
                height: 19,
              ),
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont Received OTP?',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Text(
                      'Try Again',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      // PhoneAuthCredential credential =
                      //     PhoneAuthProvider.credential(
                      //   // verificationId: widget.verificationId,
                      //   smsCode: _otpController.text,
                      // );

                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                          verificationId: Signup_Page
                              .verify, // Use the stored verification ID
                          smsCode: code, // Use the OTP entered by the user
                        );
                        await auth.signInWithCredential(credential);
                        // OTP verification succeeded, navigate to the home page
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      } catch (e) {
                        // Handle OTP verification errors here
                        print('Error verifying OTP: $e');
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 25, 67, 157),
                          borderRadius: BorderRadius.circular(10)),
                      // height: 40,
                      // width: 230,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30.0, vertical: 6),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                'Create My Account',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ]),
          )),
    ));
  }
}
