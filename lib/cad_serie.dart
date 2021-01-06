import 'package:flutter/material.dart';
import 'package:proj_final_mobile/bloc/database_event.dart';
import 'package:proj_final_mobile/models/series.dart';
import 'package:proj_final_mobile/rank_serie.dart';
import 'package:proj_final_mobile/tela_principal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_event.dart';
import 'package:proj_final_mobile/wrapper.dart';
import 'bloc/database_bloc.dart';
import 'main.dart';

class CadSerie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new TelaPrincipal()));
              },
            ),
            ListTile(
              title: Text('Cadastro de séries'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Ranking de séries'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new RankSerie()));
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
        title: Text("Cadastro de séries"),
      ),
      body: FormCadSerie(),
    );
  }
}

class FormCadSerie extends StatefulWidget {
  @override
  FormCadSerieState createState() {
    return FormCadSerieState();
  }
}

class FormCadSerieState extends State<FormCadSerie> {
  final formKey = GlobalKey<FormState>();
  final Series inModel = Series();

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<DatabaseBloc>(context);
    return Form(
        key: formKey,
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                            labelText: "Título da série",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo de preenchimento obrigatório';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          inModel.serieName = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                            labelText: "Diretor",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo de preenchimento obrigatório';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          inModel.director = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                            labelText: "Nota",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo de preenchimento obrigatório';
                          }
                          int nota = int.parse(value);
                          if (!(nota <= 0 || nota <= 10))
                            return "Adicione uma nota entre 0 e 10";
                          return null;
                        },
                        onSaved: (value) {
                          inModel.score = int.parse(value);
                        },
                      ),
                      SizedBox(height: 15),
                      Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 350.0,
                          child: RaisedButton(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                              elevation: 5.0,
                              color: Color(0xffffdcba),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  BlocProvider.of<DatabaseBloc>(context).add(
                                      AddDatabase(
                                          serieName: inModel.serieName,
                                          director: inModel.director,
                                          score: inModel.score));
                                  formKey.currentState.reset();
                                }
                              },
                              child: Text('Cadastrar')),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                            width: 350.0,
                            child: RaisedButton(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                              elevation: 5.0,
                              color: Color(0xffffdcba),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              onPressed: () {
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
                              child: Text('Voltar'),
                            )),
                      ),
                    ]))));
  }
}
