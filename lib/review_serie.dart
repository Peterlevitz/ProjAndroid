import 'package:flutter/material.dart';
import 'package:proj_final_mobile/rank_serie.dart';
import 'package:proj_final_mobile/tela_principal.dart';
import 'main.dart';

class RevSerie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Menu Principal'),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
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
      body: ReviewPage(),
    );
  }
}

class ReviewData {
  String name = "";
  String review = "";
}

class DataUpdate {
  var reviewValue = 3.0;
}

class ReviewPage extends StatefulWidget {
  final DataUpdate dataUpdate = new DataUpdate();
  @override
  _ReviewPageState createState() {
    return _ReviewPageState(dataUpdate);
  }
}

class _ReviewPageState extends State<ReviewPage> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final ReviewData reviewData = new ReviewData();
  final DataUpdate dataUpdate;

  _ReviewPageState(this.dataUpdate);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Nome"),
            TextFormField(
              validator: (String valor) {
                if (valor.length == 0) return "Por favor, insira seu nome.";
                return null;
              },
              onSaved: (String valor) {
                reviewData.name = valor;
              },
            ),
            Text("\n\nSua avaliação"),
            TextFormField(
              maxLines: 7,
              minLines: 4,
              keyboardType: TextInputType.multiline,
              validator: (String valor) {
                if (valor.length == 0)
                  return "Por favor, digite a sua avaliação.";
                return null;
              },
              onSaved: (String valor) {
                reviewData.review = valor;
              },
            ),
            Slider(
              min: 0,
              max: 5,
              divisions: 5,
              onChanged: (double value) {
                setState(() {
                  dataUpdate.reviewValue = value;
                });
              },
              value: dataUpdate.reviewValue,
            ),
            ElevatedButton(
                child: Text("Enviar avaliação"),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Avaliação de série enviada com sucesso')));
                  }
                }),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new SeriesList()));
              },
              child: Text('Voltar'),
            )
          ],
        ),
      ),
    );
  }
}
