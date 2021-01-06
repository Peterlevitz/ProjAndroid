class Series {
  String id;
  String serieName;
  String director;
  int score;

  Series({this.id, this.serieName, this.director, this.score});

  Series.fromMap(String id, Map<String, dynamic> map) {
    this.id = id;
    this.serieName = map["serieName"];
    this.director = map["director"];
    this.score = map["score"];
  }
}
