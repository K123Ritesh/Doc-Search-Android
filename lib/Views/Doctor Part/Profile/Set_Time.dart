import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RowData extends StatefulWidget {
  final String selectedTime1;
  final String selectedTime2;
  final VoidCallback onDelete;

  RowData({
    required this.selectedTime1,
    required this.selectedTime2,
    required this.onDelete,
  });

  @override
  _RowDataState createState() => _RowDataState();
}

class _RowDataState extends State<RowData> {
  late String selectedTime1;
  late String selectedTime2;

  @override
  void initState() {
    super.initState();
    selectedTime1 = widget.selectedTime1;
    selectedTime2 = widget.selectedTime2;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 114,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: DropdownButton<String>(
                  value: selectedTime1,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTime1 = newValue!;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  underline: Container(),
                  items: List.generate(24, (hour) {
                    return DropdownMenuItem<String>(
                      value:
                          DateFormat('HH:mm').format(DateTime(0, 1, 1, hour)),
                      child: Center(
                        child: Text(
                          DateFormat('hh:mm a').format(DateTime(0, 1, 1, hour)),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: selectedTime1 ==
                                    DateFormat('HH:mm')
                                        .format(DateTime(0, 1, 1, hour))
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              'to',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 30,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 114,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: DropdownButton<String>(
                  value: selectedTime2,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTime2 = newValue!;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  underline: Container(),
                  items: List.generate(24, (hour) {
                    return DropdownMenuItem<String>(
                      value:
                          DateFormat('HH:mm').format(DateTime(0, 1, 1, hour)),
                      child: Center(
                        child: Text(
                          DateFormat('hh:mm a').format(
                            DateTime(0, 1, 1, hour),
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: selectedTime2 ==
                                    DateFormat('HH:mm')
                                        .format(DateTime(0, 1, 1, hour))
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: widget.onDelete,
              child: Icon(
                Icons.delete,
                size: 25,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Set_Time_Date extends StatefulWidget {
  const Set_Time_Date({Key? key}) : super(key: key);

  @override
  State<Set_Time_Date> createState() => _Set_Time_DateState();
}

class _Set_Time_DateState extends State<Set_Time_Date> {
  int selectedOption = 0;
  List<String> daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  List<int> selectedOptions = [];
  List<String> options = List.generate(31, (index) => (index + 1).toString());

  String getDayOfWeek(int day) {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, day);
    final dayFormatShort = DateFormat('E');
    return dayFormatShort.format(date);
  }

  String currentTime = DateFormat('HH:mm').format(DateTime.now());
  String selectedTime1 = "08:00";
  String selectedTime2 = "16:00";
  List<String> timeSlots = ["08:00", "12:00", "16:00"];

  String currentDay = '';

  void updateCurrentDay() {
  if (selectedOptions.isNotEmpty) {
    currentDay = DateFormat('EEEE').format(DateTime.now());
  } else if (selectedOption >= 0 && selectedOption < options.length) {
    final day = int.parse(options[selectedOption]);
    currentDay = getDayOfWeek(day);
  }
}


  List<RowData> rowsData = [];

  @override
  void initState() {
    super.initState();
    // Initialize currentDay
    updateCurrentDay();
  }

  void addRow() {
    print("Adding row");
    setState(() {
      rowsData.add(
        RowData(
          selectedTime1: selectedTime1,
          selectedTime2: selectedTime2,
          onDelete: () => deleteRow(rowsData.length - 1),
        ),
      );
    });
  }

  void deleteRow(int index) {
    print("Deleting row at index: $index");
    setState(() {
      rowsData.removeAt(index);
    });
  }

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
            'Set Time & Day',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select working days',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                Text(
                  '(4 days selected)',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(daysOfWeek.length, (index) {
                  final dayOfWeek = daysOfWeek[index];
                  final isSelected = selectedOptions.contains(index);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedOptions.remove(index);
                        } else {
                          selectedOptions.add(index);
                        }
                      });
                    },
                    child: Container(
                      width: 58,
                      height: 30,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0xFF155467),
                        ),
                        color: isSelected ? Colors.white : Color(0xFF155467),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        dayOfWeek,
                        style: TextStyle(
                          color: isSelected ? Color(0xFF155467) : Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Select working Hours',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(options.length, (index) {
                  final day = int.parse(options[index]);
                  final dayOfWeek = getDayOfWeek(day);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedOption = index;
                        updateCurrentDay(); 
                      });
                    },
                    child: Container(
                      width: 46,
                      height: 61,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Color(0xFF155467),
                        ),
                        color: selectedOption == index
                            ? Color(0xFF155467)
                            : Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dayOfWeek,
                            style: TextStyle(
                              color: selectedOption == index
                                  ? Colors.white
                                  : Color(0xFF155467),
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            options[index],
                            style: TextStyle(
                              color: selectedOption == index
                                  ? Colors.white
                                  : Color(0xFF155467),
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '$currentDay',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 114,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          value: selectedTime1,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedTime1 = newValue!;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          underline: Container(),
                          items: List.generate(24, (hour) {
                            return DropdownMenuItem<String>(
                              value: DateFormat('HH:mm')
                                  .format(DateTime(0, 1, 1, hour)),
                              child: Center(
                                child: Text(
                                  DateFormat('hh:mm a')
                                      .format(DateTime(0, 1, 1, hour)),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: selectedTime1 ==
                                            DateFormat('HH:mm')
                                                .format(DateTime(0, 1, 1, hour))
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'to',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 114,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          value: selectedTime2,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedTime2 = newValue!;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          underline: Container(),
                          items: List.generate(24, (hour) {
                            return DropdownMenuItem<String>(
                              value: DateFormat('HH:mm')
                                  .format(DateTime(0, 1, 1, hour)),
                              child: Center(
                                child: Text(
                                  DateFormat('hh:mm a').format(
                                    DateTime(0, 1, 1, hour),
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: selectedTime2 ==
                                            DateFormat('HH:mm')
                                                .format(DateTime(0, 1, 1, hour))
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.delete,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              child: Expanded(
                child: ListView.builder(
                  itemCount: rowsData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        rowsData[index],
                        SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    addRow();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
