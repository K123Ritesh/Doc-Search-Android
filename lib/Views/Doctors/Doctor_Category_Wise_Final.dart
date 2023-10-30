import 'package:doc_search/Models/Appointment_Model.dart';
import 'package:doc_search/Providers/Doctor_Provider.dart';
import 'package:doc_search/Testing_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Bottom_Bar.dart';

class Doctor_Category_Wise_Final extends StatefulWidget {
  const Doctor_Category_Wise_Final(
      {super.key, required this.slot, required this.date});

  final String slot;
  final String date;

  @override
  State<Doctor_Category_Wise_Final> createState() =>
      _Doctor_Category_Wise_FinalState();
}

class _Doctor_Category_Wise_FinalState
    extends State<Doctor_Category_Wise_Final> {
  bool isChecked = false;
  bool isBlue = false;
  void toggleColor() {
    setState(() {
      isBlue = !isBlue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final DoctorProvider = Provider.of<Doctor_Provider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const DoctorsDetails()),
            // );
            Navigator.pop(context);
          },
        ),
        title: Container(
            margin: const EdgeInsets.only(left: 80),
            child: const Text(
              'Doctors',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Container(
                child: ListTile(
                  leading: Container(
                    height: 65,
                    width: 65,
                    child: CircleAvatar(
                        // backgroundImage: NetworkImage(''),
                        ),
                  ),
                  title: Text(
                    "Dr. Priya Sharma",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "MBBS,MCh",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Container(
                            width: 41,
                            height: 16,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A6A83),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '4.7',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 95,
                              height: 19,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color(0xFFE6F7EF),
                              ),
                              child: Center(
                                child: Text(
                                  "Surgical Onotology",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF00B05B),
                                  ),
                                ),
                              ),
                            ),
                            Text('Malviya Nagar, New Delhi',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            Text('15 years experience',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text('Tues & Thu',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      SizedBox(
                        width: 100,
                      ),
                      Text('₹450',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text('10:00 AM - 04:00 PM',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      SizedBox(
                        width: 50,
                      ),
                      Text('No Booking fee',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                  Container(
                    height: 42,
                    width: 272,
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A6A83),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.call,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Center(
                            child: Text(
                          '+91 123456789',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    height: 42,
                    width: 272,
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A6A83),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.white,
                        ),
                        Center(
                            child: Text(
                          'Malviya Nagar, New Delhi',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    height: 42,
                    width: 272,
                    margin: const EdgeInsets.only(top: 15, bottom: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A6A83),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.mail,
                          size: 16,
                          color: Colors.white,
                        ),
                        Center(
                            child: Text(
                          'docsearch@gmail.com',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Patient Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 158,
              height: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFF1FDFF),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: toggleColor,
                    child: Container(
                      width: 16,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isBlue
                            ? const Color(0xFF1A6A83)
                            : Colors.transparent,
                        border: Border.all(
                          color: const Color(0xFF1A6A83),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Shiddhart sharma',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF1A6A83),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 158,
              height: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFF1FDFF),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: toggleColor,
                    child: Container(
                      width: 16,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isBlue
                            ? const Color(0xFF1A6A83)
                            : Colors.transparent,
                        border: Border.all(
                          color: const Color(0xFF1A6A83),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Shiddhart sharma',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF1A6A83),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Please provide following information ',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    // border: OutlineInputBorder(),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    // border: OutlineInputBorder(),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    // border: OutlineInputBorder(),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  Icon(
                    Icons.whatshot_outlined, // WhatsApp icon
                    color: Colors.green,
                    size: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'You can get updates on whatsapp\nnumber on 9876543210',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Container(
              height: 36,
              width: 155,
              // margin: EdgeInsets.only(top: 8),
              child: ElevatedButton(
                onPressed: () {
                  DoctorProvider.bookAppointment(
                      context,
                      Appointment_Model(
                          date_for_booking: widget.date,
                          mode_of_payment: 'online',
                          self: true,
                          reg_fee: '450',
                          paid: true,
                          doctorId: 'khn@gmail.com',
                          slot: widget.slot,
                          userId: 'rit11@gmail.com'));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Appointment_Done_Page()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF1A6A83),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Confirm Clinic Visit',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      bottomNavigationBar: Bottombar(),
    );
  }
}
