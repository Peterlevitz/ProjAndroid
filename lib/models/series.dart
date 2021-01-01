class TvSerie {
  String id;
  String serieName;
  String director;
  int score;

  TvSerie({this.id, this.serieName, this.director, this.score});

  TvSerie.fromMap(String id, Map<String, dynamic> map) {
    this.id = id;
    this.serieName = map["serieName"];
    this.serieName = map["diretor"];
    this.serieName = map["score"];
  }
}
