import 'package:flutter/material.dart';

class Activity_Level extends StatefulWidget {
  const Activity_Level({Key? key}) : super(key: key);

  @override
  State<Activity_Level> createState() => _Activity_LevelState();
}

class _Activity_LevelState extends State<Activity_Level> {
  bool isLowSelected = false;
  bool isNormalSelected = false;
  bool isHighSelected = false;
  bool isVeryHighSelected = false;

  void toggleSelection(String option) {
    setState(() {
      isLowSelected = option == 'Low';
      isNormalSelected = option == 'Normal';
      isHighSelected = option == 'High';
      isVeryHighSelected = option == 'Very High';
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
            'Activity Level',
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
                buildToggleButton('Low'),
                buildToggleButton('Normal'),
                buildToggleButton('High'),
                buildToggleButton('Very High'),
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
      case 'Low':
        return isLowSelected ? const Color(0xFF0059C8) : const Color(0xFF1A6A83);
      case 'Normal':
        return isNormalSelected ? const Color(0xFF0059C8) : const Color(0xFF1A6A83);
      case 'High':
        return isHighSelected ? const Color(0xFF0059C8) : const Color(0xFF1A6A83);
      case 'Very High':
        return isVeryHighSelected ? const Color(0xFF0059C8) : const Color(0xFF1A6A83);
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
      case 'Low':
        return isLowSelected;
      case 'Normal':
        return isNormalSelected;
      case 'High':
        return isHighSelected;
      case 'Very High':
        return isVeryHighSelected;
      default:
        return false;
    }
  }
}
