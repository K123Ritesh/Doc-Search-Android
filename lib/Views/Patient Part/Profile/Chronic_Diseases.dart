import 'package:flutter/material.dart';

class Chronic_Diseases extends StatefulWidget {
  const Chronic_Diseases({Key? key}) : super(key: key);

  @override
  State<Chronic_Diseases> createState() => _Chronic_DiseasesState();
}

class _Chronic_DiseasesState extends State<Chronic_Diseases> {
  bool isNoSelected = false;
  bool isAddIllnessSelected = false;

  void toggleSelection(bool isNo) {
    setState(() {
      isNoSelected = isNo;
      isAddIllnessSelected = !isNo;
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
            'Chronic Diseases',
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
              'Do you have any chronic illnesses?',
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
                      color: isAddIllnessSelected
                          ? const Color(0xFF0059C8)
                          : const Color(0xFF1A6A83),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Add an illness',
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
                          child: isAddIllnessSelected
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
