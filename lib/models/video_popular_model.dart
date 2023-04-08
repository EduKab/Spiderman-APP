class VideoPopularModel{
  String key;
  String name;

  VideoPopularModel({
    required this.key,
    required this.name
  });

  factory VideoPopularModel.fromMap(Map<String,dynamic> map){
    return VideoPopularModel(
      key: map['key'],
      name: map['name'],
    );
  }
}