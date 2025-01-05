import 'package:calender_new/view/variables.dart';
import 'package:flutter/material.dart';
import 'package:custom_calendar_viewer/custom_calendar_viewer.dart';
import 'package:intl/intl.dart';

class CustomCalendarView extends StatefulWidget {
  const CustomCalendarView({super.key, required this.title});

  final String title;

  @override
  State<CustomCalendarView> createState() => _CustomCalendarViewState();
}

class _CustomCalendarViewState extends State<CustomCalendarView> {
  String locale = 'en';
  List<Date> publicHolidays = [];
  List<Date> weekends = [];
  bool isDataLoaded = false;

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

  List<Date> _getPublicHolidays() {
    return [
      Date(
        date: DateTime.parse("2025-02-15"),
        toolTipArMessage: "Shab e-Barat",
        toolTipEnMessage: "শবে বরাত",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-02-21"),
        toolTipArMessage: "Shaheed Day",
        toolTipEnMessage: "শহীদ দিবস",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-03-26"),
        toolTipArMessage: "Independence Day",
        toolTipEnMessage: "স্বাধীনতা দিবস",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-03-28"),
        toolTipArMessage: "Shab-e-qadr",
        toolTipEnMessage: "শবে কদর",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-03-29"),
        toolTipArMessage: "Eid ul-Fitr Holiday",
        toolTipEnMessage: "ঈদুল ফিতরের ছুটি",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-03-30"),
        toolTipArMessage: "Eid ul-Fitr Holiday",
        toolTipEnMessage: "ঈদুল ফিতরের ছুটি",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-03-31"),
        toolTipArMessage: "Eid ul-Fitr",
        toolTipEnMessage: "ঈদুল ফিতরের ছুটি",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-04-01"),
        toolTipArMessage: "Eid ul-Fitr Holiday",
        toolTipEnMessage: "ঈদুল ফিতরের ছুটি",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-04-02"),
        toolTipArMessage: "Eid ul-Fitr Holiday",
        toolTipEnMessage: "ঈদুল ফিতরের ছুটি",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-04-14"),
        toolTipArMessage: "Pahela Baishakh",
        toolTipEnMessage: "পহেলা বৈশাখ",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-05-01"),
        toolTipArMessage: "May Day",
        toolTipEnMessage: "মে দিবস",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-05-11"),
        toolTipArMessage: "Buddha Purnima",
        toolTipEnMessage: "বুদ্ধ পূর্ণিমা",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-06-05"),
        toolTipArMessage: "Eid al-Adha Holiday",
        toolTipEnMessage: "ঈদুল আযহার ছুটি",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-06-07"),
        toolTipArMessage: "Eid al-Adha",
        toolTipEnMessage: "ঈদুল আযহার ছুটি",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-06-08"),
        toolTipArMessage: "Eid al-Adha",
        toolTipEnMessage: "ঈদুল আযহার ছুটি",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-06-09"),
        toolTipArMessage: "Eid al-Adha",
        toolTipEnMessage: "ঈদুল আযহার ছুটি",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-06-10"),
        toolTipArMessage: "Eid al-Adha",
        toolTipEnMessage: "ঈদুল আযহার ছুটি",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-07-06"),
        toolTipArMessage: "Ashura",
        toolTipEnMessage: "আশুরা",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-08-16"),
        toolTipArMessage: "Janmashtami",
        toolTipEnMessage: "জন্মাষ্টমী",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-09-05"),
        toolTipArMessage: "Eid e-Milad-un Nabi",
        toolTipEnMessage: "ঈদে মিলাদুন্নবী",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-10-01"),
        toolTipArMessage: "Durga Puja",
        toolTipEnMessage: "দুর্গাপূজা",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-10-02"),
        toolTipArMessage: "Durga Puja",
        toolTipEnMessage: "দুর্গাপূজা",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-12-16"),
        toolTipArMessage: "Victory Day",
        toolTipEnMessage: "বিজয় দিবস",
        color: Colors.red,
      ),
      Date(
        date: DateTime.parse("2025-12-25"),
        toolTipArMessage: "Christmas Day",
        toolTipEnMessage: "বড়দিন",
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
        if (date.weekday == DateTime.friday || date.weekday == DateTime.saturday) {
          weekendDates.add(
            Date(
              date: date,
              color: Colors.red.withOpacity(0.5),
              toolTipEnMessage: "সাপ্তাহিক ছুটি",
              toolTipArMessage: "সাপ্তাহিক ছুটি",
              textColor: Colors.red,
            ),
          );
        }
      }
    }
    return weekendDates;
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat("dd/MM/yyyy").format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBED),
      body: SafeArea(
        child: isDataLoaded
            ? Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header showing today's date
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
                // Calendar Viewer
                CustomCalendarViewer(
                  local: locale,
                  //dates: publicHolidays + weekends, // Combine holidays and weekends
                  dates: singleDates,
                  ranges: ranges,
                  calendarType: CustomCalendarType.viewFullYear,
                  showHeader: false,
                  movingArrowSize: 0,
                  headerBackground: const Color(0xFF6464C8).withOpacity(0.5),
                  headerStyle: const TextStyle(fontSize: 15, color: Color(0xFF600404)),
                  daysBodyBackground: const Color(0xFFFFECCB).withOpacity(0.2),
                  daysHeaderBackground: const Color(0xFFF3CA93),
                  calendarBorderColor: const Color(0xFFF3CA93),
                  //animateDirection: CustomCalendarAnimatedDirection.vertical,
                  startYear: 2025,
                  endYear: 2025,
                  showMonthAndYearHeader: false,
                  calendarBorderRadius: 5,
                  calendarBorderWidth: 1,
                  toolTipWaitDuration: const Duration(seconds: 1, microseconds: 500),
                  toolTipPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  showCurrentDayBorder: true,
                  headerAlignment: MainAxisAlignment.spaceBetween,
                  calendarStyle: CustomCalendarStyle.withBorder,
                  showBorderAfterDayHeader: true,
                  showTooltip: true,
                  toolTipMessage: '',
                  calendarStartDay: CustomCalendarStartDay.sunday,
                  onDatesUpdated: (newDates) {
                    print('Updated Dates: ${newDates.length}');
                  },
                  onRangesUpdated: (newRanges) {
                    print('Updated Ranges: ${newRanges.length}');
                  },
                  onDayTapped: (date) {
                    print('Tapped on: $date');
                  },
                  onCalendarUpdate: (date) {
                    print('Calendar Updated to: $date');
                  },
                ),
                const SizedBox(height: 20),
                const Divider(),
              ],
            ),
          ),
        )
            : const Center(
          child: CircularProgressIndicator(), // Show loader until data is ready
        ),
      ),
    );
  }
}
