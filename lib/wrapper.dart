import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_final_mobile/authenticate.dart';
import 'package:proj_final_mobile/bloc/auth_state.dart';
import 'package:proj_final_mobile/bloc/database_bloc.dart';
import 'package:proj_final_mobile/tela_principal.dart';

import 'bloc/auth_bloc.dart';

class Wrapper extends StatelessWidget {
  final String all = "all";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, AuthState state) {
        if (state is Authenticated) {
          return BlocProvider<DatabaseBloc>(
            create: (context) {
              return DatabaseBloc(all);
            },
            child: TelaPrincipal(),
          );
        } else
          return Authenticate();
      },
      listener: (context, AuthState state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Email ou senha incorretos"),
                  content: Text("Por favor, confira seu email e senha"),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("OK"))
                  ],
                );
              });
        }
      },
    );
  }
}
