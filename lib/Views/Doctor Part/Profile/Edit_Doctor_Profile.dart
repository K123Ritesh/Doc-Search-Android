import 'dart:io';
import 'package:doc_search/Config/sizeConfig.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart' as path;

class EditDoctorProfile extends StatefulWidget {
  const EditDoctorProfile({super.key});

  @override
  State<EditDoctorProfile> createState() => _EditDoctorProfileState();
}

class _EditDoctorProfileState extends State<EditDoctorProfile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
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
  String gender = 'zero';
  String bloodGrp = '';
  String address = '';
  String landmark = '';
  String city = '';
  String pincode = '';

  @override
  Widget build(BuildContext context) {
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
                      child: Icon(Icons.add_photo_alternate_rounded, size: 40)
                      // : ClipOval(
                      //     child: Image.network(
                      //       userProvider.user.profilePicUrl,
                      //       width: 80.0.w,
                      //       height: 80.0.h,
                      //       fit: BoxFit.cover,
                      //
                      // ),
                      ),
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
                buildTab("Bank Details", 1),
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
                              // initialValue: '${userProvider.user.firstName}',
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    // name =
                                    //     '${userProvider.user.firstName} ${userProvider.user.lastName}';
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
                                  // hintText: userProvider.user.mobileNo,
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
                              // initialValue: '${userProvider.user.email}',
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    // email = '${userProvider.user.email}';
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
                              // initialValue: '${userProvider.user.profession}',
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    // profession =
                                    // '${userProvider.user.profession}';
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
                                      // initialValue: '${userProvider.user.age}',
                                      onChanged: (value) {
                                        setState(() {
                                          if (value.length == 0) {
                                            // age = '${userProvider.user.age}';
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
                                      child: Text('Select your Gender'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'one',
                                      child: Text('Male'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'Two',
                                      child: Text('FeMale'),
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
                              // initialValue: '${userProvider.user.bloodGrp}',
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    // bloodGrp = '${userProvider.user.bloodGrp}';
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
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
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
                              // initialValue: '${userProvider.user.landmark}',
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
                                    // landmark = '${userProvider.user.landmark}';
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
                                    // city = '${userProvider.user.city}';
                                  } else {
                                    city = value;
                                  }
                                });
                                print('City:-$value');
                              },
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
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
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
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
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
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
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
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
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
                                      onChanged: (value) {
                                        setState(() {
                                          if (value.length == 0) {
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
                                      child: Text('Select your Gender'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'one',
                                      child: Text('Male'),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'Two',
                                      child: Text('FeMale'),
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
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 0) {
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

                        SizedBox(
                          height: 15,
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
