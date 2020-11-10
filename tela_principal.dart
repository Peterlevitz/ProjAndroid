import 'package:flutter/material.dart';
import 'package:proj_final_mobile/cad_serie.dart';
import 'package:proj_final_mobile/rank_serie.dart';
import 'package:proj_final_mobile/review_serie.dart';
import 'main.dart';

class TelaPrincipal extends StatelessWidget {
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
          title: Text("Séries"),
        ),
        body: SeriesList());
  }
}

class Serie {
  Serie({this.serieName, this.isAnimated, this.diretor, this.capa});
  final String serieName;
  final bool isAnimated;
  final String diretor;
  final String capa;
}

List<Serie> allSeries = [
  Serie(
      serieName: "Game of Thrones",
      isAnimated: true,
      diretor: 'D. Beioff, A. Taylor, A. Graves, M. Mylod e J. Podeswa',
      capa: 'got.jpg'),
  Serie(
      serieName: "Friends",
      isAnimated: true,
      diretor: "David Crane e Marta Kauffman",
      capa: 'friends.png'),
  Serie(
      serieName: "The Big Bang Theory",
      isAnimated: false,
      diretor: 'Bill Prady and Chuck Lorre',
      capa: 'tbbt.jpg'),
  Serie(
      serieName: "Lovecraft Country",
      isAnimated: true,
      diretor: "Jordan Peele",
      capa: 'lovecraft.jpg'),
  Serie(
      serieName: "Prison Break",
      isAnimated: true,
      diretor: "Bobby Roth",
      capa: 'prison.jpg'),
  Serie(
      serieName: "The Blacklist",
      isAnimated: true,
      diretor: "Jon Bokenkamp",
      capa: 'blacklist.png'),
  Serie(
      serieName: "Breaking Bad",
      isAnimated: true,
      diretor: "Vince Gilligan",
      capa: 'breaking.png'),
  Serie(
      serieName: "Dark",
      isAnimated: true,
      diretor: "Baran bo Odar e Jantje Friese",
      capa: 'dark.jpg'),
  Serie(
      serieName: "The Boys",
      isAnimated: true,
      diretor: "Hartley Gorenstein",
      capa: 'theboys.png'),
];

class SeriesList extends StatefulWidget {
  @override
  _SeriesListState createState() => _SeriesListState();
}

class _SeriesListState extends State<SeriesList> {
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
                  title: Text(allSeries[index].serieName),
                  subtitle: Text(allSeries[index].diretor),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/${allSeries[index].capa}'),
                  ),
                  trailing: Icon(Icons.rate_review),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new RevSerie()));
                  },
                ),
              );
            }));
  }
}
