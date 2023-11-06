import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_search/Providers/User_Provider.dart';
import 'package:doc_search/Views/Patient%20Part/Home/Home_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import 'Signup_Page.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);
  static String verify = "";

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  TextEditingController countryController = TextEditingController();
  var phone = '';

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  Future<bool> isPhoneNumberInUsersCollection(String phoneNumber) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('mobileNumber', isEqualTo: phoneNumber)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('Error checking phone number in Users collection: $e');
      return false; // Return false if an error occurs
    }
  }

  void showSignUpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Phone Number Not Registered"),
          content: Text(
            "Your phone number is not registered. Would you like to sign up?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Signup_Page()),
                );
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  Future<void> checkPhoneNumberAndVerifyOTP(BuildContext context) async {
    // final fullPhoneNumber = "${countryController.text}$phone";
    // final fullPhoneNumber = (phone.isNotEmpty) ? phone: "+91";
    final fullPhoneNumber = "+91$phone";
    if (await isPhoneNumberInUsersCollection(fullPhoneNumber)) {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: fullPhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          print('Verification failed: ${e.message}');
          if (e.code == 'ERROR_USER_NOT_FOUND') {
            showSignUpDialog(context);
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          Login_Page.verify = verificationId;
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OTP_Entering_Page(phoneNo: fullPhoneNumber),
          ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      showSignUpDialog(context);
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A6A83),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const Appointment1()),
            // );
          },
        ),
        title: Container(
          margin: const EdgeInsets.only(left: 80),
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color(0xFF1A6A83),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 20.h),
                child: Text(
                  'Hi, Welcome Back! 👋',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w, right: 20.w),
                height: 55.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1.w, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 40.w,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33.sp, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        phone = value;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your Mobile Number",
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: SizedBox(
                  width: 157.w,
                  height: 38.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0XFF005473),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () async {
                      if (phone.length == 0 ||
                          phone.length > 10 ||
                          phone.length < 10) {
                        showToastMessage('Enter valid mobile Number');
                      } else {
                        checkPhoneNumberAndVerifyOTP(context);
                      }
                      // Call the function
                    },
                    child: const Text(
                      "Next",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Signup_Page()));
                      },
                      child: Text(
                        ' Sign up',
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
                      margin: EdgeInsets.only(right: 10.w),
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
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10.r)),
                    height: 44.h,
                    width: 300.w,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                            height: 24.h,
                            width: 30.w,
                            'https://s3-alpha-sig.figma.com/img/ee6b/3f48/b89ad3b69027b4448422cdfd225c0901?Expires=1699228800&Signature=figvoE9HfxYgq8ZV4WeXdw8yYThj2vFISwHnUm3ygv7pCOrcNgG3qQxi41jf7duyAjKpQ4qmqTXbw7gRy674qLf1kleOWiCZ7Ci8TVHqd0-yHto80ZKgof6snUOJRYvwO1GHemfSkco7Z7be-deVKazxUJlgfGmg0FK9Eu1puQfaIIuaCWNBXHopU4-dmglnLn04hLr17dLmIDRqpeo2lP9XEo1W39-WM9IxrguCHnFBR9XeF-7URLTLFqVYfZhZSArtvbaIjo8ay2e1J4shUqTRv8YzFZs~ZtHrY4IxZ2YYh8PVx0Ng5RYK7ig9IsDqLmUTjo-yTmA-XVj~ft6b~Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
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
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10.r)),
                    height: 44.h,
                    width: 300.w,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                            height: 24.h,
                            width: 30.w,
                            'https://s3-alpha-sig.figma.com/img/0e8c/5336/ec40b19b6983a179020e0e933a042d6b?Expires=1699228800&Signature=B~1zFkzXaDodVf0zzDC9r2IBjoOsAIBd6WGx06wXjuS-Pl6OQXBNFSW12rrN8EEK6xuTfS6sb7xhPwItWTjdIIbg9yfZE9G2MuON6H9vRwj8JPUV9U81e24Fo4AL6fm2OH3NlK-CGOukuYygMQQXXHefm5yAnlyC~u-Ol72v~LCVmVcjzHaMVLBifqYd70RLq-Z3Hwm~4-GjfPKZRrQGcrO6PcHvCTn9QthNlBI7pqSPCrQ6sjb3COAhZrIr5FONCdZNpFoh50W~q~EYxY4sJJJqqex7RfYLQbmALHRQrfBRMlqN7mFxrKPcBkvY-Rq0QMIekVJshaFBHhFLOguN3w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                          ),
                          Text(
                            'Login with Google',
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
            ],
          ),
        ),
      ),
    );
  }
}

class OTP_Entering_Page extends StatefulWidget {
  const OTP_Entering_Page({Key? key, required this.phoneNo}) : super(key: key);

  final String phoneNo;

  @override
  State<OTP_Entering_Page> createState() => _OTP_Entering_PageState();
}

class _OTP_Entering_PageState extends State<OTP_Entering_Page> {
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

  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = '';
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context);
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyle(
          fontSize: 20.sp,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8.r),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A6A83),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Login_Page()),
            );
          },
        ),
        title: Container(
          margin: EdgeInsets.only(left: 80.w),
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF1A6A83),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w),
                child: Text(
                  'Almost There! ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
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
              Container(
                margin: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Pinput(
                  length: 6,
                  onChanged: (value) {
                    code = value;
                  },
                  showCursor: true,

                  // onCompleted: (pin) => print(pin),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: SizedBox(
                  width: 157.w,
                  height: 36.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF005473),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      onPressed: () async {
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: Login_Page.verify,
                                  smsCode: code);

                          await auth.signInWithCredential(credential);

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        } catch (e) {
                          print('wrong OTP');
                        }
                      },
                      child: const Text("Verify")),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Login_Page()));
                      },
                      child: const Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
