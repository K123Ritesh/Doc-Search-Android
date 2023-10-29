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
        title: Text('Testing Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                doctorProvider.getDocByCity(context, 'kolkata', 'Dentist');
              },
              child: Text('Get Doctor in your city')),
          ElevatedButton(
              onPressed: () {
                doctorProvider.bookAppointment(
                    context,
                    Appointment_Model(
                        date_for_booking: '14/10/2023',
                        mode_of_payment: 'online',
                        self: true,
                        reg_fee: '800',
                        paid: true,
                        doctorId: 'drnk@gmail.com',
                        slot: '9:40 - 10:00',
                        userId: 'rit11@gmail.com'));
              },
              child: Text('Book Appointment'))
        ],
      ),
    );
  }
}
