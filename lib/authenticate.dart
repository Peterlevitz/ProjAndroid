import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_event.dart';
import 'package:proj_final_mobile/cadastro.dart';
import 'package:proj_final_mobile/tela_principal.dart';

import 'bloc/auth_bloc.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Authenticate> {
  LoginUser loginUser = LoginUser();
  GlobalKey<FormState> formKey = new GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logoshort.png',
                height: 190, fit: BoxFit.fill),
            registerFormulario()
          ],
        ),
      ),
    ))));
  }

  Widget registerFormulario() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              obscureText: false,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              validator: (value) {
                if (value.length == 0) {
                  return "Por favor, preencha esse campo com seu email";
                }
                return null;
              },
              onSaved: (String value) {
                loginUser.email = value;
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Senha",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              validator: (value) {
                if (value.length == 0) {
                  return "Por favor, preencha esse campo com a sua senha";
                }
                return null;
              },
              onSaved: (String value) {
                loginUser.password = value;
              },
            ),
            SizedBox(height: 20.0),
            SizedBox(
                width: 350.0,
                child: RaisedButton(
                    padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    elevation: 5.0,
                    color: Color(0xffffdcba),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text("Logar"),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        BlocProvider.of<AuthBloc>(context).add(loginUser);
                      }
                    })),
            SizedBox(height: 10.0),
            SizedBox(
              width: 350.0,
              child: RaisedButton(
                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                color: Color(0xffffdcba),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text("Criar uma conta", textAlign: TextAlign.center),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new TelaCadastro()));
                },
              ),
            ),
            SizedBox(height: 15.0),
          ],
        ));
  }
}
/*

   final accountButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(15.0),
      color: Color(0xffffdcba),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new TelaCadastro()));
        },
        child: Text("Criar uma conta", textAlign: TextAlign.center),
      ),
    );
*/
