import 'package:custom_calendar_viewer/custom_calendar_viewer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleCalendarView extends StatefulWidget {
  const SingleCalendarView({super.key});

  @override
  State<SingleCalendarView> createState() => _SingleCalendarViewState();
}

class _SingleCalendarViewState extends State<SingleCalendarView> {
  String locale = 'en';
  List<Date> publicHolidays = [];
  List<Date> weekends = [];
  bool isDataLoaded = false;
  List<Date> _getPublicHolidays() {
    return [
      Date(
        date: DateTime.parse("2025-02-15"),
        toolTipArMessage: "Shab e-Barat",
        toolTipEnMessage: "Shab e-Barat",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-02-21"),
        toolTipArMessage: "Shaheed Day",
        toolTipEnMessage: "Shaheed Day",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-03-26"),
        toolTipArMessage: "Independence Day",
        toolTipEnMessage: "Independence Day",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-03-28"),
        toolTipArMessage: "Shab-e-qadr",
        toolTipEnMessage: "Shab-e-qadr",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-03-29"),
        toolTipArMessage: "Eid ul-Fitr",
        toolTipEnMessage: "Eid ul-Fitr",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-03-30"),
        toolTipArMessage: "Eid ul-Fitr",
        toolTipEnMessage: "Eid ul-Fitr",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-03-31"),
        toolTipArMessage: "Eid ul-Fitr",
        toolTipEnMessage: "Eid ul-Fitr",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-04-01"),
        toolTipArMessage: "Eid ul-Fitr",
        toolTipEnMessage: "Eid ul-Fitr",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-04-02"),
        toolTipArMessage: "Eid ul-Fitr",
        toolTipEnMessage: "Eid ul-Fitr",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-04-14"),
        toolTipArMessage: "Pahela Baishakh",
        toolTipEnMessage: "Pahela Baishakh",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-05-01"),
        toolTipArMessage: "May Day",
        toolTipEnMessage: "May Day",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-05-11"),
        toolTipArMessage: "Buddha Purnima",
        toolTipEnMessage: "Buddha Purnima",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-06-05"),
        toolTipArMessage: "Eid al-Adha",
        toolTipEnMessage: "Eid al-Adha",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-06-07"),
        toolTipArMessage: "Eid al-Adha",
        toolTipEnMessage: "Eid al-Adha",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-06-08"),
        toolTipArMessage: "Eid al-Adha",
        toolTipEnMessage: "Eid al-Adha",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-06-09"),
        toolTipArMessage: "Eid al-Adha",
        toolTipEnMessage: "Eid al-Adha",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-06-10"),
        toolTipArMessage: "Eid al-Adha",
        toolTipEnMessage: "Eid al-Adha",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-07-06"),
        toolTipArMessage: "Ashura",
        toolTipEnMessage: "Ashura",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-08-16"),
        toolTipArMessage: "Janmashtami",
        toolTipEnMessage: "Janmashtami",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-09-05"),
        toolTipArMessage: "Eid e-Milad-un Nabi",
        toolTipEnMessage: "Eid e-Milad-un Nabi",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-10-01"),
        toolTipArMessage: "Durga Puja",
        toolTipEnMessage: "Durga Puja",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-10-02"),
        toolTipArMessage: "Durga Puja",
        toolTipEnMessage: "Durga Puja",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-12-16"),
        toolTipArMessage: "Victory Day",
        toolTipEnMessage: "Victory Day",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-12-25"),
        toolTipArMessage: "Christmas Day",
        toolTipEnMessage: "Christmas Day",
        color: Colors.red,
      ),
    ];
  }

  List<Date> _getWeekends(int year) {
    List<Date> weekendDates = [];
    for (int month = 1; month <= 12; month++) {
      int daysInMonth = DateTime(year, month + 1, 0).day;
      for (int day = 1; day <= daysInMonth; day++) {
        DateTime date = DateTime(year, month, day);
        if (date.weekday == DateTime.friday ||
            date.weekday == DateTime.saturday) {
          weekendDates.add(
            Date(
              date: date,
              color: Colors.red.withOpacity(0.5),
              toolTipEnMessage: "Weekend",
              toolTipArMessage: "সাপ্তাহিক ছুটি",
              textColor: Colors.red,
            ),
          );
        }
      }
    }
    return weekendDates;
  }

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    // Load holidays and weekends
    List<Date> loadedHolidays = _getPublicHolidays();
    List<Date> loadedWeekends = _getWeekends(DateTime.now().year);

    setState(() {
      publicHolidays = loadedHolidays;
      weekends = loadedWeekends;
      isDataLoaded = true; // Mark data as loaded
    });
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat("dd/MM/yyyy").format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBED),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECCB).withOpacity(0.5),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
              child: Text(
                'Holiday Year: ${DateTime.now().year}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomCalendarViewer(
              headerMargin: const EdgeInsets.symmetric(horizontal: 22),
              daysMargin: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              local: locale,
              dates: publicHolidays + weekends,
              calendarType: CustomCalendarType.view,
              calendarStyle: CustomCalendarStyle.normal,
              duration: const Duration(microseconds: 100),
              animateDirection: CustomCalendarAnimatedDirection.horizontal,
              calendarBorderColor: Colors.black,
              headerStyle:
                  const TextStyle(fontSize: 20, color: Color(0xFF600404)),
              daysBodyBackground: const Color(0xFFFFECCB).withOpacity(0.2),
              daysHeaderBackground: const Color(0xFFFFECCB),
              toolTipWaitDuration:
                  const Duration(seconds: 1, microseconds: 500),
              toolTipPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              showMonthAndYearHeader: true,
              showHeader: true,
              movingArrowSize: 12,
              startYear: 2025,
              endYear: 2025,
              spaceBetweenMovingArrow: 40,
              closeDateBefore: DateTime.now(),
              closedDatesColor: Colors.grey.withOpacity(0.7),
              showBorderAfterDayHeader: false,
              dayNameStyle: const TextStyle(),
              showCurrentDayBorder: true,
              showTooltip: true,
              toolTipMessage: '',
              headerAlignment: MainAxisAlignment.spaceBetween,
              calendarStartDay: CustomCalendarStartDay.sunday,
              onDayTapped: (date) {
                print(date);
              },
              onCalendarUpdate: (date) {
                // Handel your code here.
                print('onCalendarUpdate');
                print(date);
              },
              onDatesUpdated: (newDates) {
                print('onDatesUpdated');
                print(newDates.length);
              },
              onRangesUpdated: (newRanges) {
                print('onRangesUpdated');
                print(newRanges.length);
              },
              //showCurrentDayBorder: false,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECCB).withOpacity(0.5),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
              child: Text(
                'Today: ${formatDateTime(DateTime.now())}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Note: Tap on any holiday date to see details!",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
