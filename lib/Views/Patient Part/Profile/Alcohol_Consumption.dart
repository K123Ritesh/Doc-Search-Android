import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Alcohol_Consumption extends StatefulWidget {
  const Alcohol_Consumption({Key? key}) : super(key: key);

  @override
  State<Alcohol_Consumption> createState() => _Alcohol_ConsumptionState();
}

class _Alcohol_ConsumptionState extends State<Alcohol_Consumption> {
  bool isNoSelected = false;
  bool isRareSelected = false;
  bool isSocialSelected = false;
  bool isRegularSelected = false;
  bool isHeavySelected = false;

  void toggleSelection(String option) {
    setState(() {
      isNoSelected = option == 'Non-Drinker';
      isRareSelected = option == 'Rare';
      isSocialSelected = option == 'Social';
      isRegularSelected = option == 'Regular';
      isHeavySelected = option == 'Heavy';
    });
  }

  String to_Store = '';
  void selectedOption() {
    if (isHeavySelected == true) {
      setState(() {
        to_Store = 'Heavy';
      });
    }
    if (isRareSelected == true) {
      setState(() {
        to_Store = 'Rare';
      });
    }
    if (isNoSelected == true) {
      setState(() {
        to_Store = 'Non-Drinker';
      });
    }
    if (isSocialSelected == true) {
      setState(() {
        to_Store = 'Social';
      });
    }
    if (isRegularSelected == true) {
      setState(() {
        to_Store = 'Regular';
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
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        title: Container(
          margin: EdgeInsets.only(left: 80),
          child: Text(
            'Alcohol Consumption',
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
                buildToggleButton('Non-Drinker'),
                buildToggleButton('Rare'),
                buildToggleButton('Social'),
                buildToggleButton('Regular'),
                buildToggleButton('Heavy'),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                selectedOption();
                userProvider.updateProfile(context, _auth.currentUser!.uid,
                    {'alcohol_consumption': '$to_Store'});
                userProvider.getUserDetails(context, _auth.currentUser!.uid);
                Navigator.pop(context);
              },
              child: Text(
                'Done',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ))
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
      case 'Non-Drinker':
        return isNoSelected ? const Color(0xFF0059C8) : const Color(0xFF1A6A83);
      case 'Rare':
        return isRareSelected
            ? const Color(0xFF0059C8)
            : const Color(0xFF1A6A83);
      case 'Social':
        return isSocialSelected
            ? const Color(0xFF0059C8)
            : const Color(0xFF1A6A83);
      case 'Regular':
        return isRegularSelected
            ? const Color(0xFF0059C8)
            : const Color(0xFF1A6A83);
      case 'Heavy':
        return isHeavySelected
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
      case 'Non-Drinker':
        return isNoSelected;
      case 'Rare':
        return isRareSelected;
      case 'Social':
        return isSocialSelected;
      case 'Regular':
        return isRegularSelected;
      case 'Heavy':
        return isHeavySelected;
      default:
        return false;
    }
  }
}
