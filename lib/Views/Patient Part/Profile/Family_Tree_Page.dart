// import 'package:doc_search/Providers/Doctor_Part_Provider/Patient_And_Appointment_Provider.dart';
import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Family_Tree_Page extends StatefulWidget {
  const Family_Tree_Page({super.key});

  @override
  State<Family_Tree_Page> createState() => _Family_Tree_PageState();
}

class _Family_Tree_PageState extends State<Family_Tree_Page> {
  List<Map<String, dynamic>> familyList = [{}];
  @override
  void initState() {
    super.initState();
    familyList =
        Provider.of<User_Provider>(context, listen: false).familymemberList;
  }

  int n = 1;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1A6A83),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A6A83),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
              margin: EdgeInsets.only(left: 70.w),
              child: Text(
                'Family Tree',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              )),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 85.h,
                  width: 85.w,
                  child: CircleAvatar(
                    child: userProvider.user.profilePicUrl == ' '
                        ? Icon(Icons.person, color: Colors.blue, size: 90)
                        : ClipOval(
                            child: Image.network(
                              userProvider.user.profilePicUrl,
                              width: 95.0.w,
                              height: 95.0.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                    maxRadius: 50.r,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '${userProvider.user.firstName} ${userProvider.user.lastName}',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '${userProvider.user.age} Years',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '${userProvider.user.address}',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '${userProvider.user.mobileNo}',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            for (int i = 1; i < userProvider.familymemberList.length; i++)
              Members_card(
                  i: i,
                  name: userProvider.familymemberList[i]['Full Name'],
                  relation: userProvider.familymemberList[i]['Relation']),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  'Add Family Members',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please provide following information ',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            for (int i = 0; i < n; i++)
              Familymember_Details(
                n: i,
                onUserDataChanged: (data) {
                  Map<String, dynamic> map = data;
                  if (map.length == 3) {
                    familyList.add(map);
                    userProvider.familymemberList.add(map);
                  } else {
                    print('Not filled all the fields');
                  }
                  print(data);
                },
              ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (familyList[n].length == 3) {
                        n++;
                      } else {
                        print('Not Filled all the fields');
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 15, 79, 131),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 33.w,
                        vertical: 8.h,
                      ),
                      child: Text(
                        'Add more',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    userProvider.addFamilyMembers(
                        context, userProvider.familymemberList);
                    userProvider.getFamilyMembersList(context);
                    // Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 15, 79, 131),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 33.w,
                        vertical: 8.h,
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            )
          ],
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
      height: 50,
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

class Familymember_Details extends StatefulWidget {
  Familymember_Details(
      {Key? key, required this.n, required this.onUserDataChanged})
      : super(key: key);

  final int n;
  final Function(Map<String, dynamic>) onUserDataChanged;

  @override
  _Familymember_DetailsState createState() => _Familymember_DetailsState();
}

class _Familymember_DetailsState extends State<Familymember_Details> {
  Map<String, dynamic> userData = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        RoundedTextField(
          hintText: 'Full Name',
          onValueChanged: (value) {
            userData.addAll(value);
            widget.onUserDataChanged(userData);
          },
        ),
        SizedBox(
          height: 15,
        ),
        RoundedTextField(
          hintText: 'Mobile Number',
          onValueChanged: (value) {
            userData.addAll(value);
            widget.onUserDataChanged(userData);
          },
        ),
        SizedBox(
          height: 15,
        ),
        RoundedDropdownField(
          labelText: 'Relation',
          items: ['Father', 'Mother', 'Sister', 'Brother', 'Wife'],
          onValueChanged: (value) {
            userData.addAll(value);
            widget.onUserDataChanged(userData);
          },
        ),
        SizedBox(
          height: 5,
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

class Members_card extends StatelessWidget {
  Members_card(
      {super.key, required this.name, required this.relation, required this.i});
  final String name;
  final String relation;
  final int i;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 3.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Card(
          elevation: 30,
          shadowColor: Color.fromARGB(255, 205, 226, 225),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 20),
                    ),
                    InkWell(
                      onTap: () {
                        userProvider.familymemberList.removeAt(i);
                        userProvider.addFamilyMembers(
                            context, userProvider.familymemberList);
                        userProvider.getFamilyMembersList(context);
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 30,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Adult | $relation ',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
