import 'package:flutter/material.dart';
import 'package:practica1/provider/event_provider.dart';
import 'package:practica1/widgets/alert_edit_calendar.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../database/database_helper.dart';
import '../models/event_model.dart';

class Calendar extends StatefulWidget {
  Calendar({super.key});

  @override
  State<Calendar> createState() => CalendarState();
}

class CalendarState extends State<Calendar> {

  DatabaseHelper database = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    database = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {

    getEvents() async {
      final events = await database.getAllEvent();
      print('EVENTS' + events.toList().toString());
      return events;
    }

    return FutureBuilder(
      future: getEvents(),
      builder: (context, AsyncSnapshot<List<EventModel>?> snapshot ) {
          if( snapshot.hasData ){
            return SfCalendar(
              headerHeight: 70,
              view: CalendarView.month,
              allowedViews: [
                CalendarView.month,
                CalendarView.schedule,
              ],
              dataSource: MeetingDataSource(snapshot.data!.toList()),
              monthViewSettings: const MonthViewSettings(showAgenda: true),
            );
          }else if( snapshot.hasError){
            return const Center(child: Text('Ocurrio un error :()'),);
          }else{
            return const CircularProgressIndicator();
          }
      }
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<EventModel> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startEvent;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endEvent;
  }

  @override
  String getSubject(int index) {
    return appointments![index].nameEvent;
  }

  @override
  Color getColor(int index) {
    final DateTime today = DateTime.now();
    final DateTime timeEvent = DateTime(appointments![index].startEvent.year, appointments![index].startEvent.month, appointments![index].startEvent.day);
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
          return Colors.black;
      }
      
    }
    else if(timeEvent.compareTo(startTime) == 0){
      return Colors.green;
    }
    else if(timeEvent.compareTo(startTime) < 0){
      if(appointments![index].compEvent == 1){
        return Colors.green;
      }
      return Colors.red;
    }
    return Colors.red;
  }
}