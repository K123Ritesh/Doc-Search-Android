import 'package:doc_search/Bottom_Bar.dart';
import 'package:doc_search/Views/Patient%20Part/Doctors/Doctors_Category_Wise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Appointment/Appointment.dart';
import '../Appointment/doctor1.dart';

class Appointments_Page extends StatefulWidget {
  const Appointments_Page({super.key});

  @override
  State<Appointments_Page> createState() => _Appointments_PageState();
}

class _Appointments_PageState extends State<Appointments_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Bottombar(SelectedIndex: 3),
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
                      width: 70.w,
                    ),
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
                Image.network(
                  "https://s3-alpha-sig.figma.com/img/cfd8/35bd/05a979e390cb6b79b4669331c59b7c23?Expires=1699228800&Signature=DUSCUbtdphkTq0dIB6RN3j-aorZVB1KuL2Eqx9h~3p3NuVw7bxYrYZ7h04eLQeqJ40wEGTERYhkCbYRodNu3kOgIMVUmbfkYPxTVePM7~86xNUkmbDmeq8OtcXFzTdVBO-bMnzg~4~Tm1SolP8h0Q3eqcjGieFJtGUw79dYP0na~MkvYkiqm~JFTeQjiU5W4YltFK-jSMNhMKvBLRtHU8PKKEHUtvfbWlvI6BNQ3DKcoPkNgaLXZTNiNlwyDCkRiLBQQIgt69cpwc3GEDsyu5n7~kiSzvjjGHRI8DBJCShWf~EVEj9yflzzkdzVHHlyzKeI7P8Rh34fQkdpq9-LxUQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
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
                                  default_city: 'Kolkata')),
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
