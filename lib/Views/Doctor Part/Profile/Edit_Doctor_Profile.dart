import 'dart:io';
import 'package:doc_search/Config/sizeConfig.dart';
import 'package:doc_search/Providers/Doctor_Part_Provider/Patient_And_Appointment_Provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

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
  String qualification = '';
  String experience = '';
  String age = '';
  String gender = 'zero';
  String bloodGroup = '';
  String address = '';
  String city = '';
  String state = '';
  String pincode = '';

  String bankName = '';
  String accountHolderName = '';
  String accountNumber = '';
  String ifscCode = '';

  @override
  Widget build(BuildContext context) {
    final updateProfile =
        Provider.of<Patient_And_Appointment_Provider>(context);
    SizeConfig().init(context);
    return Scaffold(
      // bottomNavigationBar: DoctorBottombar(SelectedIndex: 3,docCategory: widget.d),
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
                      child: updateProfile.myDetails!.profile_pic == ' '
                          ? Icon(Icons.add_photo_alternate_rounded, size: 40)
                          : ClipOval(
                              child: Image.network(
                                updateProfile.myDetails!.profile_pic,
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
                              initialValue: '${updateProfile.myDetails!.name}',
                              onChanged: (value) {
                                setState(() {
                                  name = value;
                                });
                                print('Name:-$value');
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[ a-zA-Z]')),
                              ],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: 'Enter Your Name',
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
                                  hintText:
                                      updateProfile.myDetails!.mobileNumber,
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
                              initialValue: '${updateProfile.myDetails!.email}',
                              onChanged: (value) {
                                setState(() {
                                  email = value;
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
                              initialValue:
                                  '${updateProfile.myDetails!.qualification}',
                              onChanged: (value) {
                                setState(() {
                                  qualification = value;
                                });
                                print('Qualification:-$value');
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[ .a-zA-Z]')),
                              ],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.engineering),
                                  hintText: "Qualification",
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
                              keyboardType: TextInputType.number,
                              initialValue:
                                  '${updateProfile.myDetails!.experience}',
                              onChanged: (value) {
                                setState(() {
                                  experience = value;
                                });
                                print('Experience:-$value');
                              },
                              // maxLength: 2,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.bloodtype),
                                  hintText: "Experience",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Card(
                          child: Row(
                            children: [
                              Container(
                                width: 130.w,
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      initialValue:
                                          '${updateProfile.myDetails!.age}',
                                      onChanged: (value) {
                                        setState(() {
                                          age = value;
                                        });
                                        print('Age:-$value');
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          hintText: "Age",
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
                                      child: Text('None'),
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
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              initialValue:
                                  '${updateProfile.myDetails!.bloodGroup}',
                              onChanged: (value) {
                                setState(() {
                                  bloodGroup = value;
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
                              initialValue:
                                  '${updateProfile.myDetails!.address}',
                              onChanged: (value) {
                                setState(() {
                                  address = value;
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
                              initialValue: '${updateProfile.myDetails!.city}',
                              onChanged: (value) {
                                setState(() {
                                  city = value;
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
                              initialValue: '${updateProfile.myDetails!.state}',
                              onChanged: (value) {
                                setState(() {
                                  state = value;
                                });
                                print('State:-$value');
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[ a-zA-Z]')),
                              ],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.landscape),
                                  hintText: "State",
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
                              initialValue:
                                  '${updateProfile.myDetails!.pincode}',
                              onChanged: (value) {
                                setState(() {
                                  pincode = value;
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
                                  updateProfile.uploadImage(
                                      context,
                                      selectedFile!,
                                      user.currentUser!.uid,
                                      'Dentist');
                                } else {
                                  setState(() {
                                    selectedFile = null;
                                  });
                                }
                                updateProfile.updateProfile(
                                    context, 'Dentist', user.currentUser!.uid, {
                                  'name': name.length == 0
                                      ? '${updateProfile.myDetails!.name}'
                                      : name,
                                  'email': email.length == 0
                                      ? '${updateProfile.myDetails!.email}'
                                      : email,
                                  'qualification': qualification.length == 0
                                      ? '${updateProfile.myDetails!.qualification}'
                                      : qualification,
                                  'experience': experience.length == 0
                                      ? '${updateProfile.myDetails!.experience}'
                                      : experience,
                                  'age': age.length == 0
                                      ? '${updateProfile.myDetails!.age}'
                                      : age,
                                  'bloodGroup': bloodGroup.length == 0
                                      ? '${updateProfile.myDetails!.bloodGroup}'
                                      : bloodGroup,
                                  'address': address.length == 0
                                      ? '${updateProfile.myDetails!.address}'
                                      : address,
                                  'city': city.length == 0
                                      ? '${updateProfile.myDetails!.city}'
                                      : city,
                                  'pin_code': pincode.length == 0
                                      ? '${updateProfile.myDetails!.pincode}'
                                      : pincode,
                                  'state': state.length == 0
                                      ? '${updateProfile.myDetails!.state}'
                                      : state,
                                });
                                updateProfile.getMyDetails(context, 'Dentist');

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
                                    'Update',
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
                              initialValue: updateProfile.myDetails!.bankName,
                              onChanged: (value) {
                                setState(() {
                                  bankName = value;
                                });
                                print('Bank Name:-$value');
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[ a-zA-Z]')),
                              ],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.food_bank),
                                  hintText: 'Bank Name',
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
                              initialValue:
                                  updateProfile.myDetails!.accountHolderName,
                              onChanged: (value) {
                                setState(() {
                                  accountHolderName = value;
                                });
                                print('Account Holder Name:-$value');
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[ a-zA-Z]')),
                              ],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: 'Account Holder Name',
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
                              initialValue:
                                  updateProfile.myDetails!.accountNumber,
                              onChanged: (value) {
                                setState(() {
                                  accountNumber = value;
                                });
                                print('Account Number:-$value');
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: 'Account Number',
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
                              initialValue: updateProfile.myDetails!.ifscCode,
                              onChanged: (value) {
                                setState(() {
                                  ifscCode = value;
                                });
                                print('IFSC Code:-$value');
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[ a-zA-Z]')),
                              ],
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: 'IFSC Code',
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
                                updateProfile.updateProfile(
                                    context, 'Dentist', user.currentUser!.uid, {
                                  'bankName': bankName.length == 0
                                      ? updateProfile.myDetails!.bankName
                                      : bankName,
                                  'accountHolderName':
                                      accountHolderName.length == 0
                                          ? updateProfile
                                              .myDetails!.accountHolderName
                                          : accountHolderName,
                                  'accountNumber': accountNumber.length == 0
                                      ? updateProfile.myDetails!.accountNumber
                                      : accountNumber,
                                  'ifscCode': ifscCode.length == 0
                                      ? updateProfile.myDetails!.ifscCode
                                      : ifscCode,
                                });
                                updateProfile.getMyDetails(context, 'Dentist');
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
