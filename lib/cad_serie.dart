import 'package:flutter/material.dart';
import 'package:proj_final_mobile/rank_serie.dart';
import 'package:proj_final_mobile/tela_principal.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text('Título da série:'),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo de preenchimento obrigatório';
                  }
                  return null;
                },
              ),
              Text('Sinopse:'),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo de preenchimento obrigatório';
                  }
                  return null;
                },
                maxLines: 5,
              ),
              Text('Duração dos episódios'),
              TextFormField(validator: (value) {
                if (value.isEmpty) {
                  return 'Campo de preenchimento obrigatório';
                }
                return null;
              }),
              Text('Número de episódios:'),
              TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo de preenchimento obrigatório';
                    }
                    return null;
                  }),
              Text('Temporadas:'),
              TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo de preenchimento obrigatório';
                    }
                    return null;
                  }),
              Text('Faixa etária:'),
              TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo de preenchimento obrigatório';
                    }
                    return null;
                  }),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Série cadastrada com sucesso')));
                    }
                  },
                  child: Text('Cadastrar')),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new MyApp()));
                },
                child: Text('Voltar'),
              ),
            ])));
  }
}
