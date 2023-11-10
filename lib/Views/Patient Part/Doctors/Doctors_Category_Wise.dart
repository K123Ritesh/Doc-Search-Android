import 'package:doc_search/Bottom_Bar.dart';
import 'package:doc_search/Config/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Providers/User_Part_Provider/Doctor_Provider.dart';
import 'Doctor_Category_Wise_Details.dart';

class Doctors_Category_Wise extends StatefulWidget {
  const Doctors_Category_Wise(
      {super.key,
      required this.title,
      required this.doc_Category,
      required this.default_city});

  final String doc_Category;
  final String title;
  final String default_city;

  @override
  State<Doctors_Category_Wise> createState() => _Doctors_Category_WiseState();
}

class _Doctors_Category_WiseState extends State<Doctors_Category_Wise> {
  @override
  void initState() {
    Provider.of<Doctor_Provider>(context, listen: false)
        .getDocByCity(context, widget.default_city, widget.doc_Category);
    super.initState();
  }

  int ans = 1;
  TextEditingController city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));

    final DoctorProvider = Provider.of<Doctor_Provider>(context);
    SizeConfig().init(context);
    return Scaffold(
        bottomNavigationBar: Bottombar(SelectedIndex: 0),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
            margin: EdgeInsets.only(left: 80.fw),
            child: Text(
              widget.doc_Category,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.fh,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 18.fw, vertical: 5.fh),
                child: Container(
                  height: 50.fh,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF5793A8), width: 1.0),
                      borderRadius: BorderRadius.circular(50)),
                  child: TextFormField(
                    controller: city,
                    // initialValue: ,
                    onChanged: (value) {
                      // setState(() {
                      //   //   city.text = value.toString();
                      //   title = "${widget.doc_Category} in ${value}";
                      // });
                      DoctorProvider.getDocByCity(
                          context, value, widget.doc_Category);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none, // Remove the default border
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search doctors in your area',
                    ),
                  ),
                ),
              ),
              DoctorProvider.isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : DoctorProvider.acc_to_search == null
                      ? Center(
                          child: Text(
                            'No ${widget.doc_Category} Found in ${city.text}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: DoctorProvider.acc_to_search!.length,
                            itemBuilder: (context, index) {
                              // final doctor = Doctors_Category_Wise[index];
                              return Container(
                                height: 220.fh,
                                margin: EdgeInsets.all(20.fw),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10.fh,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10.fw,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            child: DoctorProvider
                                                        .acc_to_search![index]
                                                        .profile_pic ==
                                                    ' '
                                                ? Icon(Icons.person)
                                                : ClipOval(
                                                    child: Image.network(
                                                      DoctorProvider
                                                          .acc_to_search![index]
                                                          .profile_pic,
                                                      width: 60.0.w,
                                                      height: 60.0.h,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                            // maxRadius: 30.r,
                                          ),
                                          SizedBox(
                                            width: 10.fw,
                                          ),
                                          Text(
                                              DoctorProvider
                                                  .acc_to_search![index].name,
                                              style: TextStyle(
                                                  fontSize: 15.fh,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 60.fw),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "MBBS,MCh",
                                                  style: TextStyle(
                                                      fontSize: 13.fh,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  width: 140.fw,
                                                ),
                                                Container(
                                                  width: 41.fw,
                                                  height: 16.fh,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF1A6A83),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.white,
                                                        size: 12.fh,
                                                      ),
                                                      SizedBox(
                                                        width: 4.fw,
                                                      ),
                                                      Text(
                                                        DoctorProvider
                                                            .acc_to_search![
                                                                index]
                                                            .rating,
                                                        style: TextStyle(
                                                          fontSize: 11.fh,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 2.fh,
                                            ),
                                            Container(
                                              width: 95.fw,
                                              height: 19.fh,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: Color(0xFFE6F7EF),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "${DoctorProvider.acc_to_search![index].specialization}",
                                                  style: TextStyle(
                                                    fontSize: 9.fh,
                                                    color: Color(0xFF00B05B),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.fh,
                                            ),
                                            Text(
                                                '${DoctorProvider.acc_to_search![index].address}',
                                                style: TextStyle(
                                                    fontSize: 11.fh,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black)),
                                            SizedBox(
                                              height: 2.fh,
                                            ),
                                            Text(
                                                '${DoctorProvider.acc_to_search![index].experience} years experience',
                                                style: TextStyle(
                                                    fontSize: 11.fh,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black)),
                                            SizedBox(
                                              height: 4.fh,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        // margin: EdgeInsets.only(top: 62),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade400),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 8.fh,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 20.fw,
                                                ),
                                                Text(
                                                    '${DoctorProvider.acc_to_search![index].sitting_days[0]},${DoctorProvider.acc_to_search![index].sitting_days[1]}',
                                                    style: TextStyle(
                                                        fontSize: 13.fh,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black)),
                                                SizedBox(
                                                  width: 90.fw,
                                                ),
                                                Text(
                                                    DoctorProvider
                                                        .acc_to_search![index]
                                                        .reg_fee,
                                                    style: TextStyle(
                                                        fontSize: 13.fh,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.fh,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 20.fw,
                                                ),
                                                Text('10:00 AM - 04:00 PM',
                                                    style: TextStyle(
                                                        fontSize: 13.fh,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black)),
                                                SizedBox(
                                                  width: 50.fw,
                                                ),
                                                Text('No Booking fee',
                                                    style: TextStyle(
                                                        fontSize: 13.fh,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.fh,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Doctors_Category_WiseDetails(
                                                            doctor: DoctorProvider
                                                                    .acc_to_search![
                                                                index],
                                                            doc_category: widget
                                                                .doc_Category,
                                                          )),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(0xFF1A6A83),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              child: Container(
                                                height: 42.fh,
                                                width: 270.fw,
                                                child: Center(
                                                  child: Text(
                                                    'Book an appointment',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15.fh),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
            ],
          ),
        ));
  }
}
