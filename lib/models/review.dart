class ReviewSerie {
  String id;
  String nomeUsuario;
  String serieId;
  int score;
  String comment;

  ReviewSerie(
      {this.id, this.nomeUsuario, this.serieId, this.score, this.comment});

  ReviewSerie.fromMap(String id, Map<String, dynamic> map) {
    this.id = id;
    this.nomeUsuario = map['nomeUsuario'];
    this.serieId = map["serieId"];
    this.score = map["score"];
    this.comment = map["comment"];
  }
}
