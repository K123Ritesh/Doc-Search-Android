import 'package:doc_search/Config/sizeConfig.dart';
import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Medical_report_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Profile_Page.dart';

class MedicalRecord extends StatefulWidget {
  const MedicalRecord({super.key});

  @override
  State<MedicalRecord> createState() => _MedicalRecordState();
}

class _MedicalRecordState extends State<MedicalRecord> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<User_Provider>(context);
    SizeConfig().init(context);
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
            margin: EdgeInsets.only(left: 60.fw),
            child: Text(
              'Medical Records',
              style: TextStyle(fontSize: 18.fh, fontWeight: FontWeight.w600),
            )),
      ),
      body: ListView.builder(
        itemCount: provider.pastAppointmentModel.length,
        itemBuilder: (context, index) {
          return Container(
            height: 89.fh,
            margin: EdgeInsets.only(left: 20.fw, top: 20.fh, right: 20.fw),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Container(
              margin: EdgeInsets.only(top: 10.fh),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 65.fh,
                      width: 65.fw,
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
                          provider.pastAppointmentModel[index].name,
                          style: TextStyle(
                              fontSize: 15.fh, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5.fh,
                        ),
                        Text(
                          '35 years',
                          style: TextStyle(
                              fontSize: 14.fh, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5.fh,
                        ),
                        Text(
                          '+91 8796383738',
                          style: TextStyle(
                              fontSize: 12.fh, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 98.fw,
                          height: 19.fh,
                          decoration: BoxDecoration(
                              color: Color(0XFFE6F7EF),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                              child: Text("Dentist",
                                  style: TextStyle(
                                      color: Color(0XFF00B05B),
                                      fontSize: 11.fh))),
                        ),
                        SizedBox(
                          height: 5.fh,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            provider.getMedicineLists(
                                context, provider.pastAppointmentId[index]);
                            print(provider.medicineLists);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MedicalReportDetails(
                                        user: provider.user,
                                        appointment_model: provider
                                            .pastAppointmentModel[index],
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1A6A83),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Container(
                            height: 28.fh,
                            width: 90.fw,
                            child: Center(
                              child: Text(
                                'Medical Report',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.fh,
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
