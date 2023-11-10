import 'package:doc_search/Config/sizeConfig.dart';
import 'package:doc_search/Providers/Doctor_Part_Provider/Patient_And_Appointment_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Medical_report_Prescription.dart';

class Doctor_MedicalRecord extends StatefulWidget {
  const Doctor_MedicalRecord({super.key});

  @override
  State<Doctor_MedicalRecord> createState() => _Doctor_MedicalRecordState();
}

class _Doctor_MedicalRecordState extends State<Doctor_MedicalRecord> {
  @override
  Widget build(BuildContext context) {
    final details = Provider.of<Patient_And_Appointment_Provider>(context);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1A6A83),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A6A83),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
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
        itemCount: details.appointmentDetails!.length,
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
                        child:
                            details.appointmentedUsers![index].profilePicUrl ==
                                    " "
                                ? Icon(
                                    Icons.person,
                                    color: Colors.red,
                                    size: 70,
                                  )
                                : ClipOval(
                                    child: Image.network(
                                      details.appointmentedUsers![index]
                                          .profilePicUrl,
                                      width: 90.0.w,
                                      height: 90.0.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          details.appointmentedUsers![index].firstName,
                          style: TextStyle(
                              fontSize: 15.fh, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5.fh,
                        ),
                        Text(
                          '${details.appointmentedUsers![index].age} Years',
                          style: TextStyle(
                              fontSize: 14.fh, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5.fh,
                        ),
                        Text(
                          details.appointmentedUsers![index].mobileNo,
                          style: TextStyle(
                              fontSize: 12.fh, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MedicalRecord_Prescription(
                                        patient:
                                            details.appointmentedUsers![index],
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF1A6A83),
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
