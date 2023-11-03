import 'package:doc_search/Views/Doctor%20Part/Authentication/Login_Page.dart';
import 'package:doc_search/Views/Doctor%20Part/Home/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Patient Part/Authentication/Signup_Page.dart';

class Doctor_Signup_Page extends StatefulWidget {
  const Doctor_Signup_Page({super.key});

  @override
  State<Doctor_Signup_Page> createState() => _Doctor_Signup_PageState();
}

class _Doctor_Signup_PageState extends State<Doctor_Signup_Page> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: const Color(0xFF155467),
    ));
    return SafeArea(
        child: Scaffold(
      body: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF155467),
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
                    child: Icon(Icons.arrow_back_ios_new,
                        color: Colors.white, size: 26),
                  ),
                  SizedBox(width: 60.w),
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
                height: 30.h,
              ),
              SizedBox(
                height: 15.h,
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
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Signup_Page()));
                        },
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
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 82, 78, 78)),
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
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 82, 78, 78)),
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
                      decoration: InputDecoration(
                        hintText: 'Enter Your Mobile Number',
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 82, 78, 78)),
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
                      decoration: InputDecoration(
                        hintText: 'Enter Your City',
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 82, 78, 78)),
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
                  Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.white,
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OTP_Entering_Page()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 25, 67, 157),
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
                            builder: (context) => Doctor_Login_Page()));
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
                      width: 150.w,
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
                      height: 1.5.h,
                      width: 150.w,
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
                        // color: Colors.white,
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
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
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

class _OTPInputState extends State<OTPInput> {
  List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          width: 35.0.w,
          height: 40.h,
          margin: EdgeInsets.all(5.0.w),
          child: TextField(
            controller: controllers[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0.r),
              ),
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
                  // You can add your logic for OTP verification here.
                }
              }
            },
          ),
        );
      }),
    );
  }
}

class OTP_Entering_Page extends StatefulWidget {
  const OTP_Entering_Page({super.key});

  @override
  State<OTP_Entering_Page> createState() => _OTP_Entering_PageState();
}

class _OTP_Entering_PageState extends State<OTP_Entering_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF155467),
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
                    child: Icon(Icons.arrow_back_ios_new,
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
                height: 30.h,
              ),
              SizedBox(
                height: 15.h,
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
              OTPInput(),
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
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Doctor_Home_Page()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 25, 67, 157),
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
