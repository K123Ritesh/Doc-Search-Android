import 'package:doc_search/Config/sizeConfig.dart';
import 'package:doc_search/Views/Doctor%20Part/Profile/Download_Records.dart';
import 'package:flutter/material.dart';


class MedicalRecord_Prescription extends StatefulWidget {
  const MedicalRecord_Prescription({super.key});

  @override
  State<MedicalRecord_Prescription> createState() =>
      _MedicalRecord_PrescriptionState();
}

class _MedicalRecord_PrescriptionState extends State<MedicalRecord_Prescription> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1B6A85),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B6A85),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
            margin: const EdgeInsets.only(left: 60),
            child: const Text(
              'Medical Records',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20.fw, right: 20.fw, bottom: 20.fh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                height: 5.fh,
              ),
              Text(
                'Vivek Sharma',
                style: TextStyle(
                    fontSize: 14.fh,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '27 Years',
                style: TextStyle(
                    fontSize: 14.fh,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'B-9 Vasnat Kunj New Delhi',
                style: TextStyle(
                    fontSize: 14.fh,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5.fh,
              ),
              Text(
                '+91 9876543210',
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
                      child: Text("",
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
                      child: Text("",
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
              SizedBox(height: 20,),
              Text('Drug Prescription',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Table(
                  defaultColumnWidth: FixedColumnWidth(92.0),
                  border: TableBorder.all(
                      color: Colors.white, style: BorderStyle.solid, width: 2),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text('Medicine',
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text('Strength',
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text('Dose',
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text('Duration',
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 17,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 17,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 17,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 17,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 17,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 17,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 17,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 17,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 17,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 17,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 17,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                      Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 17,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                    ]),
                  ],
                ),
              ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                onTap: () {
                  
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 48,
                        width: 145,
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Download_Records()));
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0XFF005473),
                            borderRadius: BorderRadius.circular(10)),
                        height: 48,
                        width: 145,
                        child: Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}
