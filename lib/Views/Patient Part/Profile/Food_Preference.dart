import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Food_Preference extends StatefulWidget {
  const Food_Preference({Key? key});

  @override
  State<Food_Preference> createState() => _Food_PreferenceState();
}

class _Food_PreferenceState extends State<Food_Preference> {
  bool isVegetarianSelected = false;
  bool isNonVegetarianSelected = false;
  bool isEggetarianSelected = false;
  bool isVeganSelected = false;

  void toggleSelection(String option) {
    setState(() {
      isVegetarianSelected = option == 'Vegetarian';
      isNonVegetarianSelected = option == 'Non-Vegetarian';
      isEggetarianSelected = option == 'Eggetarian';
      isVeganSelected = option == 'Vegan';
    });
  }

  String to_Store = '';
  void selectedOption() {
    if (isVegetarianSelected == true) {
      setState(() {
        to_Store = 'Vegetarian';
      });
    }
    if (isNonVegetarianSelected == true) {
      setState(() {
        to_Store = 'Non-Vegetarian';
      });
    }
    if (isEggetarianSelected == true) {
      setState(() {
        to_Store = 'Eggetarian';
      });
    }
    if (isVeganSelected == true) {
      setState(() {
        to_Store = 'Vegan';
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
            'Food Preference',
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
                buildToggleButton('Vegetarian'),
                buildToggleButton('Non-Vegetarian'),
                buildToggleButton('Eggetarian'),
                buildToggleButton('Vegan'),
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
                  {'food_prefrencce': to_Store});
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
      case 'Vegetarian':
        return isVegetarianSelected
            ? const Color(0xFF0059C8)
            : const Color(0xFF1A6A83);
      case 'Non-Vegetarian':
        return isNonVegetarianSelected
            ? const Color(0xFF0059C8)
            : const Color(0xFF1A6A83);
      case 'Eggetarian':
        return isEggetarianSelected
            ? const Color(0xFF0059C8)
            : const Color(0xFF1A6A83);
      case 'Vegan':
        return isVeganSelected
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
      case 'Vegetarian':
        return isVegetarianSelected;
      case 'Non-Vegetarian':
        return isNonVegetarianSelected;
      case 'Eggetarian':
        return isEggetarianSelected;
      case 'Vegan':
        return isVeganSelected;
      default:
        return false;
    }
  }
}
