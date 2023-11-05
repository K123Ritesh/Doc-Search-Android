import 'package:doc_search/Views/Patient%20Part/Profile/Health_Care_Plan_Detailed_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Bottom_Bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Health_Care_Plan extends StatefulWidget {
  const Health_Care_Plan({super.key});

  @override
  State<Health_Care_Plan> createState() => _Health_Care_PlanState();
}

class _Health_Care_PlanState extends State<Health_Care_Plan> {
  int selectedIndex = 0;

  List<String> details = [
    '1. Experience continuous care with unlimited consultations\n\n2. No shipping charges on order above   Rs 149\n\n3. 24/7 access to doctors across all specialties\n\n4. Video consultations for clinic-like experience\n\n5. Same day delivery on the available medicine (Within 1 Hour)',
    '1. Experience continuous care with unlimited consultations\n\n2. No shipping charges on order above   Rs 149\n\n3. 24/7 access to doctors across all specialties\n\n4. Video consultations for clinic-like experience\n\n5. Same day delivery on the available medicine (Within 1 Hour)',
    '1. Experience continuous care with unlimited consultations\n\n2. No shipping charges on order above   Rs 149\n\n3. 24/7 access to doctors across all specialties\n\n4. Video consultations for clinic-like experience\n\n5. Same day delivery on the available medicine (Within 1 Hour)',
    '1. Experience continuous care with unlimited consultations\n\n2. No shipping charges on order above   Rs 149\n\n3. 24/7 access to doctors across all specialties\n\n4. Video consultations for clinic-like experience\n\n5. Same day delivery on the available medicine (Within 1 Hour)',
  ];
  List<String> premium_type = [
    'Bronze Plan(Yearly)',
    'Silver Plan(Yearly)',
    'Golden Plan(Yearly)',
    'Diamond Plan(Yearly)'
  ];

  List<String> amount = ['₹999/Year', '₹1999/Year', '₹2999/Year', '₹3999/Year'];
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Bottombar(SelectedIndex: 3),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
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
                        color: Colors.black, size: 26),
                  ),
                  SizedBox(
                    width: 70.w,
                  ),
                  Text(
                    'Health Care Plans',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFF155467),
                child: Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.0.w),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Color.fromARGB(255, 58, 176, 255)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0.w, vertical: 7.0.h),
                              child: Text(
                                'Doc Search Plans',
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0.w),
                          child: Text(
                            'Become a DOC search members and \nReduce your medical Expenses',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: const Color.fromARGB(255, 255, 231, 14)),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0.w),
                          child: Text(
                            'Save the things that makes you happy',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0.w),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: Color.fromARGB(255, 1, 71, 118)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0.w, vertical: 7.0.h),
                              child: Text(
                                'Explore',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Image.network(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 180.h,
                        fit: BoxFit.fill,
                        'https://s3-alpha-sig.figma.com/img/4d9e/cabd/c149c67687cf1082c190a6b63deade16?Expires=1699833600&Signature=W3eKZjtVByt~TpLcc9K6oO5IAd2OkkMeSPbKUoFG3fKLd8fU0P1pLRtt88P6UQoR6aK3mn1MU10eKIwPZfud4etKZaCT24tL3fXmOzmvORlGus6mSKrQen03kdeP6FhlGV1P7F2S-Zw3M5IboIWYsQfr52iqsJS0IooW9u8jIkCVOkUL1dsSxMbd0dyQ7LowFTs2pT~4U7dDTedbDHCVtqfdkFhLWh1H18Q4tS1uCU~7mhnX3qOJO~LLmnlWKfBi7EvkwL8nh6DxTaGVJqMU~o5MXN9kOworNfnhqrZqEEudaHMiwW7GkDZNTtL-cvvbpyehSbIwFKUyeHHzl9S-2w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'),
                  )
                ]),
              ),
              SizedBox(
                height: 20.h,
              ),
              CarouselSlider(
                items: [
                  Container_for_Premium(
                    details: details[selectedIndex],
                    isSelected: selectedIndex == 0,
                    type: premium_type[selectedIndex],
                  ),
                  Container_for_Premium(
                    details: details[selectedIndex],
                    isSelected: selectedIndex == 1,
                    type: premium_type[selectedIndex],
                  ),
                  Container_for_Premium(
                    details: details[selectedIndex],
                    isSelected: selectedIndex == 2,
                    type: premium_type[selectedIndex],
                  ),
                  Container_for_Premium(
                    details: details[selectedIndex],
                    isSelected: selectedIndex == 3,
                    type: premium_type[selectedIndex],
                  ),
                ],
                options: CarouselOptions(
                  // height: 200.0, // Adjust the height as needed
                  aspectRatio: 7 / 9, // Adjust the aspect ratio as needed
                  viewportFraction:
                      0.8, // Adjust the visible portion of each widget
                  initialPage: selectedIndex,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false, // Disable auto-play
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      selectedIndex = index; // Store the current active index
                    });
                  },
                ),
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       for (int i = 0; i < 4; i++)
              //         InkWell(
              //           onTap: () {
              //             setState(() {
              //               selectedIndex = i;
              //             });
              //           },
              //           child: Container_for_Premium(
              //             details: details[i],
              //             isSelected: i == selectedIndex,
              //             type: premium_type[i],
              //           ),
              //         )
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 6.h),
                            child: Text(
                              amount[selectedIndex],
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Billed every 1 year',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 8, 91, 158)),
                            ),
                            Text(
                              '*',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            Health_Care_Plan_Detailed_Page()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 9.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Continue with Premium',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            )
                          ],
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ));
  }
}

class Container_for_Premium extends StatelessWidget {
  const Container_for_Premium(
      {super.key,
      required this.details,
      required this.type,
      required this.isSelected});

  final String details;
  final String type;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected == true
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 13.0.h),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(15.r)),
              child: Card(
                elevation: 30,
                shadowColor: Colors.black,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: const Color(0xFF155467),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 3.0.w, vertical: 8.0.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.w,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              type,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              '(Single Person',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20.sp,
                              ),
                            ),
                            Text(
                              ' )',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              'Benifits',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            details,
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.all(1.w),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: const Color(0xFF155467),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          type,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          '(Single Person',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          ' )',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          'Benifits',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                          details),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
