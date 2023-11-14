import 'package:doc_search/Bottom_Bar.dart';
import 'package:doc_search/Config/sizeConfig.dart';
import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:doc_search/Views/Patient%20Part/Appointment/Appointment.dart';
import 'package:doc_search/Views/Patient%20Part/Appointment/View_Details_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Doctors/Doctors_Category_Wise.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Profile_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PastAppointment extends StatefulWidget {
  const PastAppointment({super.key});

  @override
  State<PastAppointment> createState() => _PastAppointmentState();
}

class _PastAppointmentState extends State<PastAppointment>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = 0;
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  String getTimeAndSlot(String date, String slot) {
    String time_and_slot = "";
    List<String> dateParts =
        date.split('/'); // Split the string by the '/' character

    if (dateParts.length == 3) {
      List<int> dateIntegers = dateParts.map((part) {
        int? parsedInt = int.tryParse(part);
        if (parsedInt != null) {
          return parsedInt;
        } else {
          throw FormatException("Invalid date part: $part");
        }
      }).toList();

      time_and_slot =
          'On ${dateIntegers[0]} ${months[dateIntegers[1] - 1]} ${dateIntegers[2]} $slot';
    } else {
      print("Invalid date format. Please use 'dd/mm/yyyy' format.");
    }
    return time_and_slot;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context);
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          elevation: 100,
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Appointment1()),
            );
          },
          child: Icon(
            Icons.add,
            size: 49,
          )),
      bottomNavigationBar: Bottombar(SelectedIndex: 1),
      backgroundColor: const Color(0xFF1A6A83),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF1A6A83),
      //   elevation: 0,
      //   // leading: IconButton(
      //   //   icon: const Icon(Icons.arrow_back_ios_new),
      //   //   onPressed: () {
      //   //     Navigator.push(
      //   //       context,
      //   //       MaterialPageRoute(
      //   //           builder: (context) => Profile_Page_Doc_Search()),
      //   //     );
      //   //   },
      //   // ),
      //   title:
      // ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(
                    top: 40.h,
                  ),
                  child: const Text(
                    'Appointments',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            height: 25,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF155467),
            ),
            child: TabBar(
              controller: _tabController,
              tabs: [
                buildTab("Past", 0),
                buildTab("Today", 1),
                buildTab("Upcoming", 2),
              ],
              indicatorColor: Colors.transparent,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    userProvider.pastAppointmentModel.length == 0
                        ? Text(
                            'NO APPOINTMENT',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )
                        : Text(
                            '${userProvider.pastAppointmentModel.length} APPOINTMENT',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: Divider(
                        height: 0,
                        color: Colors.grey,
                      ),
                    ),
                    userProvider.isLoadingPastAppointmentModel == true
                        ? CircularProgressIndicator()
                        : Expanded(
                            child: ListView.builder(
                              itemCount:
                                  userProvider.pastAppointmentModel.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 182.fh,
                                  margin: EdgeInsets.only(
                                      left: 20.fw, right: 20.fw, top: 20.fh),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, right: 30, left: 30),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getTimeAndSlot(
                                                        userProvider
                                                            .pastAppointmentModel[
                                                                index]
                                                            .date_for_booking,
                                                        userProvider
                                                            .pastAppointmentModel[
                                                                index]
                                                            .slot),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0XFF005473)),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Next appointment is on',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0XFF212427)),
                                                  ),
                                                  Text(
                                                    'October 30, 4:30 PM',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0XFF005473)),
                                                  ),
                                                  Text(
                                                    'Dentist',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0XFFFBBC05)),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    userProvider
                                                        .pastAppointmentModel[
                                                            index]
                                                        .doctor_name,
                                                    style: TextStyle(
                                                        fontSize: 10.3,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0XFF4D4E4F)),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    userProvider
                                                        .pastAppointmentModel[
                                                            index]
                                                        .doctor_address,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0XFF3F3F42)),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 57,
                                                    width: 57,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.blue,
                                                      // You can add the image here
                                                      // backgroundImage: NetworkImage('URL'),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    userProvider
                                                        .pastAppointmentModel[
                                                            index]
                                                        .doctor_qualification,
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                              ),
                                            ),
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 20,
                                                  left: 30,
                                                  top: 5,
                                                  bottom: 5),
                                              child: Column(
                                                children: [
                                                  Divider(
                                                    height: 0,
                                                    color: Color(0XFF005473),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          'Booked for ${userProvider.pastAppointmentModel[index].name}',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0XFF005473))),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        View_Details_Page()),
                                                          );
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary:
                                                              Color(0xFF1A6A83),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                        ),
                                                        child: Container(
                                                          height: 20.fh,
                                                          width: 107.fw,
                                                          child: Center(
                                                            child: Text(
                                                              'View Details',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      12.fh,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
                Column(
                  children: [
                    userProvider.todayAppointmentModel.length == 0
                        ? Text(
                            'NO APPOINTMENT',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )
                        : Text(
                            '${userProvider.todayAppointmentModel.length} APPOINTMENT',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: Divider(
                        height: 0,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: userProvider.todayAppointmentModel.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 182.fh,
                            margin: EdgeInsets.only(
                                left: 20.fw, right: 20.fw, top: 20.fh),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 20, right: 30, left: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getTimeAndSlot(
                                                  userProvider
                                                      .todayAppointmentModel[
                                                          index]
                                                      .date_for_booking,
                                                  userProvider
                                                      .todayAppointmentModel[
                                                          index]
                                                      .slot),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0XFF005473)),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Next appointment is on',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0XFF212427)),
                                            ),
                                            Text(
                                              'October 30, 4:30 PM',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0XFF005473)),
                                            ),
                                            Text(
                                              'Dentist',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0XFFFBBC05)),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              userProvider
                                                  .todayAppointmentModel[index]
                                                  .doctor_name,
                                              style: TextStyle(
                                                  fontSize: 10.3,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0XFF4D4E4F)),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              userProvider
                                                  .todayAppointmentModel[index]
                                                  .doctor_address,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0XFF3F3F42)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 57,
                                              width: 57,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.blue,
                                                // You can add the image here
                                                // backgroundImage: NetworkImage('URL'),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              userProvider
                                                  .todayAppointmentModel[index]
                                                  .doctor_qualification,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        ),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 20,
                                            left: 30,
                                            top: 5,
                                            bottom: 5),
                                        child: Column(
                                          children: [
                                            Divider(
                                              height: 0,
                                              color: Color(0XFF005473),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    'Booked for ${userProvider.todayAppointmentModel[index].name}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0XFF005473))),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //       builder: (context) => const DoctorsDetails()),
                                                    // );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF1A6A83),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    height: 20.fh,
                                                    width: 107.fw,
                                                    child: Center(
                                                      child: Text(
                                                        'View Details',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12.fh,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    userProvider.upcomingAppointmentModel.length == 0
                        ? Text(
                            'NO APPOINTMENT',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )
                        : Text(
                            '${userProvider.upcomingAppointmentModel.length} APPOINTMENT',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: Divider(
                        height: 0,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: userProvider.upcomingAppointmentModel.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 182.fh,
                            margin: EdgeInsets.only(
                                left: 20.fw, right: 20.fw, top: 20.fh),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 20, right: 30, left: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getTimeAndSlot(
                                                  userProvider
                                                      .upcomingAppointmentModel[
                                                          index]
                                                      .date_for_booking,
                                                  userProvider
                                                      .upcomingAppointmentModel[
                                                          index]
                                                      .slot),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0XFF005473)),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Next appointment is on',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0XFF212427)),
                                            ),
                                            Text(
                                              'October 30, 4:30 PM',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0XFF005473)),
                                            ),
                                            Text(
                                              'Dentist',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0XFFFBBC05)),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              userProvider
                                                  .upcomingAppointmentModel[
                                                      index]
                                                  .doctor_name,
                                              style: TextStyle(
                                                  fontSize: 10.3,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0XFF4D4E4F)),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              userProvider
                                                  .upcomingAppointmentModel[
                                                      index]
                                                  .doctor_address,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0XFF3F3F42)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 57,
                                              width: 57,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.blue,
                                                // You can add the image here
                                                // backgroundImage: NetworkImage('URL'),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              userProvider
                                                  .upcomingAppointmentModel[
                                                      index]
                                                  .doctor_qualification,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        ),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 20,
                                            left: 30,
                                            top: 5,
                                            bottom: 5),
                                        child: Column(
                                          children: [
                                            Divider(
                                              height: 0,
                                              color: Color(0XFF005473),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    'Booked for ${userProvider.upcomingAppointmentModel[index].name}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0XFF005473))),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //       builder: (context) => const DoctorsDetails()),
                                                    // );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF1A6A83),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    height: 20.fh,
                                                    width: 107.fw,
                                                    child: Center(
                                                      child: Text(
                                                        'View Details',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12.fh,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Bottombar(),
    );
  }

  Widget buildTab(String text, int tabIndex) {
    return Container(
      height: 25,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: _tabController.index == tabIndex
            ? Colors.white
            : const Color(0xFF155467),
      ),
      child: GestureDetector(
        onTap: () {
          _tabController.index = tabIndex;
        },
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: _tabController.index == tabIndex
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
