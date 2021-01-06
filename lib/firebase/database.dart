import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proj_final_mobile/models/series.dart';

class DatabaseService {
  final String uid;
  //final String all = "all";

  DatabaseService({this.uid});

  final CollectionReference serieCollections =
      FirebaseFirestore.instance.collection("series");

  addSerie(String serieName, String director, int score) async {
    return await serieCollections
        .doc(uid)
        .collection("series")
        .add({"serieName": serieName, "director": director, "score": score});
  }

  removeSerie(String id) async {
    return await serieCollections
        .doc(uid)
        .collection("series")
        .doc(id)
        .delete();
  }

  updateSerie(String id, String serieName, String director, int score) async {
    return await serieCollections
        .doc(uid)
        .collection("series")
        .doc(id)
        .update({"serieName": serieName, "director": director, "score": score});
  }

  Stream<List<Series>> get series {
    return serieCollections
        .doc(uid)
        .collection("series")
        .snapshots()
        .map(_serieListFromSnapshot);
  }

  List<Series> _serieListFromSnapshot(QuerySnapshot snapshot) {
    List<Series> series = List();
    for (var doc in snapshot.docs) {
      series.add(Series.fromMap(doc.id, doc.data()));
    }
    return series;
  }
}
