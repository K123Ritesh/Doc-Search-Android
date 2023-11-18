import 'package:doc_search/Bottom_Bar.dart';
import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:doc_search/Views/Patient%20Part/Doctors/Doctors_Category_Wise.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Appointment1 extends StatefulWidget {
  const Appointment1({super.key});

  @override
  State<Appointment1> createState() => _Appointment1State();
}

class _Appointment1State extends State<Appointment1> {
  TextEditingController specialization = TextEditingController();
  TextEditingController city = TextEditingController();
  int selectedOption = -1;

  List<String> cityList = ['Patna', 'Kolkata', 'Delhi', 'Pune'];
  List<String> specializations = ['Dentist', 'Orthopedic', 'Neurology'];
  String _selectedCity = '';
  String _selectedSpeciality = '';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF1A6A83),
    ));
    return Scaffold(
      bottomNavigationBar: Bottombar(SelectedIndex: 0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A6A83),
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
              'Find Doctor',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color(0xFF1A6A83),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150.h),
              Text(
                'Find Your Doctor',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '&',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Book the Appointment',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    'Select City',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),

              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: TextField(
                  controller: city,
                  readOnly: true,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ListView(
                          children: cityList.map((item) {
                            return ListTile(
                              title: Text(
                                item,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 18),
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedCity = item;
                                  city.text = item;
                                  print(_selectedCity);
                                });

                                Navigator.pop(context);
                                if (_selectedCity != '' &&
                                    _selectedSpeciality != '') {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Doctors_Category_Wise(
                                            title:
                                                '${specialization.text}s in ${city.text}',
                                            doc_Category: _selectedSpeciality,
                                            default_city: _selectedCity)),
                                  );
                                }
                              },
                            );
                          }).toList(),
                        );
                      },
                    );
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.location_on,
                      size: 35,
                      color: const Color(0xFF155467),
                    ),
                    hintText: 'Select Your City',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  Text(
                    'Select Specialization',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(color: Color(0xFF5793A8), width: 1.0),
                    borderRadius: BorderRadius.circular(50)),
                child: TextField(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ListView(
                          children: specializations.map((item) {
                            return ListTile(
                              title: Text(
                                item,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 18),
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedSpeciality = item;
                                  specialization.text = item;
                                  print(_selectedSpeciality);
                                });

                                Navigator.pop(context);
                                if (_selectedCity != '' &&
                                    _selectedSpeciality != '') {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Doctors_Category_Wise(
                                            title:
                                                '${specialization.text}s in ${city.text}',
                                            doc_Category: _selectedSpeciality,
                                            default_city: _selectedCity)),
                                  );
                                }
                              },
                            );
                          }).toList(),
                        );
                      },
                    );
                  },
                  readOnly: true,
                  controller: specialization,
                  decoration: const InputDecoration(
                    border: InputBorder.none, // Remove the default border
                    prefixIcon: Icon(
                      Icons.search,
                      color: const Color(0xFF155467),
                      size: 35,
                    ),
                    hintText: 'Select Specialization',
                  ),
                ),
              ),

              // const Text(
              //   'Talk to the doctors from the',
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 16,
              //       fontWeight: FontWeight.w500),
              // ),
              // const Text(
              //   'comfort of your home easily',
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 16,
              //       fontWeight: FontWeight.w500),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              //   height: 99,
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       GestureDetector(
              //         onTap: () {},
              //         child: Container(
              //           height: 70,
              //           width: 70,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(35),
              //             color: const Color(0xFF155467),
              //           ),
              //           child: const Column(
              //             children: [
              //               SizedBox(
              //                 height: 20,
              //               ),
              //               Text(
              //                 "Enter",
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 12,
              //                     fontWeight: FontWeight.w400),
              //               ),
              //               Text(
              //                 "Symptoms",
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 12,
              //                     fontWeight: FontWeight.w400),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       const Icon(
              //         Icons.arrow_forward,
              //         size: 36,
              //         color: Color(0xFF155467),
              //       ),
              //       GestureDetector(
              //         onTap: () {

              //         },
              //         child: Container(
              //           height: 70,
              //           width: 70,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(35),
              //             color: const Color(0xFF155467),
              //           ),
              //           child: const Column(
              //             children: [
              //               SizedBox(
              //                 height: 20,
              //               ),
              //               Text(
              //                 "Understand",
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 12,
              //                     fontWeight: FontWeight.w400),
              //               ),
              //               Text(
              //                 "Cause",
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 12,
              //                     fontWeight: FontWeight.w400),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       const Icon(
              //         Icons.arrow_forward,
              //         size: 36,
              //         color: Color(0xFF155467),
              //       ),
              //       GestureDetector(
              //         onTap: () {},
              //         child: Container(
              //           height: 70,
              //           width: 70,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(35),
              //             color: const Color(0xFF155467),
              //           ),
              //           child: const Column(
              //             children: [
              //               SizedBox(
              //                 height: 20,
              //               ),
              //               Text(
              //                 "Book",
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 12,
              //                     fontWeight: FontWeight.w400),
              //               ),
              //               Text(
              //                 "Consult",
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 12,
              //                     fontWeight: FontWeight.w400),
              //               ),
              //             ],
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(right: 20, top: 15, bottom: 5),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       SizedBox(
              //         width: 76,
              //         height: 17,
              //         child: ElevatedButton(
              //           onPressed: () {
              //             if (city.toString() != '' &&
              //                 specialization.toString() != '') {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => Doctors_Category_Wise(
              //                         title:
              //                             '${specialization.text}s in ${city.text}',
              //                         doc_Category: specialization.text,
              //                         default_city: city.text)),
              //               );
              //             } else {
              //               print('Please Enter City');
              //             }
              //           },
              //           style: ElevatedButton.styleFrom(
              //             primary: const Color(0xFF155467),
              //             padding: EdgeInsets.zero,
              //           ),
              //           child: const Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text(
              //                 "Get Started",
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 10,
              //                     fontWeight: FontWeight.w500),
              //               ),
              //               Icon(
              //                 Icons.arrow_forward_ios,
              //                 size: 10,
              //               ),
              //             ],
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.all(10),
              //   height: 28,
              //   width: 450,
              //   decoration: BoxDecoration(
              //     color: const Color(0xFF155467),
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   child: const Center(
              //       child: Text(
              //     'Find a doctor near by in just 3 steps',
              //     style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.white,
              //         fontWeight: FontWeight.w500),
              //   )),
              // ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Container(
              //     margin: const EdgeInsets.only(left: 40, top: 10),
              //     child: const Text(
              //       "Your area/pincode",
              //       style: TextStyle(
              //           fontWeight: FontWeight.w500,
              //           fontSize: 16,
              //           color: Colors.white),
              //     ),
              //   ),
              // ),
              // Container(
              //   height: 50,
              //   margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
              //   padding: const EdgeInsets.all(8),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       // border: Border.all(color: Color(0xFF5793A8), width: 1.0),
              //       borderRadius: BorderRadius.circular(50)),
              //   child: const TextField(
              //     decoration: InputDecoration(
              //       border: InputBorder.none, // Remove the default border
              //       prefixIcon: Icon(
              //         Icons.location_on,
              //         size: 35,
              //         color: const Color(0xFF155467),
              //       ),
              //       hintText: 'Search Location',
              //     ),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Container(
              //     margin: const EdgeInsets.only(left: 40, top: 20),
              //     child: const Text(
              //       "Your area/pincode",
              //       style: TextStyle(
              //           fontWeight: FontWeight.w500,
              //           fontSize: 16,
              //           color: Colors.white),
              //     ),
              //   ),
              // ),
              // Container(
              //   height: 50,
              //   margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
              //   padding: const EdgeInsets.all(8),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       // border: Border.all(color: Color(0xFF5793A8), width: 1.0),
              //       borderRadius: BorderRadius.circular(50)),
              //   child: const TextField(
              //     decoration: InputDecoration(
              //       border: InputBorder.none,
              //       prefixIcon: Icon(
              //         Icons.search,
              //         size: 35,
              //         color: const Color(0xFF155467),
              //       ),
              //       hintText: 'Search Doctors and Specialities',
              //     ),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: Container(
              //     margin: const EdgeInsets.only(left: 40, top: 20),
              //     child: const Text(
              //       "Time to meet",
              //       style: TextStyle(
              //           fontWeight: FontWeight.w500,
              //           fontSize: 16,
              //           color: Colors.white),
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(top: 10, left: 50, right: 50),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: List.generate(options.length, (index) {
              //       return InkWell(
              //         onTap: () {
              //           setState(() {
              //             selectedOption = index;
              //           });
              //         },
              //         child: Container(
              //           width: 85,
              //           height: 28,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             color: selectedOption == index
              //                 ? const Color(0xFF155467)
              //                 : Colors.white,
              //           ),
              //           alignment: Alignment.center,
              //           child: Text(
              //             options[index],
              //             style: TextStyle(
              //                 color: selectedOption == index
              //                     ? Colors.white
              //                     : const Color(0xFF155467),
              //                 fontWeight: FontWeight.w500),
              //           ),
              //         ),
              //       );
              //     }),
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(right: 20, top: 15, bottom: 5),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Container(
              //         width: 85,
              //         height: 28,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10)),
              //         child: ElevatedButton(
              //           onPressed: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => Doctors_Category_Wise(
              //                       title: 'Doctors',
              //                       doc_Category: 'Dentist',
              //                       default_city: userProvider.user.city)),
              //             );
              //           },
              //           style: ElevatedButton.styleFrom(
              //             primary: const Color(0xFF155467),
              //             padding: EdgeInsets.zero,
              //           ),
              //           child: const Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text(
              //                 "Submit",
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w500),
              //               ),
              //             ],
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
