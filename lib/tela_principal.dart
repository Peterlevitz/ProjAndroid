import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_event.dart';
import 'package:proj_final_mobile/bloc/database_state.dart';
import 'package:proj_final_mobile/cad_serie.dart';
import 'package:proj_final_mobile/listReviews.dart';
import 'package:proj_final_mobile/main.dart';
import 'package:proj_final_mobile/rank_serie.dart';
import 'package:proj_final_mobile/review_serie.dart';
import 'package:proj_final_mobile/serie_tile.dart';

import 'bloc/database_bloc.dart';
import 'models/series.dart';

class TelaPrincipal extends StatelessWidget {
  final String all = "all";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        if (state is SerieDatabaseState) {
          List<TvSerie> list = state.series;
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SerieTile(serie: list[index]);
              });
        } else {
          return Text("Você é mágico");
        }
      },
    );
  }
}
