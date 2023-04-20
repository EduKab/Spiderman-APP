class MarvelEventModel{
  int? id;
  String? title;
  String? thumbnail_path;
  String? thumbnail_extension;
  String? start;
  String? end;

  MarvelEventModel({
    this.id,
    this.title,
    this.thumbnail_path,
    this.thumbnail_extension,
    this.start,
    this.end
  });

  factory MarvelEventModel.fromMap(Map<String,dynamic> map){
    return MarvelEventModel(
      id: map['id'],
      title: map['title'],
      thumbnail_path: map['thumbnail']['path'],
      thumbnail_extension: map['thumbnail']['extension'],
      start: map['start'],
      end: map['end']
    );
  }
}