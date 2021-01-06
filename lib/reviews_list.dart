import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_event.dart';
import 'package:proj_final_mobile/cad_serie.dart';
import 'package:proj_final_mobile/models/review.dart';
import 'package:proj_final_mobile/models/series.dart';
import 'package:proj_final_mobile/rank_serie.dart';
import 'package:proj_final_mobile/review_tile.dart';
import 'package:proj_final_mobile/serie_tile.dart';
import 'package:proj_final_mobile/wrapper.dart';
import 'bloc/database_bloc.dart';
import 'bloc/database_state.dart';

class ReviewList extends StatefulWidget {
  ReviewList({Key key, this.serie}) : super(key: key);
  final String serie;

  @override
  _MyReviewListState createState() => _MyReviewListState();
}

class _MyReviewListState extends State<ReviewList> {
  final String all = "all";
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<DatabaseBloc>(context);
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text('Menu Principal'),
                decoration: BoxDecoration(
                  color: Color(0xffffdcba),
                ),
              ),
              ListTile(
                title: Text('Lista de séries'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Cadastro de séries'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<DatabaseBloc>(
                      builder: (context) {
                        return BlocProvider.value(
                          value: counterBloc,
                          child: CadSerie(),
                        );
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Ranking de séries'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<DatabaseBloc>(
                      builder: (context) {
                        return BlocProvider.value(
                          value: counterBloc,
                          child: RankSerie(),
                        );
                      },
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Sair'),
                onTap: () {
                  BlocProvider.of<AuthBloc>(context).add(LogOut());
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Wrapper()));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Séries"),
        ),
        body: ReviewListing());
  }
}

class ReviewListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        if (state is ReviewDatabaseState) {
          List<ReviewSerie> list = state.reviews;
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ReviewTile(review: list[index]);
              });
        } else {
          return Text("Erro ao exibir as reviews");
        }
      },
    );
  }
}
