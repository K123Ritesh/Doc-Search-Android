import 'package:doc_search/Config/sizeConfig.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/MedicalOrder.dart';
import 'package:flutter/material.dart';

class MedicalReportDetails extends StatefulWidget {
  const MedicalReportDetails({super.key});

  @override
  State<MedicalReportDetails> createState() => _MedicalReportDetailsState();
}

class _MedicalReportDetailsState extends State<MedicalReportDetails> {
  @override
  Widget build(BuildContext context) {
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
            child:  Text(
              'Medical Records',
              style: TextStyle(fontSize: 18.fh, fontWeight: FontWeight.w600),
            )),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left:20.fw,right: 20.fw,bottom: 20.fh),
          child: Column(
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
                  SizedBox(width: 10.fw,),
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
                          style: TextStyle(fontSize: 13.fh, color: Colors.white)),
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
                          style: TextStyle(fontSize: 13.fh, color: Colors.white)),
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
                          style: TextStyle(fontSize: 13.fh, color: Colors.white)),
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
                          style: TextStyle(fontSize: 13.fh, color: Colors.white)),
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
                          style: TextStyle(fontSize: 13.fh, color: Colors.white)),
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
                          style: TextStyle(fontSize: 13.fh, color: Colors.white)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
