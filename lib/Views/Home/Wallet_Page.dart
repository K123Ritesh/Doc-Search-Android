import 'package:doc_search/Config/sizeConfig.dart';
import 'package:flutter/material.dart';
import '../../Bottom_Bar.dart';
import 'Home_Page.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 100),
                            child: Text(
                              'Wallet',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 45.fw),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 83, 130, 211),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.account_balance_wallet,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(width: 8),
                              Text(
                                '100',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Doc',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1A6A83),
                          ),
                        ),
                        Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          ' Wallet',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      '300.0',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A6A83),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'expiring in 10 days',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1A6A83),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 25,
            width: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF3F849C),
            ),
            child: TabBar(
              controller: _tabController,
              tabs: [
                buildTab("Redeem", 0),
                buildTab("History", 1),
              ],
              indicatorColor: Colors.transparent,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          height: 88,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF3F849C),
                              ),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('assets/Rectangle 5698.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Paste Your Referral Code',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                    'here to get 100 coins.',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 47.fw,
                                        height: 24.fh,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF155467),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            style:
                                                TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'CODE',
                                              hintStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                      
                                      Container(
                                        margin: EdgeInsets.only(left: 70.fw),
                                        width: 47.fw,
                                        height: 24.fh,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF155467),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Center(
                                              child: Text(
                                            'Claim',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(right: 20, left: 20),
                          height: 88,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF155467),
                              ),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('assets/Rectangle 5698.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Paste Your Referral Code',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                    'here to get 100 coins.',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: 71,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF155467),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Center(
                                          child: Text(
                                        'Book Now',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(right: 20, left: 20, top: 20),
                          height: 88,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF155467),
                              ),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('assets/Rectangle 5698.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Paste Your Referral Code',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                    'here to get 100 coins.',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: 71,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF155467),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Center(
                                          child: Text(
                                        'Book Now',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                  ],
                ),

                // Content for Medical tab
                Column(
                  children: [
                    Container(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Bottombar(),
    );
  }

  Widget buildTab(String text, int tabIndex) {
    return Container(
      height: 25,
      width: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: _tabController.index == tabIndex
            ? Color(0xFF155467)
            : Color(0xFF3F849C),
      ),
      child: GestureDetector(
        onTap: () {
          _tabController.index = tabIndex;
        },
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
