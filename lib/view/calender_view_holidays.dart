import 'dart:convert';

import 'package:custom_calendar_viewer/custom_calendar_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CalenderViewHolidays extends StatefulWidget {
  const CalenderViewHolidays({super.key});

  @override
  State<CalenderViewHolidays> createState() => _CalenderViewHolidaysState();
}

class _CalenderViewHolidaysState extends State<CalenderViewHolidays> {
  String local = 'en';
  List<Date> dates = [
    Date(
        date: DateTime(DateTime.now().year, 11, 20),
        color: Colors.red.withOpacity(.5),
        toolTipEnMessage: 'View Message',
        toolTipArMessage: 'رسالة التاريخ',
        textColor: Colors.red),
    Date(
      date: DateTime(DateTime.now().year, 3, 1),
      color: Colors.red,
      toolTipEnMessage: 'Date Message',
      toolTipArMessage: 'رسالة التاريخ',
    ),
    Date(
      date: DateTime(DateTime.now().year, 11, 8),
      color: Colors.red,
      toolTipEnMessage: 'Date Message',
      toolTipArMessage: 'رسالة التاريخ',
    ),
    Date(
      date: DateTime(DateTime.now().year, 11, 10),
      color: Colors.amber,
      toolTipEnMessage: 'Date Message',
      toolTipArMessage: 'رسالة التاريخ',
    ),
    Date(
      date: DateTime(DateTime.now().year, 11, 7),
      color: Colors.amber,
    ),
    Date(
      date: DateTime(DateTime.now().year, 11, 1),
      color: Colors.red,
    ),
    Date(
      date: DateTime(DateTime.now().year, 11, 4),
      color: Colors.white,
      textColor: Colors.red,
    ),
    Date(
      date: DateTime(DateTime.now().year, 11, 5),
      color: Colors.white,
      textColor: Colors.red,
      icon: const Icon(
        Icons.add,
        size: 15,
      ),
    ),
    Date(
      date: DateTime(DateTime.now().year, 11, 18),
      color: Colors.blue,
      textColor: Colors.amber,
      icon: const Icon(
        Icons.add,
        size: 15,
        color: Colors.red,
      ),
    ),
    Date(
      date: DateTime(DateTime.now().year, 11, 22),
      icon: const Row(
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: Colors.red,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.add,
            size: 15,
          ),
        ],
      ),
    ),
  ];
  List<RangeDate> ranges = [
    RangeDate(
      start: DateTime(DateTime.now().year, 11, 12),
      end: DateTime(DateTime.now().year, 11, 15),
      color: Colors.red,
      icon: const Icon(
        Icons.add,
        size: 15,
      ),
      toolTipEnMessage: 'Range Message',
      toolTipArMessage: 'رسالة المدي',
    ),
    RangeDate(
      start: DateTime(DateTime.now().year, 11, 24),
      end: DateTime(DateTime.now().year, 11, 27),
      color: Colors.amber,
      icon: const Icon(
        Icons.add,
        size: 15,
        color: Colors.red,
      ),
      toolTipEnMessage: 'Holiday Message',
      toolTipArMessage: 'رسالة المدي',
    ),
    RangeDate(
      start: DateTime(DateTime.now().year, 11, 30),
      end: DateTime(DateTime.now().year, 11, 29),
    ),
  ];
  List<Date> holidays = [];
  Map<Date, String> holidayMessages = {};
  List<Date> highlightedDates = [];
  @override
  void initState() {
    super.initState();
    _loadHolidays(); // Load holidays on initialization
  }

  Future<List<Date>> loadTotalHolidayData(String jsonFilePath) async {
    String jsonString = await rootBundle.loadString(jsonFilePath);
    List<dynamic> jsonData = jsonDecode(jsonString);

    List<Date> publicHolidays = [];
    Map<Date, String> messages = {};

    for (var holiday in jsonData) {
      DateTime dateTime = DateTime.parse(holiday['date']);
      Date date = Date(
        date: dateTime,
        color: Colors.purpleAccent.withOpacity(.5),
        textColor: Colors.red,
        toolTipEnMessage: '${holiday['title']} (${holiday['titleBn']})',
      );

      publicHolidays.add(date);

      messages[date] = '${holiday['title']} (${holiday['titleBn']})';
    }

    setState(() {
      holidayMessages = messages; // Update holidayMessages
    });

    return publicHolidays;
  }

  Future<void> _loadHolidays() async {
    List<Date> allHolidays = await loadTotalHolidayData('assets/json/holidays.json');
    setState(() {
      highlightedDates = allHolidays;
      holidays = allHolidays;
    });
  }

  void _showHolidayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('oooo'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static String? formatDateTime4(DateTime? dateTime) {
    if (dateTime == null) return null;
    return DateFormat("dd/MM/yyyy").format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Today ${formatDateTime4(DateTime.now())}',
                  style: const TextStyle(fontSize: 18),
                ),
                const Divider(),
                CustomCalendarViewer(
                  calendarBorderColor: Colors.indigoAccent,
                  local: local,
                  dates: holidays,
                  ranges: ranges,
                  calendarType: CustomCalendarType.viewFullYear,
                  showHeader: true,
                  headerAlignment: MainAxisAlignment.center,
                  calendarStyle: CustomCalendarStyle.withBorder,
                  spaceBetweenMovingArrow: 20,
                  showBorderAfterDayHeader: true,
                  showTooltip: true,
                  onDatesUpdated: (newDates) {
                    print('onDatesUpdated');
                    print(newDates.length);
                  },
                  onRangesUpdated: (newRanges) {
                    print('onRangesUpdated');
                    print(newRanges.length);
                  },
                  onDayTapped: (date) {
                    // Display a message for the selected holiday
                    Date tappedDate = Date(date: date);
                    if (holidayMessages.containsKey(tappedDate)) {
                      _showHolidayMessage(holidayMessages[tappedDate]!);
                    } else {
                      _showHolidayMessage("No events for this date.");
                    }
                  },
                  onCalendarUpdate: (date) {
                    print('onCalendarUpdate: $date');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
