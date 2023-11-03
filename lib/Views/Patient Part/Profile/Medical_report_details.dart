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
            margin: const EdgeInsets.only(left: 70),
            child: const Text(
              'Medical Records',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
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
              SizedBox(
                height: 5,
              ),
              Text(
                'Vivek Sharma',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '27 Years',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'B-9 Vasnat Kunj New Delhi',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '+91 9876543210',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Disease:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 27,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Color(0XFFC2E6F3),
                    ),
                    child: Center(
                      child: Text("Red eyes and itchiness",
                          style: TextStyle(
                            fontSize: 10,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFFC2E6F3),
                ),
                child: Center(
                  child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Dolor hendrerit enim vitae est nulla.Lorem ipsum dolor sit amet consectetur. Dolor hendrerit enim vitae est nulla.Lorem ipsum dolor sit amet consectetur. Dolor hendrerit enim vitae est nulla.Lorem ipsum dolor sit amet consectetur.",
                          style: TextStyle(
                            fontSize: 12,
                          ))),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('6 Ways To Treat Eyes At Home',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text('Warm or cold compress',style: TextStyle(fontSize: 14,color: Colors.white)),
                    ],
                  ),
                  SizedBox(width: 40,),
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text('Artificial tears',style: TextStyle(fontSize: 14,color: Colors.white)),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text('Wear sunglasses',style: TextStyle(fontSize: 14,color: Colors.white)),
                    ],
                  ),
                  SizedBox(width: 80,),
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text('Clean your eye area',style: TextStyle(fontSize: 14,color: Colors.white)),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text('Use a Humidifier',style: TextStyle(fontSize: 14,color: Colors.white)),
                    ],
                  ),
                  SizedBox(width: 85,),
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text('Stay hydrated',style: TextStyle(fontSize: 14,color: Colors.white)),
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
