import 'package:flutter/material.dart';
import 'package:proj_final_mobile/cad_serie.dart';
import 'package:proj_final_mobile/tela_principal.dart';
import 'main.dart';

class RankSerie extends StatelessWidget {
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
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new CadSerie()));
                },
              ),
              ListTile(
                title: Text('Ranking de séries'),
                onTap: () {
                  Navigator.pop(context);
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
          title: Text("Ranking das séries"),
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
