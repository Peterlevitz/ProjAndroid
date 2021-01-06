import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:proj_final_mobile/bloc/database_event.dart';
import 'package:proj_final_mobile/bloc/database_state.dart';
import 'package:proj_final_mobile/firebase/database.dart';
import 'package:proj_final_mobile/models/series.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseService _databaseService;
  StreamSubscription _databaseSubscription;

  DatabaseBloc(String uid) : super(UnauthenticatedDatabaseState()) {
    _databaseService = DatabaseService(uid: uid);
    _databaseSubscription =
        _databaseService.series.listen((List<Series> event) {
      add(ReceivedNewList(event));
    });
  }

  @override
  Stream<DatabaseState> mapEventToState(DatabaseEvent event) async* {
    if (event is AddDatabase) {
      _databaseService.addSerie(event.serieName, event.director, event.score);
    } else if (event is DeleteDatabase) {
      _databaseService.removeSerie(event.docId);
    } else if (event is UpdateDatabase) {
      _databaseService.updateSerie(
          event.serieId, event.serieName, event.director, event.score);
    } else if (event is ReceivedNewList) {
      print("entrei no received new list");
      yield SerieDatabaseState(event.serie);
    }
  }

  @override
  Future<void> close() {
    _databaseSubscription.cancel();
    return super.close();
  }
}
