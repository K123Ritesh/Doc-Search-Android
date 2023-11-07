import 'package:doc_search/Bottom_Bar.dart';
import 'package:doc_search/Providers/User_Provider.dart';
import 'package:doc_search/Views/Patient%20Part/Doctors/Doctors_Category_Wise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Appointments_Page extends StatefulWidget {
  const Appointments_Page({super.key});

  @override
  State<Appointments_Page> createState() => _Appointments_PageState();
}

class _Appointments_PageState extends State<Appointments_Page> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Bottombar(SelectedIndex: 1),
        body: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF155467),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Column(children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Appointments',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Image.asset(
                  "assets/Icons/Calendar-bro 1.png",
                  height: 298.h,
                  width: 298.w,
                ),
                Text(
                  "You haven’t booked any appointments yet",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Start by looking for doctors near you",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Doctors_Category_Wise(
                                  title: 'Doctors',
                                  doc_Category: 'Dentist',
                                  default_city: userProvider.user.city)),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        height: 40.h,
                        width: 230.w,
                        child: Center(
                          child: Text(
                            'Book Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ]),
            )),
      ),
    );
  }
}
