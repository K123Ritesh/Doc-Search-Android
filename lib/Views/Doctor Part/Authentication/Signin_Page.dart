import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:doc_search/Views/Patient%20Part/Authentication/Login_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Home/Home_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../Home/Home_Page.dart';

class Doctor_Signup_Page extends StatefulWidget {
  const Doctor_Signup_Page({super.key});
  static String verify = "";
  @override
  State<Doctor_Signup_Page> createState() => _Doctor_Signup_PageState();
}

class _Doctor_Signup_PageState extends State<Doctor_Signup_Page> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  int _resendToken = 0;
  String _countryCode = '+91';

  bool isSelected = false;

  void showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<void> _registerUser() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '$_countryCode${_mobileNumberController.text}',
        timeout: const Duration(minutes: 2),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verify the code
          await _auth.signInWithCredential(credential);

          String uid = getCurrentUserUid();
          await _saveUserData(uid);
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Error sending OTP: $e');
        },
        codeSent: (String verificationId, int? resendToken) {
          Doctor_Signup_Page.verify = verificationId;
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

  Future<void> _saveUserData(String uid) async {
    try {
      String formattedMobileNumber = '+91${_mobileNumberController.text}';
      await _firestore.collection('Dentist').doc(uid).set({
        'Bookings': {
          'dummy_date': {'dummy_slot': 'dummyId'}
        },
        'mobileNumber': formattedMobileNumber,
        'address': ' ',
        'city': _cityController.text,
        'email': "drnk@gmail.com",
        'experience': "0",
        'name': "Dr. Rahul Kumar",
        'pin_code': "846001",
        'rating': "4.8",
        'reg_fee': "500",
        'sitting_days': [' ', ' '],
        'specialization': "Speacialist Surgeon"
      });
      print('User data saved successfully');
    } catch (e) {
      print('Error saving user data: $e');
    }
  }

  String getCurrentUserUid() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      String uid = user.uid;
      return uid;
    } else {
      return "User not authenticated";
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: const Color(0xFF1A6A83),
    ));
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFF1A6A83),
      body: Container(
          decoration: const BoxDecoration(
            color: const Color(0xFF1A6A83),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: ListView(children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.white, size: 26),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  Text(
                    'Join ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Doc',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 20, 20),
                        fontSize: 23.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Search',
                    style: TextStyle(
                        color: Color.fromARGB(255, 15, 252, 66),
                        fontSize: 23.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 45.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Hi, Welcome! 👋',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text(
                        'Are you a Patient?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      InkWell(
                        // onTap: () {
                        //   Navigator.of(context).pushReplacement(
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               Doctor_Doctor_Signup_Page()));
                        // },
                        child: Text(
                          'Register here ',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 8.h),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(20.0.r), // Rounded corners
                    ),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                      ],
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
                    EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 8.h),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(20.0.r), // Rounded corners
                    ),
                    child: TextField(
                      controller: _lastNameController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                      ],
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
                    EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 8.h),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(20.0.r), // Rounded corners
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
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
                    EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 8.h),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(20.0.r), // Rounded corners
                    ),
                    child: TextField(
                      controller: _cityController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                      ],
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
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: isSelected == false
                        ? Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.check_box_rounded,
                            color: Colors.green,
                          ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    "Yes, I understand and agree the Terms &\n Conditions",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (_firstNameController.text == "") {
                        showToastMessage('Please Enter all the Fields ');
                      } else if (_lastNameController.text == "") {
                        showToastMessage('Please Enter all the Fields ');
                      } else if (_cityController.text == "") {
                        showToastMessage('Please Enter all the Fields ');
                      } else if (_mobileNumberController.text.length != 10) {
                        showToastMessage('Please Enter valid Mobile Number ');
                      } else if (isSelected == false) {
                        showToastMessage('Accept Terms and Conditions');
                      } else if (_mobileNumberController.text != "" &&
                          _cityController.text != "" &&
                          _firstNameController.text != "" &&
                          _lastNameController.text != "" &&
                          isSelected == true) {
                        _registerUser();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OTP_Entering_Page(
                              city: _cityController.text,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              mobileNumber: _mobileNumberController.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 25, 67, 157),
                          borderRadius: BorderRadius.circular(10.r)),
                      // height: 40,
                      // width: 230,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0.w, vertical: 6.h),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                'Get Otp',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10.w,
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
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Login_Page()));
                      },
                      child: Text(
                        ' Log in',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1.5.h,
                      width: 130.w,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Container(
                      // margin: EdgeInsets.only(right: 10),
                      height: 1.5.h,
                      width: 130.w,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10.r)),
                    height: 44.h,
                    width: 300.w,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            height: 24.h,
                            width: 30.w,
                            'assets/Icons/Facebook Logo.png',
                          ),
                          Text(
                            'Login with facebook',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10.r)),
                    height: 44.h,
                    width: 300.w,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            height: 24.h,
                            width: 30.w,
                            'assets/Icons/Google Logo.png',
                          ),
                          Text(
                            'Signup with Google',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
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
  final String mobileNumber;
  final String firstName;
  final String lastName;
  final String city;

  const OTPInput(
      {super.key,
      required this.mobileNumber,
      required this.firstName,
      required this.lastName,
      required this.city});
  @override
  _OTPInputState createState() => _OTPInputState();
}

class _OTPInputState extends State<OTPInput> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> _saveUserData(String uid) async {
    try {
      String formattedMobileNumber = '+91${widget.mobileNumber}';
      await _firestore.collection('Dentist').doc(uid).set({
        'Bookings': {
          'dummy_date': {'dummy_slot': 'dummyId'}
        },
        'mobileNumber': formattedMobileNumber,
        'address': ' ',
        'city': widget.city,
        'email': "drnk@gmail.com",
        'experience': "0",
        'name': "${widget.firstName} ${widget.lastName}",
        'pin_code': "846001",
        'rating': "4.8",
        'reg_fee': "500",
        'sitting_days': [' ', ' '],
        'specialization': "Speacialist Surgeon"
      });
      await _firestore.collection('doctors').doc(uid).set({
        'Bookings': {
          'dummy_date': {'dummy_slot': 'dummyId'}
        },
        'mobileNumber': formattedMobileNumber,
        'address': ' ',
        'city': widget.city,
        'email': "drnk@gmail.com",
        'experience': "0",
        'name': "${widget.firstName} ${widget.lastName}",
        'pin_code': "846001",
        'rating': "4.8",
        'reg_fee': "500",
        'sitting_days': [' ', ' '],
        'specialization': "Speacialist Surgeon"
      });
      print('User data saved successfully');
    } catch (e) {
      print('Error saving user data: $e');
    }
  }

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
          width: 35.0.w,
          height: 40.h,
          margin: EdgeInsets.all(5.0.w),
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
        verificationId: Doctor_Signup_Page.verify,
        smsCode: code,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      await _saveUserData(user!.uid);

      // Now, you have access to the authenticated user

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Doctor_Home_Page(
            user: user,
          ),
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
  final String firstName;
  final String lastName;
  final String city;

  OTP_Entering_Page(
      {required this.mobileNumber,
      required this.firstName,
      required this.lastName,
      required this.city});

  @override
  State<OTP_Entering_Page> createState() => _OTP_Entering_PageState();
}

class _OTP_Entering_PageState extends State<OTP_Entering_Page> {
  final TextEditingController _otpController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = '';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFF1A6A83),
      body: Container(
          decoration: const BoxDecoration(color: const Color(0xFF1A6A83)),
          child: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: ListView(children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.white, size: 26),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 45.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    'Almost There! ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'Please enter the 6-digit code sent to your\nmobile number for verification.',
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              OTPInput(
                  city: widget.city,
                  firstName: widget.firstName,
                  lastName: widget.lastName,
                  mobileNumber: widget.mobileNumber),
              SizedBox(
                height: 19.h,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont Received OTP?',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Text(
                      'Try Again',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                          verificationId: Doctor_Signup_Page
                              .verify, // Use the stored verification ID
                          smsCode: code, // Use the OTP entered by the user
                        );
                        print('waiting for auth');
                        await auth.signInWithCredential(credential);

                        // OTP verification succeeded, navigate to the home page
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Doctor_Home_Page(),
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
                          borderRadius: BorderRadius.circular(10.r)),
                      // height: 40,
                      // width: 230,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0.w, vertical: 6.h),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                'Create My Account',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
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
