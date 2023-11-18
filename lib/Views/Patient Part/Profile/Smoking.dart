import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SmokingHabbit extends StatefulWidget {
  const SmokingHabbit({Key? key}) : super(key: key);

  @override
  _SmokingHabbitState createState() => _SmokingHabbitState();
}

class _SmokingHabbitState extends State<SmokingHabbit> {
  bool isNoSelected = false;
  bool isUsedToQuitSelected = false;
  bool is5LessPerDaySelected = false;
  bool is5MorePerDaySelected = false;

  void toggleSelection(String option) {
    setState(() {
      isNoSelected = option == 'I don’t smoke';
      isUsedToQuitSelected = option == 'I used to, but I’ve quit';
      is5LessPerDaySelected = option == '5 < day';
      is5MorePerDaySelected = option == '5 > day';
    });
  }

  String to_Store = '';
  void selectedOption() {
    if (isNoSelected == true) {
      setState(() {
        to_Store = 'I don’t smoke';
      });
    }
    if (isUsedToQuitSelected == true) {
      setState(() {
        to_Store = 'I used to, but I’ve quit';
      });
    }
    if (is5LessPerDaySelected == true) {
      setState(() {
        to_Store = '5 < day';
      });
    }
    if (is5MorePerDaySelected == true) {
      setState(() {
        to_Store = '5 > day';
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
            'Smoking Habits',
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
          Container(
            margin: EdgeInsets.only(left: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Do you smoke?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                buildToggleButton('I don’t smoke'),
                buildToggleButton('I used to, but I’ve quit'),
                buildToggleButton('5 < day'),
                buildToggleButton('5 > day'),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              selectedOption();
              userProvider.updateProfile(context, _auth.currentUser!.uid,
                  {'smoking_habits': to_Store});
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
      case 'I don’t smoke':
        return isNoSelected ? const Color(0xFF0059C8) : const Color(0xFF1A6A83);
      case 'I used to, but I’ve quit':
        return isUsedToQuitSelected
            ? const Color(0xFF0059C8)
            : const Color(0xFF1A6A83);
      case '5 < day':
        return is5LessPerDaySelected
            ? const Color(0xFF0059C8)
            : const Color(0xFF1A6A83);
      case '5 > day':
        return is5MorePerDaySelected
            ? const Color(0xFF0059C8)
            : const Color(0xFF1A6A83);
      default:
        return const Color(0xFF1A6A83);
    }
  }

  Widget getCheckIcon(String option) {
    if (option == 'I don’t smoke' && isNoSelected) {
      return Icon(
        Icons.check,
        color: const Color(0xFF0059C8),
      );
    } else if (option == 'I used to, but I’ve quit' && isUsedToQuitSelected) {
      return Icon(
        Icons.check,
        color: const Color(0xFF0059C8),
      );
    } else if (option == '5 < day' && is5LessPerDaySelected) {
      return Icon(
        Icons.check,
        color: const Color(0xFF0059C8),
      );
    } else if (option == '5 > day' && is5MorePerDaySelected) {
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
}
