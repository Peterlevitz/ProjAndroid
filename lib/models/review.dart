class ReviewSerie {
  String id;
  String serieId;
  int score;
  String comment;

  ReviewSerie({this.id, this.serieId, this.score, this.comment});

  ReviewSerie.fromMap(String id, Map<String, dynamic> map) {
    this.id = id;
    this.serieId = map["serieId"];
    this.score = map["score"];
    this.comment = map["comment"];
  }
}
