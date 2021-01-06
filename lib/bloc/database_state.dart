import 'package:proj_final_mobile/models/series.dart';

abstract class DatabaseState {}

class UnauthenticatedDatabaseState extends DatabaseState {}

class SerieDatabaseState extends DatabaseState {
  List<Series> series;
  SerieDatabaseState(this.series);
}
