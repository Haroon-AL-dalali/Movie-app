// ignore_for_file: public_member_api_docs, sort_constructors_first


class Movie {
  int id=1;
  String? title;
  String? backDropPath;
  String? originalTitel;
  String? overview;
  String? posterPath;
  String? releaseDate;
  dynamic voteAverage;
  Movie({
    required this.id,
    this.title,
    this.backDropPath,
    this.originalTitel,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id':id,
      'title': title,
      'backDropPath': backDropPath,
      'originalTitel': originalTitel,
      'overview': overview,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
   
    return Movie(
      id:json['id'] as int,
      title: json['title'] as String,
      backDropPath: json['backdrop_path'] !as String,
      originalTitel: json['original_title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      releaseDate: json['release_date'] as String,
      voteAverage: json['vote_average'] as dynamic,
    );
  }

}

 class CastModel{
  String name;
  String? image;
  CastModel({
  required this.name,
   this.image,
});
 factory CastModel.fromjson(json){
  return CastModel(
    name: json['name'] as String,
    image: json['profile_path'],
  );
  }
  
 }
