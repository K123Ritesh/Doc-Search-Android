import 'package:doc_search/Views/Not_Build_Page.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Privacy_Policy_Page.dart';
import 'package:flutter/material.dart';

import '../../../Bottom_Bar.dart';

class Health_Care_Plan_Detailed_Page extends StatefulWidget {
  const Health_Care_Plan_Detailed_Page({super.key});

  @override
  State<Health_Care_Plan_Detailed_Page> createState() =>
      _Health_Care_Plan_Detailed_PageState();
}

class _Health_Care_Plan_Detailed_PageState
    extends State<Health_Care_Plan_Detailed_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottombar(),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(children: [
          SizedBox(height: 23),
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
                width: 70,
              ),
              Text(
                'Health Care Plans',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(194, 230, 243, 1)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      'Doc search Bronze plan',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient:
                      RadialGradient(center: Alignment.bottomRight, colors: [
                    Color.fromRGBO(15, 96, 125, 1),
                    Color.fromRGBO(73, 144, 157, 1),
                    Color.fromRGBO(39, 119, 147, 1),
                    Color.fromRGBO(66, 134, 158, 1),
                    Color.fromRGBO(10, 163, 185, 0.94)
                  ]),
                  // color: const Color.fromRGBO(41, 120, 147, 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Bronze Plan (Yearly)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // SizedBox(
                                //   width: 20,
                                // ),
                                Text(
                                  '(Single Person',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 19,
                                  ),
                                ),
                                Text(
                                  ' )',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '₹999/Year',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Billed Every 1 year ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 19,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Check the'),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Privacy_Policy_Page()));
                                  },
                                  child: Text(
                                    ' Privacy Policy',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 40, 40, 1),
                                      // fontSize: 19,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Benifits',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        '1. Experience continuous care with unlimited consultations\n2. No shipping charges on order above   Rs 149\n3. 24/7 access to doctors across all specialties\n4. Video consultations for clinic-like experience\n5. Same day delivery on the available medicine (Within 1 Hour)',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient:
                      RadialGradient(center: Alignment.bottomRight, colors: [
                    Color.fromRGBO(15, 96, 125, 1),
                    Color.fromRGBO(73, 144, 157, 1),
                    Color.fromRGBO(39, 119, 147, 1),
                    Color.fromRGBO(66, 134, 158, 1),
                    Color.fromRGBO(10, 163, 185, 0.94)
                  ]),
                  // color: const Color.fromRGBO(41, 120, 147, 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Buy DocSearch health care Bronze 1 year plan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Person Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Mobile Number')
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Email Id'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '2nd Person Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoundedTextField(hintText: 'Name'),
                        RoundedTextField(hintText: 'Aadhar Number')
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedDropdownField(
                            labelText: 'Relation',
                            items: ['Wife', 'Mother', 'Father'])
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Have a coupon code',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(251, 188, 5, 1)),
                        ),
                        Text(
                          '₹999/Year',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            'By purchasing this plan you agree with\n Term and Condition of Doc search')
                      ],
                    ),
                    SizedBox(
                      height: 19,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Not_Build_Page()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue with Premium',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ]),
      ),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  final String hintText;

  RoundedTextField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 40, // Adjust the width as needed
      padding: EdgeInsets.only(left: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RoundedDropdownField extends StatefulWidget {
  final String labelText;
  final List<String> items;

  RoundedDropdownField({required this.labelText, required this.items});

  @override
  _RoundedDropdownFieldState createState() => _RoundedDropdownFieldState();
}

class _RoundedDropdownFieldState extends State<RoundedDropdownField> {
  String? _selectedItem;
  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 40, // Adjust the width as needed
      padding: EdgeInsets.only(left: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
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
