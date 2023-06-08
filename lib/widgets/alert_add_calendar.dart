import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';

import '../database/database_helper.dart';

class AlertAddCalendar extends StatefulWidget {
  const AlertAddCalendar({super.key});

  @override
  State<AlertAddCalendar> createState() => _AlertAddCalendarState();
}

class _AlertAddCalendarState extends State<AlertAddCalendar> {

  DatabaseHelper database = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    database = DatabaseHelper();
  }

  bool value = false;

  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventStartController = TextEditingController();
  final TextEditingController eventEndController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    eventNameController.dispose();
    eventStartController.dispose();
    eventEndController.dispose();
    super.dispose();
  }

  final spaceVertical = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    final formEvent = GlobalKey<FormState>();

    final txtEvenName = TextFormField(
      controller: eventNameController,
      decoration: const InputDecoration(
        label: Text('Event Name'),
        border: OutlineInputBorder()
      ), 
      validator:  ((value) {
        if (value!.isEmpty) {
          return "Enter Correct Name";
        } else {
          return null;
        }
      })
    );

    final txtEvenStart = DateTimeField(
      autovalidateMode: AutovalidateMode.always,
      decoration: const InputDecoration(
        label: Text('Start Date'),
        border: OutlineInputBorder()
      ),
      controller: eventStartController,
      format: DateFormat("yyyy-MM-dd HH:mm:ss"),
      validator:  ((value) {
        if (value == null) {
          return "Enter Correct Date";
        } else {
          return null;
        }
      }),
      onShowPicker: (context, currentValue) async {
        return await showDatePicker(
          context: context, 
          initialDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day), 
          firstDate: DateTime(DateTime.now().year, 1, 1), 
          lastDate: DateTime(DateTime.now().year + 1, 12, 31)
        ).then((DateTime? date) async {
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);;
          }
        });
      }
    );

    final txtEvenEnd = DateTimeField(
      decoration: const InputDecoration(
        label: Text('End Date'),
        border: OutlineInputBorder()
      ),
    controller: eventEndController,
    format: DateFormat("yyyy-MM-dd HH:mm:ss"),
    validator:  ((value) {
        if (value == null) {
          return "Enter Correct Date";
        } else {
          return null;
        }
      }),
    onShowPicker: (context, currentValue) async {
      return await showDatePicker(
        context: context, 
        initialDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day), 
        firstDate: DateTime(DateTime.now().year, 1, 1), 
        lastDate: DateTime(DateTime.now().year + 1, 12, 31)
      ).then((DateTime? date) async {
        if (date != null) {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.combine(date, time);;
        }
      });
    }
  );


  final checkCompleted = Checkbox(
                          value: this.value,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        );

    return AlertDialog(
          title: const Text('New Event'),
          content: SingleChildScrollView(
            child: Form(
              key: formEvent,
              child: Column(
                children: [
                      txtEvenName,
                      spaceVertical,
                      spaceVertical,
                      txtEvenStart,
                      spaceVertical,
                      txtEvenEnd,
                      spaceVertical,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Completed: '),
                          checkCompleted
                        ],
                      )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                if(formEvent.currentState!.validate()){
                  database.INSERT('tblEvent', {'nameEvent': eventNameController.text, 'startEvent':eventStartController.text, 'endEvent':eventEndController.text, 'compEvent': (this.value) ?1 :0 });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/events');
                }
              }
            )
          ]
        );
  }
}