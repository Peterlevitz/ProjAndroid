import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_event.dart';
import 'package:proj_final_mobile/cad_serie.dart';
import 'package:proj_final_mobile/models/series.dart';
import 'package:proj_final_mobile/rank_serie.dart';
import 'package:proj_final_mobile/serie_tile.dart';
import 'bloc/database_bloc.dart';
import 'bloc/database_state.dart';

class TelaPrincipal extends StatefulWidget {
  TelaPrincipal({Key key, this.serie}) : super(key: key);
  final String serie;

  @override
  _MyTelaPrincipalState createState() => _MyTelaPrincipalState();
}

class _MyTelaPrincipalState extends State<TelaPrincipal> {
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
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Séries"),
        ),
        body: SeriesList());
  }
}

class SeriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        if (state is SerieDatabaseState) {
          List<Series> list = state.series;
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SerieTile(serie: list[index]);
              });
        } else {
          return Text("Erro ao exibir as séries");
        }
      },
    );
  }
}
