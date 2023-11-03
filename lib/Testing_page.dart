// import 'package:doc_search/Models/Appointment_Model.dart';
// import 'package:doc_search/Providers/Doctor_Provider.dart';
// import 'package:doc_search/Providers/User_Provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Testing_Widget extends StatefulWidget {
//   const Testing_Widget({super.key});

//   @override
//   State<Testing_Widget> createState() => _Testing_WidgetState();
// }

// class _Testing_WidgetState extends State<Testing_Widget> {
//   @override
//   Widget build(BuildContext context) {
//     final UserProvider = Provider.of<User_Provider>(context);
//     return Scaffold(
//       appBar: AppBar(
//           // title: Text('Testing Page'),
//           ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//                 child: Column(
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       UserProvider.getUserDetails(context, '+919905411917');
//                     },
//                     child: Text('Get user details')),
//                 ElevatedButton(
//                     onPressed: () {
//                       UserProvider.getIdforToday(
//                           context, UserProvider.user!.appointments);
//                       print('Present :::- ${UserProvider.todayAppointmentId}');

//                       UserProvider.getIdforYesterday(
//                           context, UserProvider.user!.appointments);
//                       print('Past :::- ${UserProvider.pastAppointmentId}');
//                       UserProvider.getIdforTommorow(
//                           context, UserProvider.user!.appointments);

//                       print(
//                           'Future :::- ${UserProvider.upcomingAppointmentId}');
//                     },
//                     child: Text('get today appointments')),
//               ],
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
