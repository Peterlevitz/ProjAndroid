import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_final_mobile/bloc/database_bloc.dart';
import 'package:proj_final_mobile/bloc/database_event.dart';
import 'package:proj_final_mobile/models/review.dart';
import 'package:proj_final_mobile/review_serie.dart';

class ReviewTile extends StatelessWidget {
  final ReviewSerie review;

  const ReviewTile({this.review}) : super();

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<DatabaseBloc>(context);
    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue[review.score * 100],
              ),
              title: Text(review.nomeUsuario),
              subtitle: Text(review.comment),
            )));
  }
}
