import 'package:doc_search/Bottom_Bar.dart';
import 'package:doc_search/Config/sizeConfig.dart';
import 'package:flutter/material.dart';

class Feedback_Page extends StatefulWidget {
  const Feedback_Page({super.key});

  @override
  State<Feedback_Page> createState() => _Feedback_PageState();
}

class _Feedback_PageState extends State<Feedback_Page> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Bottombar(),
        body: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF155467),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                SizedBox(
                  height: 20.fh,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 26.fh),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      'Feedback',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Doctors_Feedback(),
                SizedBox(
                  height: 15,
                ),
                Doctors_Feedback(),
                SizedBox(
                  height: 15,
                ),
                Doctors_Feedback()
              ]),
            )),
      ),
    );
  }
}

class Doctors_Feedback extends StatelessWidget {
  const Doctors_Feedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.only(),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SizedBox(width: 5),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                child: Icon(Icons.person, size: 90),
                maxRadius: 50,
                backgroundColor: Color.fromARGB(255, 164, 157, 157),
              ),
            ],
          ),
          SizedBox(
            width: 5.fw,
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Ritesh Kumar\nMBBS,M.D',
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 119, 245, 124),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Surgical Oncology',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 7, 83, 18),
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Malviya Nagar, New Delhi\n15 years experience',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Give_Feedback_Page()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 13, 59, 139),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Give Feedback',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class Give_Feedback_Page extends StatefulWidget {
  const Give_Feedback_Page({super.key});

  @override
  State<Give_Feedback_Page> createState() => _Give_Feedback_PageState();
}

class _Give_Feedback_PageState extends State<Give_Feedback_Page> {
  List<bool> arr = [false, false, false, false, false];

  void updateSrc(int k) {
    for (int i = 0; i <= k; i++) {
      setState(() {
        arr[i] = true;
      });
    }
    for (int i = k + 1; i < 5; i++) {
      setState(() {
        arr[i] = false;
      });
    }
  }

  @override
  void initState() {
    arr[0] = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Color.fromARGB(255, 3, 110, 198)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 26),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      'Feedback',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  child: Icon(Icons.person, size: 90),
                  maxRadius: 50,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dr. Ritesh Kumar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: InkWell(
                          onTap: () {
                            updateSrc(0);
                          },
                          child: arr[0] == false
                              ? Image.network(
                                  'https://s3-alpha-sig.figma.com/img/1801/e0fd/a69c1db59a265b5513950ed25a9c141e?Expires=1699228800&Signature=ghk7XtQegxm0vfZhpsl2~gPVN4~ObRJbn2~UWlYGbinT7E~ZAXqFMqWAlk~Zdbw9k9xHWEAs7kP7SDto6fOSFMbRgf8rVLl626eJowEu8wvzREjoqzlfbUaDCRX9Am5q7WkLRf2u05XWSTcesOfl2xVTuMJc3YI-0Bo-V5X3g944skl~OWFcXRfRppsKj5loWixZWT~1HMt3yJcu~RSBzWGpcgvbN7o-feomS~XZi1IWREWcTmbC2QVmLMdkium9NEULuSMGHVeLAuDlPQqE-9R2uy41w8DWYb56R-hAwm8eW3H7~2zWn0JKXgCC6TK4ZBjiVzi7zT9ddtCuT4eRPA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                  height: 33,
                                  width: 33,
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  'https://s3-alpha-sig.figma.com/img/248a/245d/3b6828d7c17ba94630309cd9cc7a83e9?Expires=1699228800&Signature=MZYAMKvX3OjHahVaHnOx5bORF~rE~oo26y5dfKVq~MzO4HQjoeZ4PN2JqATwdvCISiorDaI8B7ZXxECJgf8IHGqVvNbT-EzmGo0YzgMhAOY6BlF76JvgWKfCNSvYyAuw0syxMbOtal~gr-nTOtBCNYiRqIhDIgxRheybdL~~6gvlq7UA72wgcN4ZXVdzoyhsX91-S5OeQgsxIuKo7fVarkLZwNmu0R7ueixwMPve7Whn2tBo1Cgsp1IfKcDtbhbReUP7AIxD92LTops9KTT6jprl1kJ2~T4wAwb2ALDmIPjCqHw0zOOL578x6An~Id1ErSsPJv4NjvRDvwmGzuPPGA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                  height: 33,
                                  width: 33,
                                  fit: BoxFit.fill,
                                )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: InkWell(
                          onTap: () {
                            updateSrc(1);
                          },
                          child: arr[1] == false
                              ? Image.network(
                                  'https://s3-alpha-sig.figma.com/img/1801/e0fd/a69c1db59a265b5513950ed25a9c141e?Expires=1699228800&Signature=ghk7XtQegxm0vfZhpsl2~gPVN4~ObRJbn2~UWlYGbinT7E~ZAXqFMqWAlk~Zdbw9k9xHWEAs7kP7SDto6fOSFMbRgf8rVLl626eJowEu8wvzREjoqzlfbUaDCRX9Am5q7WkLRf2u05XWSTcesOfl2xVTuMJc3YI-0Bo-V5X3g944skl~OWFcXRfRppsKj5loWixZWT~1HMt3yJcu~RSBzWGpcgvbN7o-feomS~XZi1IWREWcTmbC2QVmLMdkium9NEULuSMGHVeLAuDlPQqE-9R2uy41w8DWYb56R-hAwm8eW3H7~2zWn0JKXgCC6TK4ZBjiVzi7zT9ddtCuT4eRPA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                  height: 33,
                                  width: 33,
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  'https://s3-alpha-sig.figma.com/img/248a/245d/3b6828d7c17ba94630309cd9cc7a83e9?Expires=1699228800&Signature=MZYAMKvX3OjHahVaHnOx5bORF~rE~oo26y5dfKVq~MzO4HQjoeZ4PN2JqATwdvCISiorDaI8B7ZXxECJgf8IHGqVvNbT-EzmGo0YzgMhAOY6BlF76JvgWKfCNSvYyAuw0syxMbOtal~gr-nTOtBCNYiRqIhDIgxRheybdL~~6gvlq7UA72wgcN4ZXVdzoyhsX91-S5OeQgsxIuKo7fVarkLZwNmu0R7ueixwMPve7Whn2tBo1Cgsp1IfKcDtbhbReUP7AIxD92LTops9KTT6jprl1kJ2~T4wAwb2ALDmIPjCqHw0zOOL578x6An~Id1ErSsPJv4NjvRDvwmGzuPPGA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                  height: 33,
                                  width: 33,
                                  fit: BoxFit.fill,
                                )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: InkWell(
                          onTap: () {
                            updateSrc(2);
                          },
                          child: arr[2] == false
                              ? Image.network(
                                  'https://s3-alpha-sig.figma.com/img/1801/e0fd/a69c1db59a265b5513950ed25a9c141e?Expires=1699228800&Signature=ghk7XtQegxm0vfZhpsl2~gPVN4~ObRJbn2~UWlYGbinT7E~ZAXqFMqWAlk~Zdbw9k9xHWEAs7kP7SDto6fOSFMbRgf8rVLl626eJowEu8wvzREjoqzlfbUaDCRX9Am5q7WkLRf2u05XWSTcesOfl2xVTuMJc3YI-0Bo-V5X3g944skl~OWFcXRfRppsKj5loWixZWT~1HMt3yJcu~RSBzWGpcgvbN7o-feomS~XZi1IWREWcTmbC2QVmLMdkium9NEULuSMGHVeLAuDlPQqE-9R2uy41w8DWYb56R-hAwm8eW3H7~2zWn0JKXgCC6TK4ZBjiVzi7zT9ddtCuT4eRPA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                  height: 33,
                                  width: 33,
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  'https://s3-alpha-sig.figma.com/img/248a/245d/3b6828d7c17ba94630309cd9cc7a83e9?Expires=1699228800&Signature=MZYAMKvX3OjHahVaHnOx5bORF~rE~oo26y5dfKVq~MzO4HQjoeZ4PN2JqATwdvCISiorDaI8B7ZXxECJgf8IHGqVvNbT-EzmGo0YzgMhAOY6BlF76JvgWKfCNSvYyAuw0syxMbOtal~gr-nTOtBCNYiRqIhDIgxRheybdL~~6gvlq7UA72wgcN4ZXVdzoyhsX91-S5OeQgsxIuKo7fVarkLZwNmu0R7ueixwMPve7Whn2tBo1Cgsp1IfKcDtbhbReUP7AIxD92LTops9KTT6jprl1kJ2~T4wAwb2ALDmIPjCqHw0zOOL578x6An~Id1ErSsPJv4NjvRDvwmGzuPPGA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                  height: 33,
                                  width: 33,
                                  fit: BoxFit.fill,
                                )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: InkWell(
                          onTap: () {
                            updateSrc(3);
                          },
                          child: arr[3] == false
                              ? Image.network(
                                  'https://s3-alpha-sig.figma.com/img/1801/e0fd/a69c1db59a265b5513950ed25a9c141e?Expires=1699228800&Signature=ghk7XtQegxm0vfZhpsl2~gPVN4~ObRJbn2~UWlYGbinT7E~ZAXqFMqWAlk~Zdbw9k9xHWEAs7kP7SDto6fOSFMbRgf8rVLl626eJowEu8wvzREjoqzlfbUaDCRX9Am5q7WkLRf2u05XWSTcesOfl2xVTuMJc3YI-0Bo-V5X3g944skl~OWFcXRfRppsKj5loWixZWT~1HMt3yJcu~RSBzWGpcgvbN7o-feomS~XZi1IWREWcTmbC2QVmLMdkium9NEULuSMGHVeLAuDlPQqE-9R2uy41w8DWYb56R-hAwm8eW3H7~2zWn0JKXgCC6TK4ZBjiVzi7zT9ddtCuT4eRPA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                  height: 33,
                                  width: 33,
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  'https://s3-alpha-sig.figma.com/img/248a/245d/3b6828d7c17ba94630309cd9cc7a83e9?Expires=1699228800&Signature=MZYAMKvX3OjHahVaHnOx5bORF~rE~oo26y5dfKVq~MzO4HQjoeZ4PN2JqATwdvCISiorDaI8B7ZXxECJgf8IHGqVvNbT-EzmGo0YzgMhAOY6BlF76JvgWKfCNSvYyAuw0syxMbOtal~gr-nTOtBCNYiRqIhDIgxRheybdL~~6gvlq7UA72wgcN4ZXVdzoyhsX91-S5OeQgsxIuKo7fVarkLZwNmu0R7ueixwMPve7Whn2tBo1Cgsp1IfKcDtbhbReUP7AIxD92LTops9KTT6jprl1kJ2~T4wAwb2ALDmIPjCqHw0zOOL578x6An~Id1ErSsPJv4NjvRDvwmGzuPPGA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                  height: 33,
                                  width: 33,
                                  fit: BoxFit.fill,
                                )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: InkWell(
                          onTap: () {
                            updateSrc(4);
                          },
                          child: arr[4] == false
                              ? Image.network(
                                  'https://s3-alpha-sig.figma.com/img/1801/e0fd/a69c1db59a265b5513950ed25a9c141e?Expires=1699228800&Signature=ghk7XtQegxm0vfZhpsl2~gPVN4~ObRJbn2~UWlYGbinT7E~ZAXqFMqWAlk~Zdbw9k9xHWEAs7kP7SDto6fOSFMbRgf8rVLl626eJowEu8wvzREjoqzlfbUaDCRX9Am5q7WkLRf2u05XWSTcesOfl2xVTuMJc3YI-0Bo-V5X3g944skl~OWFcXRfRppsKj5loWixZWT~1HMt3yJcu~RSBzWGpcgvbN7o-feomS~XZi1IWREWcTmbC2QVmLMdkium9NEULuSMGHVeLAuDlPQqE-9R2uy41w8DWYb56R-hAwm8eW3H7~2zWn0JKXgCC6TK4ZBjiVzi7zT9ddtCuT4eRPA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                  height: 33,
                                  width: 33,
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  'https://s3-alpha-sig.figma.com/img/248a/245d/3b6828d7c17ba94630309cd9cc7a83e9?Expires=1699228800&Signature=MZYAMKvX3OjHahVaHnOx5bORF~rE~oo26y5dfKVq~MzO4HQjoeZ4PN2JqATwdvCISiorDaI8B7ZXxECJgf8IHGqVvNbT-EzmGo0YzgMhAOY6BlF76JvgWKfCNSvYyAuw0syxMbOtal~gr-nTOtBCNYiRqIhDIgxRheybdL~~6gvlq7UA72wgcN4ZXVdzoyhsX91-S5OeQgsxIuKo7fVarkLZwNmu0R7ueixwMPve7Whn2tBo1Cgsp1IfKcDtbhbReUP7AIxD92LTops9KTT6jprl1kJ2~T4wAwb2ALDmIPjCqHw0zOOL578x6An~Id1ErSsPJv4NjvRDvwmGzuPPGA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                  height: 33,
                                  width: 33,
                                  fit: BoxFit.fill,
                                )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text('Your Comment(optional)',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: 380,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                      decoration: InputDecoration(border: InputBorder.none)),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return CustomDialog();
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 19,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Color.fromARGB(255, 6, 97, 146),
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                )
              ]),
            )),
      ),
    );
    ;
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      backgroundColor: const Color.fromARGB(255, 13, 59, 139),
      title: Container(
        child: Column(
          children: [
            Icon(
              Icons.favorite,
              size: 76,
              color: Colors.red,
            ),
            SizedBox(height: 10),
            Text(
              'Feedback Submitted',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'OK',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
