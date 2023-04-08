class CreditPopularModel{
  int id;
  String original_name;
  String? profile_path;
  String character;

  CreditPopularModel({
    required this.id,
    required this.original_name,
    required this.profile_path,
    required this.character
  });

  factory CreditPopularModel.fromMap(Map<String,dynamic> map){
    return CreditPopularModel(
      id: map['id'],
      original_name: map['original_name'],
      profile_path: map['profile_path'],
      character: map['character']
    );
  }
}