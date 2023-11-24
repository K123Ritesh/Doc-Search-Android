import 'package:doc_search/Config/sizeConfig.dart';
import 'package:doc_search/Providers/User_Part_Provider/User_Provider.dart';
import 'package:doc_search/Views/Patient%20Part/Home/Prescription_Upload_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class My_Order extends StatefulWidget {
  const My_Order({super.key});

  @override
  State<My_Order> createState() => _My_OrderState();
}

class _My_OrderState extends State<My_Order> {
  List<bool> _selectedStatus = [true, false, false, false];
  List<bool> _selectedTime = [true, false, false, false];

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Text(
            'Filter Options',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFilterOption(
                    'Status',
                    ['All', 'Pending', 'Completed', 'Cancelled'],
                    _selectedStatus),
                SizedBox(height: 10),
                _buildFilterOption(
                    'Time',
                    ['Any Time', 'Today', 'This Week', 'This Month'],
                    _selectedTime),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(
      String title, List<String> options, List<bool> selectedOptions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Column(
          children: options
              .asMap()
              .entries
              .map(
                (entry) => Row(
                  children: [
                    Checkbox(
                      value: selectedOptions[entry.key],
                      onChanged: (bool? value) {
                        setState(() {
                          if (entry.key == 0) {
                            for (int i = 0; i < selectedOptions.length; i++) {
                              selectedOptions[i] = false;
                            }
                          }
                          selectedOptions[entry.key] = value ?? false;
                        });
                      },
                    ),
                    Text(entry.value),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<User_Provider>(context);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFF155467),
      appBar: AppBar(
        backgroundColor: const Color(0xFF155467),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          margin: EdgeInsets.only(left: 80),
          child: Text(
            'My Order',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xFF5793A8), width: 1.0),
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search your order here...',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  _showFilterDialog(context);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 59,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Filter')],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userProvider.ans.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 114.fh,
                  margin: EdgeInsets.only(left: 20, top: 20.fh, right: 20.fw),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10.fw),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 53.fw,
                                      height: 50.fh,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF1A6A83),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.fw,
                                    ),
                                    Text(
                                      userProvider.ans[index]!.shopName,
                                      style: TextStyle(
                                        fontSize: 11.fh,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF155467),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.fh,
                                    ),
                                    Text(
                                      'Rs 310',
                                      style: TextStyle(
                                        fontSize: 11.fh,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF155467),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 20.fh,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.circle,
                                        size: 9.fh, color: Colors.green),
                                    Text(
                                      userProvider.ans[index]!.Status,
                                      style: TextStyle(
                                        fontSize: 10.fh,
                                        color: Color(0xFF155467),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Order Done',
                                  style: TextStyle(
                                    fontSize: 10.fh,
                                    color: Color(0xFF155467),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Prescription_Upload_Page(
                                            shopId: 'rit11@gmail.com',
                                          )),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1A6A83),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Container(
                                height: 24,
                                // width: 99,
                                child: Center(
                                  child: Text(
                                    'Reorder Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
