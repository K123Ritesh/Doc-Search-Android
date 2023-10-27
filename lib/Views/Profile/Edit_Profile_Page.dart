import 'package:doc_search/Views/Profile/Allergies_Page.dart';
import 'package:doc_search/Views/Profile/Profile_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Home/Home_Page.dart';
import 'Smoking_Habit_Page.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile>
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 3, 110, 198)));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 110, 198),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 110, 198),
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
          const SizedBox(
            height: 10,
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
                buildTab("Medical", 1),
                buildTab("Lifestyle", 2),
              ],
              indicatorColor: Colors.transparent,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Allergies',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Allergies()),
                                );
                              },
                              child: const Text(
                                'add',
                                style: TextStyle(
                                    color: Color(0xFF24708B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Current Medications',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'add',
                                style: TextStyle(
                                    color: Color(0xFF24708B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Past Medications',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'add',
                                style: TextStyle(
                                    color: Color(0xFF24708B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Chronic Diseases',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'add',
                                style: TextStyle(
                                    color: Color(0xFF24708B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Injuries',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'add',
                                style: TextStyle(
                                    color: Color(0xFF24708B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Surgeries',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'add',
                                style: TextStyle(
                                    color: Color(0xFF24708B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Smoking Habits',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SmokingHabbit()),
                                );
                              },
                              child: const Text(
                                'add',
                                style: TextStyle(
                                    color: Color(0xFF24708B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Alcohol Consumption',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'add',
                                style: TextStyle(
                                    color: Color(0xFF24708B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Activity Level',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'add',
                                style: TextStyle(
                                    color: Color(0xFF24708B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Food Preference',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'add',
                                style: TextStyle(
                                    color: Color(0xFF24708B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Occupation',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'add',
                                style: TextStyle(
                                    color: Color(0xFF24708B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
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
