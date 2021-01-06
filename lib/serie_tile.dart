import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_final_mobile/bloc/database_bloc.dart';
import 'package:proj_final_mobile/bloc/database_event.dart';
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
              backgroundColor: Colors.blue[serie.score * 100],
            ),
            title: Text(serie.serieName),
            subtitle: Text(serie.director),
            trailing: GestureDetector(
                child: Icon(Icons.delete),
                onTap: () {
                  BlocProvider.of<DatabaseBloc>(context)
                      .add(DeleteDatabase(docId: serie.id));
                }),
          ),
        ));
  }
}
