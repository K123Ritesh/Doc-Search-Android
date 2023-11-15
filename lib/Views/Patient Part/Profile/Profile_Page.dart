import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
// import 'package:doc_search/Views/Doctor%20Part/Profile/Online_Consultations_Page.dart';
import 'package:doc_search/Views/Not_Build_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Appointment/PastApointment.dart';
import 'package:doc_search/Views/Patient%20Part/Authentication/Login_Page.dart';
// import 'package:doc_search/Views/Patient%20Part/Doctors/Doctors_Category_Wise.dart';
// import 'package:doc_search/Views/Patient%20Part/Profile/Appointments_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Family_Tree_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Health_Care_Plan.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/My_order.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Online_Consultations_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Refer_And_Earn_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Settings_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Bottom_Bar.dart';
import 'Edit_User_Profile.dart';
import 'MedicalOrder.dart';

class Profile_Page_Doc_Search extends StatefulWidget {
  @override
  State<Profile_Page_Doc_Search> createState() =>
      _Profile_Page_Doc_SearchState();
}

class _Profile_Page_Doc_SearchState extends State<Profile_Page_Doc_Search> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: const Color(0xFF155467),
    ));

    final FirebaseAuth _auth = FirebaseAuth.instance;

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
                SizedBox(height: 33.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditUserProfile(
                                    gender: userProvider.user.gender,
                                  )));
                        },
                        child: Stack(
                          children: <Widget>[
                            CircleAvatar(
                              child: userProvider.user.profilePicUrl == ' '
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
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${userProvider.user.firstName} ${userProvider.user.lastName}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${userProvider.user.city.toUpperCase()}  |  ${userProvider.user.mobileNo}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => PastAppointment()));
                        },
                        child: ListTile(
                          title: Text(
                            "Appointments",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,
                              size: 20, color: Colors.white),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Online_Consultations_Page()),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "Online Consultations",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios,
                              size: 20, color: Colors.white),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Not_Build_Page(
                                      selectedIndex: 3,
                                    )),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "My Test",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,
                              size: 20, color: Colors.white),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MedicalRecord()),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "Medical Records",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,
                              size: 20, color: Colors.white),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          userProvider.getOrderDetails(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => My_Order()),
                          );
                        },
                        child: InkWell(
                          onTap: () {
                            userProvider.getOrderDetails(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => My_Order()),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              "Order History",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios,
                                size: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Health_Care_Plan()));
                        },
                        child: ListTile(
                          title: Text(
                            "Subscriptions",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,
                              size: 20, color: Colors.white),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Family_Tree_Page()),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "Family Tree",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,
                              size: 20, color: Colors.white),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Refer_And_Earn_Page()));
                        },
                        child: ListTile(
                          title: Text(
                            "Refer and Earn",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Refer_And_Earn_Page()));
                            },
                            child: Icon(Icons.arrow_forward_ios,
                                size: 20.sp, color: Colors.white),
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => Not_Build_Page(
                      //                 selectedIndex: 3,
                      //               )),
                      //     );
                      //   },
                      //   child: ListTile(
                      //     title: Text(
                      //       "Transactions",
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 20.sp,
                      //           fontWeight: FontWeight.w400),
                      //     ),
                      //     trailing: Icon(Icons.arrow_forward_ios,
                      //         size: 20, color: Colors.white),
                      //   ),
                      // ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Settings_Page()));
                        },
                        child: ListTile(
                          title: Text(
                            "Settings",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Settings_Page()));
                            },
                            child: Icon(Icons.arrow_forward_ios,
                                size: 20, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
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
