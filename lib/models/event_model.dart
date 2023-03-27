class EventModel {
  int? idEvent;
  String nameEvent;
  String descEvent;
  String dateEvent;
  int startEvent;
  int endEvent;
  int? compEvent;

  EventModel(
    {
    this.idEvent,
    required this.nameEvent,
    required this.descEvent,
    required this.dateEvent,
    required this.startEvent,
    required this.endEvent,
    this.compEvent
    }
  );

  factory EventModel.fromMap(Map<String,dynamic> map){
    return EventModel(
      idEvent: map['idEvent'],
      nameEvent: map['nameEvent'],
      descEvent: map['descEvent'],
      dateEvent: map['dateEvent'],
      startEvent: map['startEvent'],
      endEvent: map['endEvent'],
      compEvent: map['compEvent']
    );
  }
}