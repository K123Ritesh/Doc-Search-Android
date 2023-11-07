import 'package:doc_search/Views/Patient%20Part/Profile/Edit_User_Profile.dart';
import 'package:doc_search/Views/Patient%20Part/Profile/Profile_Page.dart';
import 'package:flutter/material.dart';

class Activity_Level extends StatefulWidget {
  const Activity_Level({super.key});

  @override
  State<Activity_Level> createState() => _Activity_LevelState();
}

class _Activity_LevelState extends State<Activity_Level> {
  bool isBlueNo = false;
  bool AddAllergy = false;
  bool AddSocial = false;
  bool AddRegular = false;

  void toggleColorNo() {
    setState(() {
      isBlueNo = !isBlueNo;
    });
  }

  void toggleColorAddAllergy() {
    setState(() {
      AddAllergy = !AddAllergy;
    });
  }
  void toggleColorAddSocial() {
    setState(() {
      AddSocial = !AddSocial;
    });
  }
  void toggleColorAddRegular() {
    setState(() {
      AddRegular = !AddRegular;
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
                  fontWeight: FontWeight.w600),
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //     margin: EdgeInsets.only(left: 48),
          //     child: Text(
          //       'Are you allergic to anything?',
          //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          //     )),
          Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF1A6A83),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Low',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        InkWell(
                          onTap: toggleColorNo,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: isBlueNo
                                  ? LinearGradient(
                                      colors: [
                                        Color(0xFF0059C8),
                                        Color(0xFF0059C8)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    )
                                  : LinearGradient(
                                      colors: [
                                        Color(0xFFFFFFFF),
                                        Color(0xFFFFFFFF)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF1A6A83),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Normal',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        InkWell(
                          onTap: toggleColorAddAllergy,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AddAllergy
                                  ? LinearGradient(
                                      colors: [
                                        Color(0xFF0059C8),
                                        Color(0xFF0059C8)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    )
                                  : LinearGradient(
                                      colors: [
                                        Color(0xFFFFFFFF),
                                        Color(0xFFFFFFFF)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF1A6A83),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'High',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        InkWell(
                          onTap: toggleColorAddSocial,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AddSocial
                                  ? LinearGradient(
                                      colors: [
                                        Color(0xFF0059C8),
                                        Color(0xFF0059C8)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    )
                                  : LinearGradient(
                                      colors: [
                                        Color(0xFFFFFFFF),
                                        Color(0xFFFFFFFF)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF1A6A83),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Very High',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        InkWell(
                          onTap: toggleColorAddRegular,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AddRegular
                                  ? LinearGradient(
                                      colors: [
                                        Color(0xFF0059C8),
                                        Color(0xFF0059C8)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    )
                                  : LinearGradient(
                                      colors: [
                                        Color(0xFFFFFFFF),
                                        Color(0xFFFFFFFF)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                            ),
                          ),
                        )
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
}
