import 'package:doc_search/Bottom_Bar.dart';
import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:doc_search/Views/Not_Build_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Authentication/Login_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Change_PhoneNumber_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Feedback_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Privacy_Policy_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Settings_Page extends StatefulWidget {
  const Settings_Page({super.key});

  @override
  State<Settings_Page> createState() => _Settings_PageState();
}

class _Settings_PageState extends State<Settings_Page> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context);
    return Scaffold(
      bottomNavigationBar: Bottombar(SelectedIndex: 3),
      body: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF155467),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: ListView(
              children: [
                SizedBox(height: 23.h),
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
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            child: userProvider.user.profilePicUrl == ''
                                ? Icon(Icons.person,
                                    color: Colors.blue, size: 90)
                                : ClipOval(
                                    child: Image.network(
                                      userProvider.user.profilePicUrl,
                                      width: 95.0.w,
                                      height: 95.0.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                            maxRadius: 50.r,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "${userProvider.user.firstName} ${userProvider.user.lastName}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${userProvider.user.city} | ${userProvider.user.mobileNo}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ]),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Feedback_Page()));
                        },
                        child: ListTile(
                          title: Text(
                            "Feedback",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Feedback_Page()));
                            },
                            child: Icon(Icons.arrow_forward_ios,
                                size: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Privacy_Policy_Page()));
                        },
                        child: ListTile(
                          title: Text(
                            "Privacy Policy",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
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
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Change_PhoneNumber_Page()));
                        },
                        child: ListTile(
                          title: Text(
                            "Change Phone Number",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      Change_PhoneNumber_Page()));
                            },
                            child: Icon(Icons.arrow_forward_ios,
                                size: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Not_Build_Page(
                                    selectedIndex: 3,
                                  )));
                        },
                        child: ListTile(
                          title: Text(
                            "Are you a Doctor?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: InkWell(
                            onTap: () {},
                            child: Icon(Icons.arrow_forward_ios,
                                size: 20, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 220.h,
                ),
                InkWell(
                  onTap: () async {
                    final FirebaseAuth _auth = FirebaseAuth.instance;
                    await _auth.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login_Page()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.r)),
                        height: 40.h,
                        width: 230.w,
                        child: Center(
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
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
