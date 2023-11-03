import 'package:doc_search/Views/Patient%20Part/Profile/Medical_report_details.dart';
import 'package:flutter/material.dart';

import 'Profile_Page.dart';

class MedicalRecord extends StatefulWidget {
  const MedicalRecord({super.key});

  @override
  State<MedicalRecord> createState() => _MedicalRecordState();
}

class _MedicalRecordState extends State<MedicalRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A6A83),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A6A83),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Profile_Page_Doc_Search()),
            );
          },
        ),
        title: Container(
            margin: const EdgeInsets.only(left: 85),
            child: const Text(
              'Medical Records',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            height: 89,
            margin: EdgeInsets.only(left: 20, top: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        // You can add the image here
                        // backgroundImage: NetworkImage('URL'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr.Vikas Sharma',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '35 years',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '+91 8796383738',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 98,
                          height: 19,
                          decoration: BoxDecoration(
                              color: Color(0XFFE6F7EF),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                              child: Text("Dentist",
                                  style: TextStyle(
                                      color: Color(0XFF00B05B), fontSize: 11))),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MedicalReportDetails()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF1A6A83),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Container(
                            height: 28,
                            width: 103,
                            child: Center(
                              child: Text(
                                'Medical Report',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
