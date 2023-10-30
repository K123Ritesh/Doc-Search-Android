import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/Doctor_Provider.dart';
import 'Doctor_Category_Wise_Details.dart';

class Doctors_Category_Wise extends StatefulWidget {
  const Doctors_Category_Wise(
      {super.key, required this.doc_Category, required this.default_city});

  final String doc_Category;

  final String default_city;

  @override
  State<Doctors_Category_Wise> createState() => _Doctors_Category_WiseState();
}

class _Doctors_Category_WiseState extends State<Doctors_Category_Wise> {
  @override
  void initState() {
    Provider.of<Doctor_Provider>(context, listen: false)
        .getDocByCity(context, 'kolkata', 'Dentist');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DoctorProvider = Provider.of<Doctor_Provider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const Appointment1()),
            // );
            Navigator.pop(context);
          },
        ),
        title: Container(
          margin: const EdgeInsets.only(left: 80),
          child: Text(
            widget.doc_Category,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: DoctorProvider.isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : DoctorProvider.acc_to_search == null
              ? Center(
                  child: Text('No Doctors Found'),
                )
              : ListView.builder(
                  itemCount: DoctorProvider.acc_to_search!.length,
                  itemBuilder: (context, index) {
                    // final doctor = Doctors_Category_Wise[index];
                    return Container(
                      height: 230,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  // You can add the image here
                                  // backgroundImage: NetworkImage('URL'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(DoctorProvider.acc_to_search![index].name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 60),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "MBBS,MCh",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 180,
                                      ),
                                      Container(
                                        width: 41,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF1A6A83),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.white,
                                              size: 12,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              DoctorProvider
                                                  .acc_to_search![index].rating,
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 95,
                                    height: 19,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Color(0xFFE6F7EF),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${DoctorProvider.acc_to_search![index].specialization}",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFF00B05B),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                      '${DoctorProvider.acc_to_search![index].address}',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black)),
                                  Text(
                                      '${DoctorProvider.acc_to_search![index].experience} years experience',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              // margin: EdgeInsets.only(top: 62),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                          '${DoctorProvider.acc_to_search![index].sitting_days[0]},${DoctorProvider.acc_to_search![index].sitting_days[1]}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text(
                                          DoctorProvider
                                              .acc_to_search![index].reg_fee,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text('10:00 AM - 04:00 PM',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text('No Booking fee',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Doctors_Category_WiseDetails(
                                                  doctor: DoctorProvider
                                                      .acc_to_search![index],
                                                )),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF1A6A83),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Container(
                                      height: 42,
                                      width: 302,
                                      child: Center(
                                        child: Text(
                                          'Book an appointment',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
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
    );
  }
}
