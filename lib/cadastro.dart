import 'package:flutter/material.dart';
import 'main.dart';

class TelaCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tela de cadastro"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new MyApp()));
            },
            child: Text('Voltar'),
          ),
        ));
  }
}
