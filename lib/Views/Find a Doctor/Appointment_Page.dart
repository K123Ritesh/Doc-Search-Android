import 'package:doc_search/Models/Appointment_Model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../Providers/Doctor_Provider.dart';

class Testing_Page extends StatelessWidget {
  const Testing_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final docProvider = Provider.of<Doctor_Provider>(context);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                docProvider.getDocByCity(context, 'kolkata', 'Dentist');
              },
              child: Text(
                'Doctor List in a Area',
                style: TextStyle(fontSize: 21),
              )),
          ElevatedButton(
              onPressed: () {
                docProvider.bookAppointment(
                    context,
                    Appointment_Model(
                        date_for_booking: '13/10/2023',
                        mode_of_payment: 'online',
                        self: true,
                        reg_fee: '800',
                        paid: true,
                        doctorId: 'doctorId',
                        slot: '9:00 -11:00',
                        userId: 'userId'));
                        
              },
              child: Text(
                'Book a Appointment',
                style: TextStyle(fontSize: 21),
              )),
        ],
      )),
    );
  }
}
