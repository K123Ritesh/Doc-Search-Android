import 'package:flutter/material.dart';

class Change_PhoneNumber_Page extends StatefulWidget {
  const Change_PhoneNumber_Page({super.key});

  @override
  State<Change_PhoneNumber_Page> createState() =>
      _Change_PhoneNumber_PageState();
}

class _Change_PhoneNumber_PageState extends State<Change_PhoneNumber_Page> {
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
                  Text(
                    'Change Phone Number',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(width: 30),
                  Text(
                    'Change Phone Number',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 8),
                child: Text(
                  'Youll be logged out of all sessions except this one to protect your account if anyone is trying to gain access.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 8),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Background color
                    borderRadius:
                        BorderRadius.circular(25.0), // Rounded corners
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Current Mobile Number',
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 82, 78, 78)),
                      prefixIcon: Icon(Icons.phone, color: Colors.black),
                      border: InputBorder.none, // Remove default underline
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 41, 44, 255),
                          borderRadius: BorderRadius.circular(10)),
                      height: 40,
                      // width: 230,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CustomDialog();
                              });
                        },
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 37.0),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 390,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    height: 40,
                    width: 230,
                    child: Center(
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              )
            ]),
          )),
    ));
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      backgroundColor: Color.fromARGB(255, 72, 128, 224),
      title: Container(
        child: Column(
          children: [
            Icon(
              Icons.mail,
              size: 76,
              color: const Color.fromARGB(255, 255, 93, 82),
            ),
            SizedBox(height: 10),
            Text(
              'Enter OTP',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            OTPInput()
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Verify OTP',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ],
    );
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
