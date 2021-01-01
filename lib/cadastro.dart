import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_event.dart';
import 'package:proj_final_mobile/wrapper.dart';
import 'main.dart';
import 'package:proj_final_mobile/models/user.dart';
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
  GlobalKey<FormState> formKey = new GlobalKey();

  List<UserModel> users = List<UserModel>();
  RegisterUser saveInfoData = RegisterUser();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/logoshort2.png',
                      height: 180, fit: BoxFit.fill),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                        labelText: "Nome Completo",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Campo de preenchimento obrigatório';
                      else
                        return null;
                    },
                    onSaved: (value) {
                      saveInfoData.nome = value;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                    validator: (value) {
                      if (value.isEmpty)
                        return 'Campo de preenchimento obrigatório';
                      else
                        return null;
                    },
                    onSaved: (value) {
                      saveInfoData.email = value;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                        labelText: "Usuário",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Campo de preenchimento obrigatório';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      saveInfoData.username = value;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                          labelText: "Senha",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Campo de preenchimento obrigatório';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        saveInfoData.password = value;
                      }),
                  SizedBox(height: 10),
                  TextFormField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                          labelText: "Confirmar Senha",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Campo de preenchimento obrigatório';
                        }
                        return null;
                      }),
                  SizedBox(height: 15),
                  Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 350.0,
                      child: RaisedButton(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          elevation: 5.0,
                          color: Color(0xffffdcba),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              BlocProvider.of<AuthBloc>(context)
                                  .add(saveInfoData);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          "Usuário cadastrado com sucesso!"),
                                      content: Text(
                                          "Clique em OK para ser redirecionado para a tela principal"),
                                      actions: [
                                        FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          new Wrapper()));
                                            },
                                            child: Text("OK"))
                                      ],
                                    );
                                  });
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
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        elevation: 5.0,
                        color: Color(0xffffdcba),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new MyApp()));
                        },
                        child: Text('Voltar'),
                      ),
                    ),
                  ),
                ]),
          ),
        )));
  }
}
