class MarvelModel{
  int? id;
  String? name;
  String? description;
  String? thumbnail_path;
  String? thumbnail_extension;
  int? comics_available;
  int? stories_available;
  int? events_available;
  int? series_available;

  MarvelModel({
    this.id,
    this.name,
    this.description,
    this.thumbnail_path,
    this.thumbnail_extension,
    this.comics_available,
    this.stories_available,
    this.events_available,
    this.series_available
  });

  factory MarvelModel.fromMap(Map<String,dynamic> map){
    return MarvelModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      thumbnail_path: map['thumbnail']['path'],
      thumbnail_extension: map['thumbnail']['extension'],
      comics_available: map['comics']['available'],
      stories_available: map['stories']['available'],
      events_available: map['events']['available'],
      series_available: map['series']['available'],
    );
  }
}