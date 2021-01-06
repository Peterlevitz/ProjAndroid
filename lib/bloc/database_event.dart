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

class DeleteDatabase extends DatabaseEvent {
  String docId;
  DeleteDatabase({this.docId});
}

class ReceivedNewList extends DatabaseEvent {
  List<Series> serie;
  ReceivedNewList(this.serie);
}
