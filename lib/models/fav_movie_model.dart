class FavMovieModel {
  int? id;
  String? title;
  String? poster_path;

  FavMovieModel({
    this.id,
    this.title,
    this.poster_path
  });

  factory FavMovieModel.fromMap(Map<String,dynamic> map){
    return FavMovieModel(
      id: map['id'],
      title: map['title'],
      poster_path: map['poster_path']
    );
  }
}