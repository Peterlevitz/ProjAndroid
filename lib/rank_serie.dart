import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:proj_final_mobile/bloc/database_bloc.dart';
import 'package:proj_final_mobile/bloc/database_state.dart';
import 'package:proj_final_mobile/cad_serie.dart';
import 'package:proj_final_mobile/models/series.dart';
import 'package:proj_final_mobile/serie_tile_ranking.dart';
import 'package:proj_final_mobile/tela_principal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_event.dart';
import 'package:proj_final_mobile/wrapper.dart';

class RankSerie extends StatelessWidget {
  final fruits = ['apples', 'oranges', 'bananas'];

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
                Navigator.of(context).push(
                  MaterialPageRoute<DatabaseBloc>(
                    builder: (context) {
                      return BlocProvider.value(
                        value: counterBloc,
                        child: TelaPrincipal(),
                      );
                    },
                  ),
                );
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
                Navigator.pop(context);
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
        title: Text("Ranking das séries"),
      ),
      body: RankingSerie(),
    );
  }
}

class RankingSerie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        if (state is SerieDatabaseState) {
          List<Series> list = state.series;
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SerieTileRanking(serie: list[index]);
              });
        } else {
          return Text("Erro ao exibir as séries");
        }
      },
    );
  }
}
