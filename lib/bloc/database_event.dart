import 'package:proj_final_mobile/models/review.dart';
import 'package:proj_final_mobile/models/series.dart';

abstract class DatabaseEvent {}

class UpdateDatabase extends DatabaseEvent {
  String serieId;
  String serieName;
  String director;
  int score;

  UpdateDatabase(this.serieId, this.serieName, this.director, this.score);
}

class AddDatabase extends DatabaseEvent {
  String serieName;
  String director;
  int score;

  AddDatabase({this.serieName, this.director, this.score});
}

class AddReview extends DatabaseEvent {
  String id;
  String nomeUsuario;
  String serieId;
  int score;
  String comment;

  AddReview(
      {this.id, this.nomeUsuario, this.serieId, this.score, this.comment});
}

class DeleteDatabase extends DatabaseEvent {
  String docId;
  DeleteDatabase({this.docId});
}

class ReceivedNewList extends DatabaseEvent {
  List<Series> serie;
  ReceivedNewList(this.serie);
}

class ReceivedNewReviewList extends DatabaseEvent {
  List<ReviewSerie> reviews;

  ReceivedNewReviewList(this.reviews);
}
