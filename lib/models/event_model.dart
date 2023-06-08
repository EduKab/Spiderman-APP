class EventModel {
  int? idEvent;
  String nameEvent;
  DateTime startEvent;
  DateTime endEvent;
  int? compEvent;

  EventModel(
    {
    this.idEvent,
    required this.nameEvent,
    required this.startEvent,
    required this.endEvent,
    this.compEvent
    }
  );

  factory EventModel.fromMap(Map<String,dynamic> map){
    return EventModel(
      idEvent: map['idEvent'],
      nameEvent: map['nameEvent'],
      startEvent: DateTime.parse(map['startEvent']),
      endEvent: DateTime.parse(map['endEvent']),
      compEvent: map['compEvent']
    );
  }
}