import 'package:flutter/material.dart';
import 'package:practica1/provider/event_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => CalendarState();
}

class CalendarState extends State<Calendar> {

  

  @override
  Widget build(BuildContext context) {

    final events = Provider.of<EventProvider>(context).events;

    return SfCalendar(
            headerHeight: 70,
              view: CalendarView.month,
              dataSource: MeetingDataSource(events),
              monthViewSettings: const MonthViewSettings(showAgenda: true)
            );
  }

}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    final DateTime today = DateTime.now();
    final DateTime timeEvent = DateTime(appointments![index].from.year, appointments![index].from.month, appointments![index].from.day);
    final DateTime startTime = DateTime(today.year, today.month, today.day);
    //print(timeEvent);
    //print(startTime);
    if(timeEvent.compareTo(startTime) > 0){
      //print(timeEvent.difference(startTime).inDays);
      switch(timeEvent.difference(startTime).inDays){
        case 1:
          return Colors.yellow;
          break;
        case 2:
          return Colors.yellow;
          break;
        default:
          return appointments![index].background;
      }
      
    }
    else if(timeEvent.compareTo(startTime) == 0){
      return Colors.green;
    }
    else if(timeEvent.compareTo(startTime) < 0){
      if(appointments![index].isAllDay){
        return Colors.green;
      }
      return Colors.red;
    }
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}