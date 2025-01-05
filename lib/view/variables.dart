// List of public holidays
import 'package:custom_calendar_viewer/custom_calendar_viewer.dart';
import 'package:flutter/material.dart';

List<Date> publicHolidays = [
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
    toolTipEnMessage: "ঈদুল ফিতরের আগের দিন",
    color: Colors.red,
  ),
  Date(
    date: DateTime.parse("2025-03-30"),
    toolTipArMessage: "Eid ul-Fitr Holiday",
    toolTipEnMessage: "ঈদুল ফিতরের আগের দিন",
    color: Colors.red,
  ),
  Date(
    date: DateTime.parse("2025-03-31"),
    toolTipArMessage: "Eid ul-Fitr",
    toolTipEnMessage: "ঈদুল ফিতর",
    color: Colors.red,
  ),
  Date(
    date: DateTime.parse("2025-04-01"),
    toolTipArMessage: "Eid ul-Fitr Holiday",
    toolTipEnMessage: "ঈদুল ফিতরের পরের দিন",
    color: Colors.red,
  ),
  Date(
    date: DateTime.parse("2025-04-02"),
    toolTipArMessage: "Eid ul-Fitr Holiday",
    toolTipEnMessage: "ঈদুল ফিতরের পরের দিন",
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
    toolTipEnMessage: "ঈদুল আযহার আগের দিন",
    color: Colors.red,
  ),
  Date(
    date: DateTime.parse("2025-06-07"),
    toolTipArMessage: "Eid al-Adha",
    toolTipEnMessage: "ঈদুল আযহা",
    color: Colors.red,
  ),
  Date(
    date: DateTime.parse("2025-06-08"),
    toolTipArMessage: "Eid al-Adha",
    toolTipEnMessage: "ঈদুল আযহা",
    color: Colors.red,
  ),
  Date(
    date: DateTime.parse("2025-06-09"),
    toolTipArMessage: "Eid al-Adha",
    toolTipEnMessage: "ঈদুল আযহা",
    color: Colors.red,
  ),
  Date(
    date: DateTime.parse("2025-06-10"),
    toolTipArMessage: "Eid al-Adha",
    toolTipEnMessage: "ঈদুল আযহা",
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

List<Date> singleDates = [
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

List<RangeDate> allRanges = [
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