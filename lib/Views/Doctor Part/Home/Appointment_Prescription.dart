import 'package:doc_search/Config/sizeConfig.dart';
import 'package:doc_search/Models/Models_For_Patient_Part/User_Model.dart';
import 'package:doc_search/Providers/Doctor_Part_Provider/Patient_And_Appointment_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Appointment_Prescription extends StatefulWidget {
  Appointment_Prescription(
      {super.key, required this.appointmentId, required this.user});
  final PatientUser user;
  final String appointmentId;

  @override
  State<Appointment_Prescription> createState() =>
      _Appointment_PrescriptionState();
}

class _Appointment_PrescriptionState extends State<Appointment_Prescription> {
  int n = 1;
  List<Map<String, dynamic>> MedicineList = [{}];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Patient_And_Appointment_Provider>(context);
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
              'Appointments',
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
                  child: widget.user.profilePicUrl == " "
                      ? Icon(
                          Icons.person,
                          color: Colors.red,
                          size: 70,
                        )
                      : ClipOval(
                          child: Image.network(
                            widget.user.profilePicUrl,
                            width: 90.0.w,
                            height: 90.0.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 5.fh,
              ),
              Text(
                widget.user.firstName,
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
              // Container(
              //   margin: EdgeInsets.only(top: 20),
              //   child: Table(
              //     defaultColumnWidth: FixedColumnWidth(92.0),
              //     border: TableBorder.all(
              //         color: Colors.white, style: BorderStyle.solid, width: 2),
              //     children: [
              //       TableRow(children: [
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Text('Medicine',
              //               style: TextStyle(
              //                   fontSize: 12.0,
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold)),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Text('Strength',
              //               style: TextStyle(
              //                   fontSize: 12.0,
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold)),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Text('Dose',
              //               style: TextStyle(
              //                   fontSize: 12.0,
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold)),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Text('Duration',
              //               style: TextStyle(
              //                   fontSize: 12.0,
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold)),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //       ]),
              //       TableRow(children: [
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Container(
              //               height: 17,
              //               width: 80,
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(5),
              //               ),
              //               child: TextField()),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Container(
              //             child: TextField(),
              //             height: 17,
              //             width: 80,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(5),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Container(
              //             child: TextField(),
              //             height: 17,
              //             width: 80,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(5),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Container(
              //             height: 17,
              //             width: 80,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(5),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //       ]),
              //       TableRow(children: [
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Container(
              //             height: 17,
              //             width: 80,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(5),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Container(
              //             height: 17,
              //             width: 80,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(5),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Container(
              //             height: 17,
              //             width: 80,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(5),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Container(
              //             height: 17,
              //             width: 80,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(5),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //       ]),
              //       TableRow(children: [
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Container(
              //             height: 17,
              //             width: 80,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(5),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Container(
              //             height: 17,
              //             width: 80,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(5),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Container(
              //             height: 17,
              //             width: 80,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(5),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //         Column(children: [
              //           SizedBox(
              //             height: 5,
              //           ),
              //           Container(
              //             height: 17,
              //             width: 80,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(5),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 5,
              //           ),
              //         ]),
              //       ]),
              //     ],
              //   ),
              // ),
              for (int i = 0; i < n; i++)
                Medicine_Details(
                  n: i,
                  onUserDataChanged: (data) {
                    Map<String, dynamic> map = data;
                    if (map.length == 4) {
                      MedicineList.add(map);
                    } else {
                      print('Not filled all the fields');
                    }
                    print(data);
                  },
                ),

              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (MedicineList[n].length != 4) {
                          print('Not filled all the fields');
                        } else {
                          n++;
                        }
                      });
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
                                'Add More',
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
                      print(MedicineList);
                      if (MedicineList.length == 1) {
                        print('add medicine first to save');
                      } else {
                        provider.uploadMedicineLists(
                            context, widget.appointmentId, MedicineList);
                        print('Uploaded Successfully');
                      }
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => Prescription_Done()));
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
                                'Save ',
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

class RoundedTextField extends StatefulWidget {
  final String hintText;
  final Function(Map<String, dynamic>) onValueChanged;

  RoundedTextField({
    required this.hintText,
    required this.onValueChanged,
  });

  @override
  _RoundedTextFieldState createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50, // Adjust the width as needed
      padding: EdgeInsets.only(left: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: textController,
        onChanged: (value) {
          widget.onValueChanged({widget.hintText: value});
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class Medicine_Details extends StatefulWidget {
  Medicine_Details({Key? key, required this.n, required this.onUserDataChanged})
      : super(key: key);

  final int n;
  final Function(Map<String, dynamic>) onUserDataChanged;
  List<String> suffix = ['st', 'nd', 'rd', 'th', 'th', 'th'];

  @override
  _Medicine_DetailsState createState() => _Medicine_DetailsState();
}

class _Medicine_DetailsState extends State<Medicine_Details> {
  Map<String, dynamic> userData = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          '${widget.n + 1}${widget.suffix[widget.n]} Medicine',
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        RoundedTextField(
          hintText: 'Medicine Name',
          onValueChanged: (value) {
            userData.addAll(value);
            widget.onUserDataChanged(userData);
          },
        ),
        SizedBox(
          height: 15,
        ),
        RoundedTextField(
          hintText: 'Strength',
          onValueChanged: (value) {
            userData.addAll(value);
            widget.onUserDataChanged(userData);
          },
        ),
        SizedBox(
          height: 15,
        ),
        RoundedDropdownField(
          labelText: 'Dose',
          items: ['1 per day', '2 per day', '3 per day'],
          onValueChanged: (value) {
            userData.addAll(value);
            widget.onUserDataChanged(userData);
          },
        ),
        SizedBox(
          height: 15,
        ),
        RoundedDropdownField(
          labelText: 'Duration',
          items: [
            '5 days',
            '10 days',
            '15 days',
            '20 days',
            '25 days',
            '30 days',
          ],
          onValueChanged: (value) {
            userData.addAll(value);
            widget.onUserDataChanged(userData);
          },
        ),
      ],
    );
  }
}

class RoundedDropdownField extends StatefulWidget {
  final String labelText;
  final List<String> items;
  final Function(Map<String, dynamic>) onValueChanged;

  RoundedDropdownField({
    required this.labelText,
    required this.items,
    required this.onValueChanged,
  });

  @override
  _RoundedDropdownFieldState createState() => _RoundedDropdownFieldState();
}

class _RoundedDropdownFieldState extends State<RoundedDropdownField> {
  String? _selectedItem;
  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50, // Adjust the width as needed
      padding: EdgeInsets.only(left: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        readOnly: true,
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ListView(
                children: widget.items.map((item) {
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        _selectedItem = item;
                        text.text = item;
                      });

                      widget.onValueChanged({widget.labelText: _selectedItem});
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              );
            },
          );
        },
        controller: text,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView(
                      children: widget.items.map((item) {
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              _selectedItem = item;
                              text.text = item;
                            });

                            widget.onValueChanged(
                                {widget.labelText: _selectedItem});
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    );
                  },
                );
              },
              icon: Icon(Icons.arrow_drop_down)),
          hintText: widget.labelText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Medicine_Details(
          n: 0,
          onUserDataChanged: (userData) {
            // Access the user data map here
            print(userData);
          },
        ),
      ),
    );
  }
}
