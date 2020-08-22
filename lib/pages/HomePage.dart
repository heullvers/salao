import 'package:flutter/material.dart';
import 'package:salao/widgets/estabelecimentosCard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataPesquisa());
              })
        ],
      ),
      drawer: Drawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Estabelecimentos',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                EstabelecimentosCard(
                  estabelecimentoIndex: 0,
                ),
                EstabelecimentosCard(
                  estabelecimentoIndex: 1,
                ),
                EstabelecimentosCard(
                  estabelecimentoIndex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DataPesquisa extends SearchDelegate<String> {
  final estabelecimentosPesquisa = [
    'jack',
    'flavio',
    'tadeu',
    'neuza',
    'joaquim',
    'antonio',
    'irineu'
  ];

  final recentEstabelecimentos = [
    'tadeu',
    'neuza',
    'joaquim',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //resultado da busca - retornar estabelecimento
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final sugestaoLista = query.isEmpty
        ? recentEstabelecimentos
        : estabelecimentosPesquisa.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.fiber_manual_record),
        title: RichText(
            text: TextSpan(
                text: sugestaoLista[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: sugestaoLista[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ])),
      ),
      itemCount: sugestaoLista.length,
    );
  }
}
