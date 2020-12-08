import 'package:flutter/material.dart';
import 'main.dart';
import 'package:proj_final_mobile/models/user.dart';
import 'package:proj_final_mobile/database/task_database_helper.dart';
import 'dart:core';

class TelaCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de cadastro"),
      ),
      body: FormCadUser(),
    );
  }
}

class FormCadUser extends StatefulWidget {
  @override
  FormCadUserState createState() {
    return FormCadUserState();
  }
}

class FormCadUserState extends State<FormCadUser> {
  final _formKey = GlobalKey<FormState>();
  String _nome;
  String _email;
  String _username;
  String _password;

  DatabaseHelper helper = DatabaseHelper();
  List<User> users = List<User>();
  int count = 0;

  addUser() async {
    User user =
        User.withId(await helper.nextId(), _nome, _email, _username, _password);
    await helper.initDB();
    await helper.insertUser(user);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text('Nome completo:'),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty)
                    return 'Campo de preenchimento obrigatório';
                  else
                    return null;
                },
                onChanged: (value) {
                  _nome = value;
                },
              ),
              Text('Email:'),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty)
                    return 'Campo de preenchimento obrigatório';
                  else
                    return null;
                },
                onChanged: (value) {
                  _email = value;
                },
              ),
              Text('Nome de usuário:'),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo de preenchimento obrigatório';
                  }
                  return null;
                },
                onChanged: (value) {
                  _username = value;
                },
              ),
              Text('Senha:'),
              TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo de preenchimento obrigatório';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _password = value;
                  }),
              Text('Confirmar Senha:'),
              TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo de preenchimento obrigatório';
                    }
                    return null;
                  }),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () async {
                      await addUser();
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Usuário cadastrado com sucesso')));
                      }
                    },
                    child: Text('Cadastrar')),
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new MyApp()));
                  },
                  child: Text('Voltar'),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    showResults();
                  },
                  child: Text('Consultar Banco'),
                ),
              )
            ])));
  }

  void showResults() {
    final dbFuture = helper.initDB();
    dbFuture.then((db) {
      final usersFuture = helper.getUsers();
      usersFuture.then((result) {
        List<User> usersList = List<User>();
        var usersCount = result.length;
        for (int c = 0; c < usersCount; c++) {
          usersList.add(User.fromObject(result[c]));
          print(usersList[c].id);
          print(usersList[c].nome);
          print(usersList[c].email);
          print(usersList[c].username);
          print(usersList[c].password);
        }
        setState(() {
          users = usersList;
          count = usersList.length;
        });
      });
    });
  }
}
