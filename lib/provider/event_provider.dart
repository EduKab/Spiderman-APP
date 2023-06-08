import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier{

  final List<Meeting> events = [
    Meeting('Game', DateTime(2023, 3, 26, 9, 0, 0), DateTime(2023, 3, 26, 11, 0, 0), const Color.fromARGB(255, 134, 15, 15), false),
    Meeting('Shops', DateTime(2023, 3, 27, 9, 0, 0), DateTime(2023, 3, 27, 12, 0, 0), const Color.fromARGB(255, 15, 134, 94), false)
  ];

  void addEvent(Meeting meeting){
    events.add(meeting);

    notifyListeners();
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}