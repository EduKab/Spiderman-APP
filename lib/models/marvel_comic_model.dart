class MarvelComicModel{
  int? id;
  String? title;
  String? thumbnail_path;
  String? thumbnail_extension;

  MarvelComicModel({
    this.id,
    this.title,
    this.thumbnail_path,
    this.thumbnail_extension
  });

  factory MarvelComicModel.fromMap(Map<String,dynamic> map){
    return MarvelComicModel(
      id: map['id'],
      title: map['title'],
      thumbnail_path: map['thumbnail']['path'],
      thumbnail_extension: map['thumbnail']['extension'],
    );
  }
}