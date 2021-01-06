import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_final_mobile/bloc/database_bloc.dart';
import 'package:proj_final_mobile/bloc/database_event.dart';
import 'package:proj_final_mobile/models/series.dart';
import 'package:proj_final_mobile/review_serie.dart';

class SerieTile extends StatelessWidget {
  final Series serie;

  const SerieTile({this.serie}) : super();

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<DatabaseBloc>(context);
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
                trailing: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(Icons.update),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<DatabaseBloc>(
                              builder: (context) {
                                return BlocProvider.value(
                                  value: counterBloc,
                                  child: RevSerie(idSerie: serie.id),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                          child: Icon(Icons.delete),
                          onTap: () {
                            BlocProvider.of<DatabaseBloc>(context)
                                .add(DeleteDatabase(docId: serie.id));
                          }),
                    ],
                  ),
                ))));
  }
}
