import 'package:doc_search/Bottom_Bar.dart';
import 'package:doc_search/Views/Doctor%20Part/Home/Appointment_Patient_Details_Page.dart';
import 'package:doc_search/Views/Doctor%20Part/Profile/Online_Consultations_Page.dart';
import 'package:doc_search/Views/Doctor%20Part/Profile/Profile_Page.dart';
import 'package:doc_search/Views/Not_Build_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Home/Wallet_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Doctor_Home_Page extends StatefulWidget {
  const Doctor_Home_Page({super.key});

  @override
  State<Doctor_Home_Page> createState() => _Doctor_Home_PageState();
}

class _Doctor_Home_PageState extends State<Doctor_Home_Page> {
  final TextEditingController idController =
      TextEditingController(text: '583694');
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Doctor_Profile_Page()),
                  );
                },
                child: Container(
                  // margin: EdgeInsets.only(left: 10),
                  height: 50.h,
                  width: 50.w,
                  child: Icon(Icons.person, color: Colors.blue, size: 39),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: const Color.fromARGB(255, 111, 170, 219),
                  ),
                  // child: Image.asset('assets/your_image.png'),
                ),
              ),
              SizedBox(
                width: 200.w,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Wallet()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 83, 130, 211),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '100',
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
            child: Container(
              height: 50.h,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF5793A8), width: 1.0.w),
                  borderRadius: BorderRadius.circular(50.r)),
              child: TextField(
                // onTap: () {
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => Search_Tapped_Page()));
                // },
                decoration: InputDecoration(
                  border: InputBorder.none, // Remove the default border
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search settings and password...',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 10.w, right: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Not_Build_Page(
                                selectedIndex: 0,
                              )),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF5793A8)),
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          child: Image.asset(
                              'assets/DocSearch Android/Group 2412.png')),
                      SizedBox(
                        height: 12.h,
                      ),
                      const Text("Appointment"),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Online_Consultations_Page()),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF5793A8)),
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          child: Image.network(
                              'https://s3-alpha-sig.figma.com/img/ca83/f517/a1711ef1079e65044e1ca81a91dda52a?Expires=1699833600&Signature=nBKMa~60NKVEAdvpLtk3hG-Jt43LQy2QvN1vUr6JEkr8ao26GGNjxCQxKftYUQq9BJntb2qmoAOTYMJgnQ3pMFUU6hmaOQ5xJeo1VpYlNfun~-97BpFmeIWJYt0r-a6R8o6ruuxLNV7wiafhgXTYzhI0TWW9Lcu9~lKhz16VFx-qujYoDT9n23JAimEdfj~hoUJzr9jM0YMFzXa0hyVD4-zbml36~WiL4NDpPG~89olo7sORHuChRp1VBFiz2GcZ7oD6c~WghdtrRzQEOqiAnsjkUkYq8eExUI07jvg4ACbU2huKwgdZ9dMJnMq3FfnhBVEEuwj5pUHMTRJQOzW1SA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4')),
                      SizedBox(
                        height: 12.h,
                      ),
                      const Text("Consultancy"),
                    ],
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Not_Build_Page(
                                    selectedIndex: 0,
                                  )),
                        );
                      },
                      child: Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF5793A8)),
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          child: Image.network(
                              'https://s3-alpha-sig.figma.com/img/05ae/91cf/1f2bd01eb766e1b6be420ea42b641cfa?Expires=1699833600&Signature=JxvfmZVmnPIdYxfl2Xg7RyGFUcIi-jeuMkkKZpGOvWzVaKZFGh~uro2TsBlD6jSITXjoobPTexaPrAZpRLJPl~NJnUENsfYYpDPfjDgfhFUFA2HTvSNIor5bptqkG-TReNP-Du3ABFUgFS0TdODWM9UutMGn96ADci0vttdNeuZ-YRAnlrGWcN3KGJ3f88vsKdLbPfR4qHv6kiv2nJX9frNtQbnoWT0vYIvIoqdTpzDWoanr8QJeomUqwRU3E0CVxLMzWC11OXCCz4UmJ~JDmrJZV3G20x0Du8FRFBN7uFety6f5ocE2CYlzVsNZrEDMFkLZfzkYozKPi2Ffbnwh0Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4')),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const Text("Payments"),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Not_Build_Page(
                                    selectedIndex: 0,
                                  )),
                        );
                      },
                      child: Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF5793A8)),
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          child: Image.network(
                              'https://s3-alpha-sig.figma.com/img/ebf2/b8a0/5f5fe4a5447db00a8af20947840e8d10?Expires=1699833600&Signature=eYFPvshWH4Dsk9FnfKQtDiT2lMkBzGlAFIgMScltEytkExyU07PuXg8Y8wRSOmkQjTG~yyTmDWi98JyC1aHSr-W4H1kLc2GjtuEHMste1e7NiGNZ3TQIol71qgCe6IFyFKkP5k6bTiEFR6Swn~DRCibSgc2YJojzzvwjUHn9Cu0g1hI3n56f8wbQayuJVFaptDdkltuCJ0f66EA~RdmIUNl7n9ZFvNnoFSYMRcOimxh-LnfHjy2jMySfONQod5AkNmlIxo3FQnY7z-buWVipLfykQQ5tU9JoYO-FIgxiDJBaycObfMsUUGa8Am6xUfuMhOeEhR2koV8262e~M-viBA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4')),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const Text("Community"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 148.h,
            decoration: BoxDecoration(
              color: const Color(0xFFECFAFC),
              borderRadius: BorderRadius.circular(5.r),
              // border: Border.all(color: Color(0xFF5793A8)),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 20.w, top: 20.h),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'We are ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'providing',
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' the ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '\nbest ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'health',
                              style: TextStyle(
                                  color: Color(0xFF5793A8),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' services',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 20.w, top: 10.h),
                      child: Text(
                        'Always caring about your health, \nFind your doctors and make an \nappointment',
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1B3033)),
                      )),
                  Container(
                    height: 23.h,
                    width: 68.w,
                    margin: EdgeInsets.only(top: 10.h, right: 60.w),
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.r),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.r),
                          border:
                              Border.all(color: Color(0xFF005473), width: 2),
                        ),
                        child: InkWell(
                          onTap: () {
                            // Your button click logic here
                          },
                          child: Center(
                            child: Text(
                              'Register Now',
                              style: TextStyle(
                                fontSize: 8.sp,
                                color: Color(0xFF005473),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w, top: 20.h),
                height: 118.h,
                width: 167.w,
                child: Image.asset('assets/image 34.png'),
              ),
            ]),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              Text(
                'Appointment ID',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
            child: Container(
              height: 50.h,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF5793A8), width: 1.0),
                  borderRadius: BorderRadius.circular(50.r)),
              child: TextField(
                controller: idController,
                // onTap: () {
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => Search_Tapped_Page()));
                // },
                decoration: InputDecoration(
                  border: InputBorder.none, // Remove the default border
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search ID number...',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          AppointmentId_Searched()
        ],
      ),
      bottomNavigationBar: Bottombar(
        SelectedIndex: 0,
      ),
    );
  }
}

class AppointmentId_Searched extends StatelessWidget {
  const AppointmentId_Searched({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Appointment_Patient_Details_Page()));
        },
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFF155467),
              borderRadius: BorderRadius.circular(15.r)),
          child: Row(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(14.0.w),
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 50.r,
                      child: Icon(
                        Icons.person,
                        color: Colors.red,
                        size: 70,
                      )),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Id Number - ',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '583694             ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Name - ',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Ritesh Kumar           ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Age - ',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '18                                  ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Address - ',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Darbhanga ,Bihar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
