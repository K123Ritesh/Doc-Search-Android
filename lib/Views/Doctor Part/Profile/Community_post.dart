import 'package:flutter/material.dart';

class Community_Post extends StatefulWidget {
  const Community_Post({super.key});

  @override
  State<Community_Post> createState() => _Community_PostState();
}

class _Community_PostState extends State<Community_Post> {
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
            margin: EdgeInsets.only(top: 20, left: 20, right: 20,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 32,
                    width: 68,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Post',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  // Leading image
                  CircleAvatar(
                    // Add your image here
                    // backgroundImage: AssetImage('your_image_path'),
                    radius: 24, // Adjust the radius as needed
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: "What's your thought?",
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none, 
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
