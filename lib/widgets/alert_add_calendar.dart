import 'package:flutter/material.dart';

class AlertAddCalendar extends StatefulWidget {
  const AlertAddCalendar({super.key});

  @override
  State<AlertAddCalendar> createState() => _AlertAddCalendarState();
}

class _AlertAddCalendarState extends State<AlertAddCalendar> {

  final txtEvenName = const TextField(
    decoration: InputDecoration(
      label: Text('Event Name'),
      border: OutlineInputBorder()
    )
  );

  final txtEvenDescription = const TextField(
    decoration: InputDecoration(
      label: Text('Event Description'),
      border: OutlineInputBorder()
    )
  );

  final txtEvenStart = DropdownButtonFormField(items: null, onChanged: null, value: DateTime.now());

  final String text = '${DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)}';
  
  final txtEvenEnd = DropdownButtonFormField(items: null, onChanged: null, decoration: const InputDecoration(labelText: ''));

  final spaceVertical = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
          title: const Text('New Event'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                    txtEvenName,
                    spaceVertical,
                    txtEvenDescription,
                    spaceVertical,
                    txtEvenStart,
                    spaceVertical,
                    txtEvenEnd
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                //CalendarState().addEvent();
                Navigator.of(context).pop();
              }
            )
          ]
        );
  }
}