import 'dart:io';
import 'package:doc_search/Config/sizeConfig.dart';
import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Surgeries.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/current_medication.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/past_medication.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Activity_Level.dart';
import 'Alcohol_Consumption.dart';
import 'Allergies.dart';
import 'Chronic_Diseases.dart';
import 'Food_Preference.dart';
import 'Injuries.dart';
import 'Occupation.dart';
import 'Smoking.dart';
import 'package:path/path.dart' as path;

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key, required this.gender});

  final String gender;

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String gender = 'zero';
  @override
  void initState() {
    super.initState();
    setState(() {
      gender = widget.gender;
    });
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = 0;
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  String fileName = '';
  File? selectedFile;
  List<String> files_list = [];
  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'txt'],
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      for (File file in files) {
        selectedFile = file;
        print("Selected file: ${file.path}");
        fileName = path.basename(file.path).toString();
        setState(() {
          files_list.add(fileName);
        });
        print(fileName);
      }
    }
  }

  String name = '';
  String email = '';
  String profession = '';
  String age = '';

  String bloodGrp = '';
  String address = '';
  String landmark = '';
  String city = '';
  String pincode = '';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context);

    SizeConfig().init(context);
    return Scaffold(
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
            margin: const EdgeInsets.only(left: 85),
            child: const Text(
              'Edit Profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Container(
                child: InkWell(
                  onTap: () {
                    _openFilePicker();
                  },
                  child: CircleAvatar(
                      radius: 40,
                      child: userProvider.user.profilePicUrl == " "
                          ? Icon(Icons.add_photo_alternate_rounded, size: 40)
                          : ClipOval(
                              child: Image.network(
                                userProvider.user.profilePicUrl,
                                width: 80.0.w,
                                height: 80.0.h,
                                fit: BoxFit.cover,
                              ),
                            )),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'EDIT',
            style: TextStyle(
                fontFamily: 'Roboto', fontSize: 20.0, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 25,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF155467),
            ),
            child: TabBar(
              controller: _tabController,
              tabs: [
                buildTab("Personal", 0),
                buildTab("Medical", 1),
                buildTab("Lifestyle", 2),
              ],
              indicatorColor: Colors.transparent,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              initialValue: '${userProvider.user.firstName}',
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    name =
                                        '${userProvider.user.firstName} ${userProvider.user.lastName}';
                                  } else {
                                    name = value;
                                  }
                                });
                                print('Name:-$value');
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[ a-zA-Z]')),
                              ],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: '',
                                  hintStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 46, 43, 43)),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              readOnly: true,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone_android),
                                  hintText: userProvider.user.mobileNo,
                                  hintStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 72, 66, 66)),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              initialValue: '${userProvider.user.email}',
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    email = '${userProvider.user.email}';
                                  } else {
                                    email = value;
                                  }
                                });
                                print('Email:-$value');
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              initialValue: '${userProvider.user.profession}',
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    profession =
                                        '${userProvider.user.profession}';
                                  } else {
                                    profession = value;
                                  }
                                });
                                print('profession:-$value');
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z]')),
                              ],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.engineering),
                                  hintText: "Profession",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        // SizedBox(
                        //   height: 15,
                        // ),
                        Card(
                          child: Row(
                            children: [
                              Container(
                                width: 130.w,
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      initialValue: '${userProvider.user.age}',
                                      onChanged: (value) {
                                        setState(() {
                                          if (value.length == 0) {
                                            age = '${userProvider.user.age}';
                                          } else {
                                            age = value;
                                          }
                                        });
                                        print('Age:-$value');
                                      },
                                      // maxLength: 2,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          hintText: "  Age (in Years)",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50.fw,
                              ),
                              Divider(
                                height: 20,
                                color: Colors.black,
                              ),
                              Center(
                                child: DropdownButton<String>(
                                  elevation: 0,
                                  value: gender,
                                  icon: Icon(Icons.arrow_drop_down),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      gender = newValue!;
                                    });
                                  },
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: 'zero',
                                      child: Text('Select Gender'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'one',
                                      child: Text('Male'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'Two',
                                      child: Text('Female'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'Three',
                                      child: Text('Others'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              initialValue: '${userProvider.user.bloodGrp}',
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    bloodGrp = '${userProvider.user.bloodGrp}';
                                  } else {
                                    bloodGrp = value;
                                  }
                                });
                                print('Blood Group:-$value');
                              },
                              // maxLength: 2,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.bloodtype),
                                  hintText: "Blood Group",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              initialValue: '${userProvider.user.address}',
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    address = '${userProvider.user.address}';
                                  } else {
                                    address = value;
                                  }
                                });
                                print('Address:-$value');
                              },
                              maxLines: 3,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[ a-zA-Z]')),
                              ],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.location_on),
                                  hintText: "Address",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              initialValue: '${userProvider.user.landmark}',
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    landmark = '${userProvider.user.landmark}';
                                  } else {
                                    landmark = value;
                                  }
                                });
                                print('Landmark:-$value');
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[ a-zA-Z]')),
                              ],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.landscape),
                                  hintText: "Landmark",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    city = '${userProvider.user.city}';
                                  } else {
                                    city = value;
                                  }
                                });
                                print('City:-$value');
                              },
                              initialValue: userProvider.user.city,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z]')),
                              ],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.location_city),
                                  hintText: "City",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              initialValue: '${userProvider.user.pincode}',
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    pincode = '${userProvider.user.pincode}';
                                  } else {
                                    pincode = value;
                                  }
                                });
                                print('Pincode:-$value');
                              },
                              // maxLength: 6,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.location_pin),
                                  hintText: "Pincode",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30.w,
                                    vertical: 8.h,
                                  ),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                FirebaseAuth user = FirebaseAuth.instance;

                                if (selectedFile != null) {
                                  userProvider.uploadImage(context,
                                      selectedFile!, user.currentUser!.uid);
                                } else {
                                  setState(() {
                                    selectedFile = null;
                                  });
                                }

                                userProvider.updateProfile(
                                    context, user.currentUser!.uid, {
                                  'firstName': name.length == 0
                                      ? '${userProvider.user.firstName} ${userProvider.user.lastName}'
                                      : name,
                                  'lastName': '',
                                  'email': email.length == 0
                                      ? '${userProvider.user.email}'
                                      : email,
                                  'profession': profession.length == 0
                                      ? '${userProvider.user.profession}'
                                      : profession,
                                  'age': age.length == 0
                                      ? '${userProvider.user.age}'
                                      : age,
                                  'gender': gender.length == 0
                                      ? '${userProvider.user.gender}'
                                      : gender,
                                  'bloodGroup': bloodGrp.length == 0
                                      ? '${userProvider.user.bloodGrp}'
                                      : bloodGrp,
                                  'address': address.length == 0
                                      ? '${userProvider.user.address}'
                                      : address,
                                  'landmark': landmark.length == 0
                                      ? '${userProvider.user.landmark}'
                                      : landmark,
                                  'city': city.length == 0
                                      ? '${userProvider.user.city}'
                                      : city,
                                  'pincode': pincode.length == 0
                                      ? '${userProvider.user.pincode}'
                                      : pincode,
                                });
                                userProvider.getUserDetails(
                                    context, user.currentUser!.uid);

                                Navigator.pop(context);
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
                                    'update',
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
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: 50,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Allergies',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Allergies()),
                                    );
                                  },
                                  child: const Text(
                                    'add',
                                    style: TextStyle(
                                        color: Color(0xFF24708B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: 50,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Current Medications',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Current_Medication()),
                                    );
                                  },
                                  child: const Text(
                                    'add',
                                    style: TextStyle(
                                        color: Color(0xFF24708B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: 50,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Past Medications',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Pass_Medication()),
                                    );
                                  },
                                  child: const Text(
                                    'add',
                                    style: TextStyle(
                                        color: Color(0xFF24708B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: 50,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Chronic Diseases',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Chronic_Diseases()),
                                    );
                                  },
                                  child: const Text(
                                    'add',
                                    style: TextStyle(
                                        color: Color(0xFF24708B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: 50,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Injuries',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Injuries()),
                                    );
                                  },
                                  child: const Text(
                                    'add',
                                    style: TextStyle(
                                        color: Color(0xFF24708B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: 50,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Surgeries',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Surgeries()),
                                    );
                                  },
                                  child: const Text(
                                    'add',
                                    style: TextStyle(
                                        color: Color(0xFF24708B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: 50,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Smoking Habits',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SmokingHabbit()),
                                    );
                                  },
                                  child: const Text(
                                    'add',
                                    style: TextStyle(
                                        color: Color(0xFF24708B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: 50,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Alcohol Consumption',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Alcohol_Consumption()),
                                    );
                                  },
                                  child: const Text(
                                    'add',
                                    style: TextStyle(
                                        color: Color(0xFF24708B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: 50,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Activity Level',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Activity_Level()),
                                    );
                                  },
                                  child: const Text(
                                    'add',
                                    style: TextStyle(
                                        color: Color(0xFF24708B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: 50,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Food Preference',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Food_Preference()),
                                    );
                                  },
                                  child: const Text(
                                    'add',
                                    style: TextStyle(
                                        color: Color(0xFF24708B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: 50,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Occupation',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Occupation()),
                                    );
                                  },
                                  child: const Text(
                                    'add',
                                    style: TextStyle(
                                        color: Color(0xFF24708B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTab(String text, int tabIndex) {
    return Container(
      height: 25,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: _tabController.index == tabIndex
            ? Colors.white
            : const Color(0xFF155467),
      ),
      child: GestureDetector(
        onTap: () {
          _tabController.index = tabIndex;
        },
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: _tabController.index == tabIndex
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
