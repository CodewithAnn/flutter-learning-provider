
class MovieModel {
  int? id;
  String? movie;
  double? rating;
  String? image;
  String? imdbUrl;

  MovieModel({this.id, this.movie, this.rating, this.image, this.imdbUrl});

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    movie = json["movie"];
    rating = json["rating"];
    image = json["image"];
    imdbUrl = json["imdb_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["movie"] = movie;
    _data["rating"] = rating;
    _data["image"] = image;
    _data["imdb_url"] = imdbUrl;
    return _data;
  }
}