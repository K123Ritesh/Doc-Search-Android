import 'package:doc_search/Doctor_bottomBar.dart';
import 'package:doc_search/Providers/Doctor_Part_Provider/Patient_And_Appointment_Provider.dart';
import 'package:doc_search/Views/Doctor%20Part/Profile/Change_Password.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Privacy_Policy_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Authentication/Login_Page.dart';

class Doctors_Setting_Page extends StatefulWidget {
  const Doctors_Setting_Page({super.key, required this.docCategory});
  final String docCategory;

  @override
  State<Doctors_Setting_Page> createState() => _Doctors_Setting_PageState();
}

class _Doctors_Setting_PageState extends State<Doctors_Setting_Page> {
  @override
  Widget build(BuildContext context) {
    final details = Provider.of<Patient_And_Appointment_Provider>(context);
    return Scaffold(
      bottomNavigationBar:
          DoctorBottombar(docCategory: widget.docCategory, SelectedIndex: 3),
      body: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF155467),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SizedBox(height: 23),
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
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        child: details.myDetails!.profile_pic == ' '
                            ? Icon(Icons.person, size: 90)
                            : ClipOval(
                                child: Image.network(
                                  details.myDetails!.profile_pic,
                                  width: 100.0.w,
                                  height: 100.0.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                        maxRadius: 50,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        details.myDetails!.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${details.myDetails!.city} | ${details.myDetails!.mobileNumber}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ]),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "Privacy Policy",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Privacy_Policy_Page()));
                          },
                          child: Icon(Icons.arrow_forward_ios,
                              size: 20, color: Colors.white),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Password",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Change_Password_Page()));
                          },
                          child: Icon(Icons.arrow_forward_ios,
                              size: 20, color: Colors.white),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Are you a Patient?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: InkWell(
                          onTap: () {},
                          child: Icon(Icons.arrow_forward_ios,
                              size: 20, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 220,
                ),
                InkWell(
                  onTap: () async {
                    FirebaseAuth _auth = FirebaseAuth.instance;
                    await _auth.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Doctor_Login_Page()),
                    );
                  },
                  child: Row(
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
                  ),
                )
              ],
            ),
          )),
    );
  }
}
