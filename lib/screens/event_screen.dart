import 'package:flutter/material.dart';
import 'package:practica1/provider/event_provider.dart';
import 'package:practica1/widgets/calendar.dart';
import 'package:provider/provider.dart';

import '../database/database_helper.dart';
import '../widgets/alert_add_calendar.dart';


class EventScreen extends StatefulWidget {
  EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventProvider()),
      ],
      child: const EventScreen2(),
    );
  }
}


class EventScreen2 extends StatefulWidget {
  const EventScreen2({super.key});

  @override
  State<EventScreen2> createState() => _EventScreen2State();
}

class _EventScreen2State extends State<EventScreen2> {

  DatabaseHelper database = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    database = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return const AlertAddCalendar();
        }
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              database.deleteAllEvent();
              setState(() {
                
              });
            }, 
            icon: Icon(Icons.delete)
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [ 
          SizedBox(
            height: 700,
            width: 1000,
            child: Calendar()
          )
        ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          _showMyDialog();
        },
        label: const Text('Add Event'),
        icon: const Icon(Icons.event_note),
      ),
    );
  }
}
