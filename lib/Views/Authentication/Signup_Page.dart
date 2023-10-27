import 'package:doc_search/Bottom_Bar.dart';
import 'package:doc_search/Views/Authentication/Login_Page.dart';
import 'package:doc_search/Views/Home/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({super.key});

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 3, 110, 198)));
    return SafeArea(
        child: Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 3, 110, 198)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new,
                        color: Colors.white, size: 26),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    'Join ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Doc',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 20, 20),
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Search',
                    style: TextStyle(
                        color: Color.fromARGB(255, 15, 252, 66),
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
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
              SizedBox(
                height: 25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
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
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
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
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
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
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
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
                height: 15,
              ),
              Row(
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
              SizedBox(
                height: 30,
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
                          borderRadius: BorderRadius.circular(10)),
                      // height: 40,
                      // width: 230,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 6),
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
              SizedBox(
                height: 30,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Login_Page()));
                      },
                      child: Text(
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
              SizedBox(
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
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
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
              SizedBox(
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
                          Text(
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
              SizedBox(
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
                          Text(
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
          width: 35.0,
          height: 40,
          margin: EdgeInsets.all(5.0),
          child: TextField(
            controller: controllers[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
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
          decoration: BoxDecoration(color: Color.fromARGB(255, 3, 110, 198)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new,
                        color: Colors.white, size: 26),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
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
              SizedBox(
                height: 10,
              ),
              Center(
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
              SizedBox(
                height: 25,
              ),
              OTPInput(),
              SizedBox(
                height: 19,
              ),
              Center(
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
              SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 25, 67, 157),
                          borderRadius: BorderRadius.circular(10)),
                      // height: 40,
                      // width: 230,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 6),
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
