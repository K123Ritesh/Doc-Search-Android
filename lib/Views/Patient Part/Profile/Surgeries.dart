import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Surgeries extends StatefulWidget {
  const Surgeries({Key? key}) : super(key: key);

  @override
  State<Surgeries> createState() => _SurgeriesState();
}

class _SurgeriesState extends State<Surgeries> {
  bool isNoSelected = true;
  bool isAddSurgerySelected = false;

  void toggleSelection(bool isNo) {
    setState(() {
      isNoSelected = isNo;
      isAddSurgerySelected = !isNo;
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
            'Surgeries',
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
          Container(
            margin: EdgeInsets.only(left: 48),
            child: Text(
              'Any Past Surgeries?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => toggleSelection(true),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isNoSelected
                          ? const Color(0xFF0059C8)
                          : const Color(0xFF1A6A83),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'No',
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
                          child: isNoSelected
                              ? Icon(
                                  Icons.check,
                                  color: const Color(0xFF0059C8),
                                )
                              : Container(
                                  width: 24,
                                  height: 24,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => toggleSelection(false),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isAddSurgerySelected
                          ? const Color(0xFF0059C8)
                          : const Color(0xFF1A6A83),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Add a surgery',
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
                          child: isAddSurgerySelected
                              ? Icon(
                                  Icons.check,
                                  color: const Color(0xFF0059C8),
                                )
                              : Container(
                                  width: 24,
                                  height: 24,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                isAddSurgerySelected == true
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0.w, vertical: 15.0.h),
                        child: Container(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Enter the Surgery',
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
                    if (isNoSelected) {}
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
          ),
        ],
      ),
    );
  }
}
