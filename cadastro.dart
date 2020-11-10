import 'package:flutter/material.dart';
import 'main.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text('Nome completo:'),
              TextFormField(validator: (value) {
                if (value.isEmpty) {
                  return 'Campo de preenchimento obrigatório';
                }
                return null;
              }),
              Text('Email:'),
              TextFormField(validator: (value) {
                if (value.isEmpty) {
                  return 'Campo de preenchimento obrigatório';
                }
                return null;
              }),
              Text('Nome de usuário:'),
              TextFormField(validator: (value) {
                if (value.isEmpty) {
                  return 'Campo de preenchimento obrigatório';
                }
                return null;
              }),
              Text('Senha:'),
              TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo de preenchimento obrigatório';
                    }
                    return null;
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
                    onPressed: () {
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
              )
            ])));
  }
}
