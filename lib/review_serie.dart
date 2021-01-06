import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_final_mobile/bloc/database_bloc.dart';
import 'package:proj_final_mobile/bloc/database_event.dart';
import 'package:proj_final_mobile/models/review.dart';
import 'package:proj_final_mobile/models/series.dart';
import 'package:proj_final_mobile/rank_serie.dart';
import 'package:proj_final_mobile/tela_principal.dart';
import 'main.dart';

class RevSerie extends StatelessWidget {
  final String idSerie;

  const RevSerie({this.idSerie}) : super();

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
                Navigator.pop(context);
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new MyApp()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Avaliação da Série"),
      ),
      body: FormReviewPage(idSerie: idSerie),
    );
  }
}

class FormReviewPage extends StatefulWidget {
  final String idSerie;

  FormReviewPage({this.idSerie}) : super();
  @override
  _FormReviewPageState createState() {
    return _FormReviewPageState(idSerie: idSerie);
  }
}

class _FormReviewPageState extends State<FormReviewPage> {
  final String idSerie;
  _FormReviewPageState({this.idSerie}) : super();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final ReviewSerie inModel = ReviewSerie();

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
                            labelText: "Nome do usuário",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo de preenchimento obrigatório';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          inModel.nomeUsuario = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLines: 7,
                        minLines: 4,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                            labelText: "Sua avaliação",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo de preenchimento obrigatório';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          inModel.comment = value;
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
                          if (!(nota >= 0) || !(nota <= 10))
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
                                      AddReview(
                                          nomeUsuario: inModel.nomeUsuario,
                                          serieId: idSerie,
                                          comment: inModel.comment,
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

// children: <Widget>[
//   Text("Nome"),
//   TextFormField(
//     validator: (String valor) {
//       if (valor.length == 0) return "Por favor, insira seu nome.";
//       return null;
//     },
//     onSaved: (String valor) {
//       reviewData.name = valor;
//     },
//   ),
//   Text("\n\nSua avaliação"),
//   TextFormField(
//     maxLines: 7,
//     minLines: 4,
//     keyboardType: TextInputType.multiline,
//     validator: (String valor) {
//       if (valor.length == 0)
//         return "Por favor, digite a sua avaliação.";
//       return null;
//     },
//     onSaved: (String valor) {
//       reviewData.review = valor;
//     },
//   ),
//   Slider(
//     min: 0,
//     max: 5,
//     divisions: 5,
//     onChanged: (double value) {
//       setState(() {
//         dataUpdate.reviewValue = value;
//       });
//     },
//     value: dataUpdate.reviewValue,
//   ),
