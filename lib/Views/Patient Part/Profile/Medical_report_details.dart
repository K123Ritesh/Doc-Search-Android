import 'package:doc_search/Config/sizeConfig.dart';
import 'package:doc_search/Models/Models_For_Patient_Part/Appointment_Model.dart';
import 'package:doc_search/Models/Models_For_Patient_Part/User_Model.dart';
import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/MedicalOrder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MedicalReportDetails extends StatefulWidget {
  MedicalReportDetails(
      {super.key, required this.user, required this.appointment_model});

  final PatientUser user;
  final Appointment_Model appointment_model;

  @override
  State<MedicalReportDetails> createState() => _MedicalReportDetailsState();
}

class _MedicalReportDetailsState extends State<MedicalReportDetails> {
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
              MaterialPageRoute(builder: (context) => MedicalRecord()),
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
      body: Container(
        margin: EdgeInsets.only(
          left: 20.fw,
          right: 20.fw,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 65.fh,
                width: 65.fw,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    size: 55,
                  ),
                ),
              ),
              SizedBox(
                height: 5.fh,
              ),
              Text(
                widget.appointment_model.name,
                style: TextStyle(
                    fontSize: 14.fh,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${widget.user.age} Years',
                style: TextStyle(
                    fontSize: 14.fh,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.user.address,
                style: TextStyle(
                    fontSize: 14.fh,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5.fh,
              ),
              Text(
                widget.user.mobileNo,
                style: TextStyle(
                    fontSize: 14.fh,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10.fw,
                  ),
                  Text(
                    'Disease:',
                    style: TextStyle(
                        fontSize: 18.fh,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 10.fw,
                  ),
                  Container(
                    height: 27.fh,
                    width: 150.fw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Color(0XFFC2E6F3),
                    ),
                    child: Center(
                      child: Text("Red eyes and itchiness",
                          style: TextStyle(
                            fontSize: 10.fh,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.fh,
              ),
              Container(
                height: 100.fh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFFC2E6F3),
                ),
                child: Center(
                  child: Container(
                      margin: EdgeInsets.only(left: 20.fw, right: 20.fw),
                      child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Dolor hendrerit enim vitae est nulla.Lorem ipsum dolor sit amet consectetur. Dolor hendrerit enim vitae est nulla.Lorem ipsum dolor sit amet consectetur. Dolor hendrerit enim vitae est nulla.Lorem ipsum dolor sit amet consectetur.",
                          style: TextStyle(
                            fontSize: 12.fh,
                          ))),
                ),
              ),
              SizedBox(
                height: 10.fh,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '6 Ways To Treat Eyes At Home',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 20.fh,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 11.fh,
                        width: 12.fw,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      SizedBox(
                        width: 5.fw,
                      ),
                      Text('Warm or cold compress',
                          style:
                              TextStyle(fontSize: 13.fh, color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    width: 20.fw,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 11.fh,
                        width: 12.fw,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      SizedBox(
                        width: 5.fw,
                      ),
                      Text('Artificial tears',
                          style:
                              TextStyle(fontSize: 13.fh, color: Colors.white)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.fh,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 11.fh,
                        width: 12.fw,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      SizedBox(
                        width: 5.fw,
                      ),
                      Text('Wear sunglasses',
                          style:
                              TextStyle(fontSize: 13.fh, color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    width: 64.fw,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 11.fh,
                        width: 12.fw,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      SizedBox(
                        width: 5.fw,
                      ),
                      Text('Clean your eye area',
                          style:
                              TextStyle(fontSize: 13.fh, color: Colors.white)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.fh,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 11.fh,
                        width: 12.fw,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      SizedBox(
                        width: 5.fw,
                      ),
                      Text('Use a Humidifier',
                          style:
                              TextStyle(fontSize: 13.fh, color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    width: 68.fw,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 11.fh,
                        width: 12.fw,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      SizedBox(
                        width: 5.fw,
                      ),
                      Text('Stay hydrated',
                          style:
                              TextStyle(fontSize: 13.fh, color: Colors.white)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Drug Prescription',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              for (int i = 1; i < provider.medicineLists.length; i++)
                Medicine_Card(
                  doses: provider.medicineLists[i]['Dose'],
                  duration: provider.medicineLists[i]['Duration'],
                  medicineName: provider.medicineLists[i]['Medicine Name'],
                  strength: provider.medicineLists[i]['Strength'],
                ),
              provider.medicineLists.length == 1
                  ? Text('Noting to show')
                  : SizedBox(
                      height: 30,
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class Medicine_Card extends StatelessWidget {
  Medicine_Card(
      {super.key,
      required this.medicineName,
      required this.doses,
      required this.duration,
      required this.strength});

  final String medicineName;
  final String doses;
  final String duration;
  final String strength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Card(
          // color: Colors.white,
          elevation: 50,
          shadowColor: Color(0xFF1A6A83),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      medicineName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A6A83)),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Strength:-',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A6A83)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      strength,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1A6A83)),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Doses:-',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A6A83)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      doses,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1A6A83)),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Duration:-',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A6A83)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      duration,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1A6A83)),
                    )
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
