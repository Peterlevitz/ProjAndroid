import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/series.dart';

class SerieTile extends StatelessWidget {
  final TvSerie serie;

  const SerieTile({this.serie}) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            title: Text(serie.serieName),
            subtitle: Text(serie.director),
          ),
        ));
  }
}
