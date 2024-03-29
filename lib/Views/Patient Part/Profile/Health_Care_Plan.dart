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
    'Gold Plan(Yearly)',
    'Platinum Plan(Yearly)'
  ];

  List<String> person_type = [
    'Single Person',
    'Couples',
    'Couple + Kids',
    'Gold Plan + Parents'
  ];

  List<Widget> page_to_open = [
    Bronze_Plan_Detailed(),
    Silver_Plan_detailed(),
    Gold_Plan_Detailed(),
    Platinum_Plan_Detailed()
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
                height: 10.h,
              ),
              Container(
                height: 129.h,
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
                          padding: EdgeInsets.only(top:10.0.h,left: 10.w),
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
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0.w),
                          child: Text(
                            'Become a DOC search members and \nReduce your medical Expenses',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                                color: const Color.fromARGB(255, 255, 231, 14)),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0.w),
                          child: Text(
                            'Save the things that makes you happy',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0.w),
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
                                    fontSize: 10.sp,
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
                    child: Image.asset(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 180.h,
                        fit: BoxFit.fill,
                        'assets/image 67.png'),
                  )
                ]),
              ),
              SizedBox(
                height: 10.h,
              ),
              CarouselSlider(
                items: [
                  Container_for_Premium(
                    person_type: person_type[selectedIndex],
                    details: details[selectedIndex],
                    isSelected: selectedIndex == 0,
                    type: premium_type[selectedIndex],
                  ),
                  Container_for_Premium(
                    person_type: person_type[selectedIndex],
                    details: details[selectedIndex],
                    isSelected: selectedIndex == 1,
                    type: premium_type[selectedIndex],
                  ),
                  Container_for_Premium(
                    person_type: person_type[selectedIndex],
                    details: details[selectedIndex],
                    isSelected: selectedIndex == 2,
                    type: premium_type[selectedIndex],
                  ),
                  Container_for_Premium(
                    person_type: person_type[selectedIndex],
                    details: details[selectedIndex],
                    isSelected: selectedIndex == 3,
                    type: premium_type[selectedIndex],
                  ),
                ],
                options: CarouselOptions(
                  // height: 500.0, // Adjust the height as needed
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
                        builder: (context) => page_to_open[selectedIndex]));
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
      required this.isSelected,
      required this.person_type});

  final String details;
  final String type;
  final bool isSelected;

  final String person_type;

  @override
  Widget build(BuildContext context) {
    return isSelected == true
        ? Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(15.r)),
          child: Container(
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
                            '($person_type',
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
                  borderRadius: BorderRadius.circular(15.r)),
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
                              fontSize: 14.sp,
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
