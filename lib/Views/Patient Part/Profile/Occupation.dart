import 'package:flutter/material.dart';

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

  void toggleSelection(String option) {
    setState(() {
      isITProfessionalSelected = option == 'IT-Professional';
      isMedicalProfessionalSelected = option == 'Medical-Professional';
      isBankingProfessionalSelected = option == 'Banking-Professional';
      isStudentSelected = option == 'Student';
      isOtherSelected = option == 'Other';
    });
  }

  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
        return isITProfessionalSelected ? const Color(0xFF0059C8) : const Color(0xFF1A6A83);
      case 'Medical-Professional':
        return isMedicalProfessionalSelected ? const Color(0xFF0059C8) : const Color(0xFF1A6A83);
      case 'Banking-Professional':
        return isBankingProfessionalSelected ? const Color(0xFF0059C8) : const Color(0xFF1A6A83);
      case 'Student':
        return isStudentSelected ? const Color(0xFF0059C8) : const Color(0xFF1A6A83);
      case 'Other':
        return isOtherSelected ? const Color(0xFF0059C8) : const Color(0xFF1A6A83);
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
