import 'package:flutter/material.dart';
import 'package:proj_final_mobile/models/series.dart';

class SerieTile extends StatelessWidget {
  final Series serie;

  const SerieTile({this.serie}) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[serie.score],
            ),
            title: Text(serie.serieName),
            subtitle: Text(serie.director),
          ),
        ));
  }
}
