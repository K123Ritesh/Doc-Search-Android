import 'package:doc_search/Models/Appointment_Model.dart';
import 'package:doc_search/Providers/Doctor_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Testing_Widget extends StatefulWidget {
  const Testing_Widget({super.key});

  @override
  State<Testing_Widget> createState() => _Testing_WidgetState();
}

class _Testing_WidgetState extends State<Testing_Widget> {
  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<Doctor_Provider>(context);
    return Scaffold(
      appBar: AppBar(
          // title: Text('Testing Page'),
          ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Appointment Fixed ',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     ElevatedButton(
      //         onPressed: () {
      //           doctorProvider.getDocByCity(context, 'kolkata', 'Dentist');
      //         },
      //         child: Text('Get Doctor in your city')),
      //     ElevatedButton(
      //         onPressed: () {
      //           doctorProvider.bookAppointment(
      //               context,
      //               Appointment_Model(
      //                   date_for_booking: '14/10/2023',
      //                   mode_of_payment: 'online',
      //                   self: true,
      //                   reg_fee: '800',
      //                   paid: true,
      //                   doctorId: 'drnk@gmail.com',
      //                   slot: '9:40 - 10:00',
      //                   userId: 'rit11@gmail.com'));
      //         },
      //         child: Text('Book Appointment'))
      //   ],
      // ),
    );
  }
}

class Appointment_Done_Page extends StatefulWidget {
  const Appointment_Done_Page({super.key});

  @override
  State<Appointment_Done_Page> createState() => _Appointment_Done_PageState();
}

class _Appointment_Done_PageState extends State<Appointment_Done_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back_ios_new,
                                    color: Colors.black, size: 26),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Text(
                                'Appointments',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 105,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Congrats!',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'The Appointment was successfully booked.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Go to Home Page',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Colors.blue)
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 6,
                                    ),
                                    child: Text('Close',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              )
                            ],
                          )
                        ]))))));
  }
}
