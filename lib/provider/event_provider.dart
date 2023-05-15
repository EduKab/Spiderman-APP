import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier{

  final List<Meeting> events = [
    Meeting('Game', DateTime(2023, 3, 26, 9, 0, 0), DateTime(2023, 3, 26, 11, 0, 0), const Color.fromARGB(255, 134, 15, 15), false),
    Meeting('Shops', DateTime(2023, 3, 27, 9, 0, 0), DateTime(2023, 3, 27, 12, 0, 0), const Color.fromARGB(255, 15, 134, 94), false)
  ];

  void addEvent(){
    events.add(Meeting('Look', DateTime(2023, 3, 24, 9, 0, 0), DateTime(2023, 3, 24, 9, 0, 0), const Color.fromARGB(255, 128, 254, 212), true));
    events.add(Meeting('Look', DateTime(2023, 3, 25, 9, 0, 0), DateTime(2023, 3, 25, 9, 0, 0), const Color.fromARGB(255, 128, 254, 212), false));
    events.add(Meeting('Look', DateTime(2023, 3, 28, 9, 0, 0), DateTime(2023, 3, 28, 9, 0, 0), const Color.fromARGB(255, 128, 254, 212), false));
    events.add(Meeting('Look', DateTime(2023, 3, 29, 9, 0, 0), DateTime(2023, 3, 29, 9, 0, 0), const Color.fromARGB(255, 128, 254, 212), false));
    events.add(Meeting('Look', DateTime(2023, 3, 30, 9, 0, 0), DateTime(2023, 3, 30, 9, 0, 0), const Color.fromARGB(255, 0, 0, 0), false));

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