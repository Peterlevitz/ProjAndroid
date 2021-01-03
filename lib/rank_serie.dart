import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:proj_final_mobile/cad_serie.dart';
import 'package:proj_final_mobile/tela_principal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_bloc.dart';
import 'package:proj_final_mobile/bloc/auth_event.dart';
import 'package:proj_final_mobile/wrapper.dart';

class RankSerie extends StatelessWidget {
  final fruits = ['apples', 'oranges', 'bananas'];

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
                BlocProvider.of<AuthBloc>(context).add(LogOut());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Wrapper()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Ranking das séries"),
      ),
      body: RankingSerie(),
    );
  }
}

class Serie {
  Serie({this.serieName, this.isAnimated, this.rating, this.capa});
  final String serieName;
  final bool isAnimated;
  final double rating;
  final String capa;
}

List<Serie> allSeries = [
  Serie(
      serieName: "Game of Thrones",
      isAnimated: true,
      rating: 4.0,
      capa: 'got.jpg'),
  Serie(
      serieName: "Friends", isAnimated: true, rating: 4.0, capa: 'friends.png'),
  Serie(
      serieName: "The Big Bang Theory",
      isAnimated: false,
      rating: 5.0,
      capa: 'tbbt.jpg'),
  Serie(
      serieName: "Lovecraft Country",
      isAnimated: true,
      rating: 4.0,
      capa: 'lovecraft.jpg'),
  Serie(
      serieName: "Prison Break",
      isAnimated: true,
      rating: 4.0,
      capa: 'prison.jpg'),
  Serie(
      serieName: "The Blacklist",
      isAnimated: true,
      rating: 5.0,
      capa: 'blacklist.png'),
  Serie(
      serieName: "Breaking Bad",
      isAnimated: true,
      rating: 2.5,
      capa: 'breaking.png'),
  Serie(serieName: "Dark", isAnimated: true, rating: 5.0, capa: 'dark.jpg'),
  Serie(
      serieName: "The Boys",
      isAnimated: true,
      rating: 3.5,
      capa: 'theboys.png'),
];

class RankingSerie extends StatefulWidget {
  @override
  _RankingSerieState createState() => _RankingSerieState();
}

class _RankingSerieState extends State<RankingSerie> {
  List<Serie> visibleCountries;

  @override
  void initState() {
    visibleCountries = allSeries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: allSeries.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {},
                  title: Text(allSeries[index].serieName),
                  subtitle: Text(allSeries[index].rating.toString()),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/${allSeries[index].capa}'),
                  ),
                ),
              );
            }));
  }
}
