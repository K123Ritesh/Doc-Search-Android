import 'package:doc_search/Bottom_Bar.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:url_launcher/url_launcher.dart';

class Refer_And_Earn_Page extends StatefulWidget {
  const Refer_And_Earn_Page({super.key});

  @override
  State<Refer_And_Earn_Page> createState() => _Refer_And_Earn_PageState();
}

class _Refer_And_Earn_PageState extends State<Refer_And_Earn_Page> {
  @override
  Widget build(BuildContext context) {
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
                      'Refer and Earn',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Image.network(
                  "https://s3-alpha-sig.figma.com/img/dc9f/8c38/20c4e5b8a45e1599fc6fe5c6c04f4179?Expires=1699228800&Signature=EBXgb188NA2~ar9fVM8eWq2zZqYnc80aD4FVH8yp8yyeQcTroYMzfa5tRJNWNCe7qikLkQvGhXX9cU8uOP4VZ1iRYckzY69OcBIhFrdDcSqyzJfItH8jqT0cQR1vOozP1wHZFlCh6cJpmbi9f97ivBWDMsxAIeZmaTGVaM5GJULmJfFFi5~vbDi2ayYrzAvlipubE8OI2Mh7tyR5lHabAWPPyb4LeTDZ-45R3B9yY54u8Tb4Ar5NpDkqBoMvwqLz1Zp9ZfMCbNlV7P~6L2P999BnsordkpHxx6EtgvGYsbIR~5Uxm9FXar1XXESR3yNvLjTv0GoiWQwlBm5EGj0Zvw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  height: 298,
                  width: 298,
                ),
                Text(
                  "Sharing is Rewarding",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Get 100 in your DOC search wallet \n       when you invite your friend",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Refer Using Refferal code",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                ReferralCodeBox(referralCode: "XYzRC3"),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  'OR',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      height: 33,
                      width: 230,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(
                              height: 24,
                              width: 30,
                              'https://s3-alpha-sig.figma.com/img/fc39/822d/4f0d87c00046b984c9fbfc08eb3be9b6?Expires=1699228800&Signature=a5hFvuDmOq52eWJALNBvy5cOT1rvYru3UZOHBUN0eigKKHIn4vIzuQz2RNwFu0YP~~nbAZq4DCQ0~Py3YEZYvwVPbltMiNTyakxFAiljinBika5UT3cId~U8iOLuqmgVJvY9fUWfRnOoL50cFVg53HodXAJPE6qBnOh3v4v-Jp9n5sfIL-exD~UGmBdeyAlm5MCZ~uoPD9J79zwqsmiF5Tr33JQvQ4sH7J3B7vtKOXcfuq1tyI5avCs2V9n0FxD3cTWFKxVa-AvmNp6dLIYhJyjhpBN6kKdDkoYsfZcAWQlsN~gR3AAqV0cDYlGdXxUgyW0OGtGO5FmZEiM~1naJ4w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                            ),
                            Text(
                              'Refer via Whatsapp',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 65, 255, 71),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        final content =
                            "Check out this amazing video: https://example.com/video"; // Replace with your video or link content

                        final url =
                            "https://wa.me/?text=${Uri.encodeComponent(content)}";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          // Handle errors if WhatsApp couldn't be launched
                          print("Could not launch WhatsApp");
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 33,
                        width: 230,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.network(
                                height: 24,
                                width: 30,
                                'https://s3-alpha-sig.figma.com/img/ee6b/3f48/b89ad3b69027b4448422cdfd225c0901?Expires=1699228800&Signature=figvoE9HfxYgq8ZV4WeXdw8yYThj2vFISwHnUm3ygv7pCOrcNgG3qQxi41jf7duyAjKpQ4qmqTXbw7gRy674qLf1kleOWiCZ7Ci8TVHqd0-yHto80ZKgof6snUOJRYvwO1GHemfSkco7Z7be-deVKazxUJlgfGmg0FK9Eu1puQfaIIuaCWNBXHopU4-dmglnLn04hLr17dLmIDRqpeo2lP9XEo1W39-WM9IxrguCHnFBR9XeF-7URLTLFqVYfZhZSArtvbaIjo8ay2e1J4shUqTRv8YzFZs~ZtHrY4IxZ2YYh8PVx0Ng5RYK7ig9IsDqLmUTjo-yTmA-XVj~ft6b~Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                              ),
                              Text(
                                'Refer via Facebook',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 29, 107, 171),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ]),
            )),
      ),
    );
  }
}

class ReferralCodeBox extends StatelessWidget {
  final String referralCode;

  ReferralCodeBox({required this.referralCode});

  void copyToClipboard(String text, context) {
    FlutterClipboard.copy(text).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Copied to clipboard: $text'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 260,
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.black)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              referralCode,
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 30, 14),
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                copyToClipboard(referralCode, context);
              },
              child: Icon(
                Icons.content_copy,
                color: Colors.blue,
                size: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
