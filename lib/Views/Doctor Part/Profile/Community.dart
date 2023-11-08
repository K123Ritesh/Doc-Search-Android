import 'package:doc_search/Views/Doctor%20Part/Profile/Community_post.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B6A85),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B6A85),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
            margin: const EdgeInsets.only(left: 80),
            child: const Text(
              'Community',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        // You can add the image here
                        // backgroundImage: NetworkImage('URL'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Dr. Gaurav Dhokchaule',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Community_Post()));
                  },
                  child: Center(
                    child: Icon(
                      Icons.add_circle_rounded,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 0.5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                // final item = yourDataList[index];
                return Column(
                  children: [
                    ListTile(
                      leading: Container(
                        height: 70,
                        width: 70,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          // You can add the image here
                          // backgroundImage: NetworkImage('URL'),
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(
                            "Dr, Gaurav D",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '767859',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white38),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'As a doctor, I cant stress enough the importance of cancer awareness. Early detection, prevention, and support can make all the difference. Lets stand together in the fight against cancer.#CancerAwareness #EarlyDetection #SupportPatients',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 15,
                                
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '577',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
