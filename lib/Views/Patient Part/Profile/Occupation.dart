import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Occupation extends StatefulWidget {
  const Occupation({Key? key});

  @override
  State<Occupation> createState() => _OccupationState();
}

class _OccupationState extends State<Occupation> {
  bool isITProfessionalSelected = false;
  bool isMedicalProfessionalSelected = false;
  bool isBankingProfessionalSelected = false;
  bool isStudentSelected = false;
  bool isOtherSelected = false;
  TextEditingController other = TextEditingController();

  void toggleSelection(String option) {
    setState(() {
      isITProfessionalSelected = option == 'IT-Professional';
      isMedicalProfessionalSelected = option == 'Medical-Professional';
      isBankingProfessionalSelected = option == 'Banking-Professional';
      isStudentSelected = option == 'Student';
      isOtherSelected = option == 'Other';
    });
  }

  String to_Store = '';
  void selectedOption() {
    if (isITProfessionalSelected == true) {
      setState(() {
        to_Store = 'IT-Professional';
      });
    }
    if (isMedicalProfessionalSelected == true) {
      setState(() {
        to_Store = 'Medical-Professional';
      });
    }
    if (isBankingProfessionalSelected == true) {
      setState(() {
        to_Store = 'Banking-Professional';
      });
    }
    if (isStudentSelected == true) {
      setState(() {
        to_Store = 'Student';
      });
    }
    if (isOtherSelected == true) {
      setState(() {
        to_Store = other.text;
      });
    }
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          margin: EdgeInsets.only(left: 80),
          child: Text(
            'Occupation',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                buildToggleButton('IT-Professional'),
                buildToggleButton('Medical-Professional'),
                buildToggleButton('Banking-Professional'),
                buildToggleButton('Student'),
                buildToggleButton('Other'),
              ],
            ),
          ),
          isOtherSelected == true
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 40.0.w, vertical: 15.0.h),
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter the occupation',
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                )
              : SizedBox(
                  height: 20,
                ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              selectedOption();
              userProvider.updateProfile(
                  context, _auth.currentUser!.uid, {'profession': to_Store});
              userProvider.getUserDetails(context, _auth.currentUser!.uid);
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
    );
  }

  Widget buildToggleButton(String option) {
    return GestureDetector(
      onTap: () => toggleSelection(option),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        height: 50,
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: getButtonColor(option),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                option,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: getCheckIcon(option),
            ),
          ],
        ),
      ),
    );
  }

  Color getButtonColor(String option) {
    switch (option) {
      case 'IT-Professional':
        return isITProfessionalSelected
            ? const Color(0xFF0059C8)
            : const Color(0xFF1A6A83);
      case 'Medical-Professional':
        return isMedicalProfessionalSelected
            ? const Color(0xFF0059C8)
            : const Color(0xFF1A6A83);
      case 'Banking-Professional':
        return isBankingProfessionalSelected
            ? const Color(0xFF0059C8)
            : const Color(0xFF1A6A83);
      case 'Student':
        return isStudentSelected
            ? const Color(0xFF0059C8)
            : const Color(0xFF1A6A83);
      case 'Other':
        return isOtherSelected
            ? const Color(0xFF0059C8)
            : const Color(0xFF1A6A83);
      default:
        return const Color(0xFF1A6A83);
    }
  }

  Widget getCheckIcon(String option) {
    if (getOptionSelected(option)) {
      return Icon(
        Icons.check,
        color: const Color(0xFF0059C8),
      );
    } else {
      return Container(
        width: 24,
        height: 24,
      );
    }
  }

  bool getOptionSelected(String option) {
    switch (option) {
      case 'IT-Professional':
        return isITProfessionalSelected;
      case 'Medical-Professional':
        return isMedicalProfessionalSelected;
      case 'Banking-Professional':
        return isBankingProfessionalSelected;
      case 'Student':
        return isStudentSelected;
      case 'Other':
        return isOtherSelected;
      default:
        return false;
    }
  }
}
