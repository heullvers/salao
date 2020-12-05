import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:salao/api/API.dart';
import 'package:salao/models/Partida.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Api> _api;

  Timer _everySecond;

  List<Partida> _list = [];
  List<Partida> _search = [];
  var loading = false;

  bool isSearching = false;

  Future<Null> fetchData() async {
    if (this.mounted) {
      setState(() {
        loading = true;
        _list = [];
      });
    }

    final response = await http.get('http://10.0.2.2:5000/jogos');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (this.mounted) {
        setState(() {
          for (Map i in data) {
            _list.add(Partida.formJson(i));
            loading = false;
          }
        });
      }
    }
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((partida) {
      if (partida.campeonato.toLowerCase().contains(text) ||
          partida.campeonato.toUpperCase().contains(text) ||
          partida.campeonato.contains(text) ||
          partida.timeMandante.toLowerCase().contains(text) ||
          partida.timeMandante.toUpperCase().contains(text) ||
          partida.timeMandante.contains(text) ||
          partida.timeVisitante.toLowerCase().contains(text) ||
          partida.timeVisitante.toUpperCase().contains(text) ||
          partida.timeMandante.contains(text)) {
        _search.add(partida);
      }
    });

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _everySecond = Timer.periodic(Duration(seconds: 30), (Timer t) {
      fetchData();
    });
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  'First time',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: InkWell(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.lock),
                    SizedBox(width: 10.0),
                    Text('Sair')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            isSearching
                ? IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                      });
                    })
                : IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                    })
          ],
          title: !isSearching
              ? Text('Jogos ao vivo')
              : TextField(
                  controller: controller,
                  onChanged: onSearch,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Pesquisar jogo",
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(color: Colors.white)),
                )),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: _search.length != 0 || controller.text.isNotEmpty
                      ? ListView.builder(
                          itemCount: _search.length,
                          itemBuilder: (context, i) {
                            final b = _search[i];
                            return GestureDetector(
                              onTap: () {
                                //colocar condição pra quando jogo estiver ainda nao tiver acabado primeiro tempo
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Previsão'),
                                    content: Text(
                                        'Deseja prever o resultado de ' +
                                            b.timeMandante +
                                            ' e ' +
                                            b.timeVisitante +
                                            ' ?'),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {}, child: Text('Sim')),
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Não'))
                                    ],
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0,
                                    left: 8.0,
                                    right: 8.0,
                                    bottom: 4.0),
                                child: Table(
                                    border: TableBorder(
                                      bottom: BorderSide(
                                          width: 0.2, color: Colors.black),
                                    ),
                                    children: [
                                      TableRow(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Flexible(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 12),
                                                child: Text(
                                                  b.timeMandante,
                                                  style:
                                                      TextStyle(fontSize: 12.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        b.situacao,
                                                        style: TextStyle(
                                                            fontSize: 10.0),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        b.golsMandante,
                                                        style: TextStyle(
                                                            fontSize: 12.0),
                                                      ),
                                                      SizedBox(width: 4),
                                                      Text(
                                                        '-',
                                                        style: TextStyle(
                                                            fontSize: 12.0),
                                                      ),
                                                      SizedBox(width: 4),
                                                      Text(
                                                        b.golsVisitante,
                                                        style: TextStyle(
                                                            fontSize: 12.0),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 12.0),
                                                child: Text(
                                                  b.timeVisitante,
                                                  style:
                                                      TextStyle(fontSize: 12.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                    ]),
                              ),
                            );
                          })
                      : ListView.builder(
                          itemCount: _list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                //colocar condição pra quando jogo estiver ainda nao tiver acabado primeiro tempo
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Previsão'),
                                    content: Text(
                                        'Deseja prever o resultado de ' +
                                            _list[index].timeMandante +
                                            ' e ' +
                                            _list[index].timeVisitante +
                                            ' ?'),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {}, child: Text('Sim')),
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Não'))
                                    ],
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0,
                                    left: 8.0,
                                    right: 8.0,
                                    bottom: 4.0),
                                child: Table(
                                    border: TableBorder(
                                      bottom: BorderSide(
                                          width: 0.2, color: Colors.black),
                                    ),
                                    children: [
                                      TableRow(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Flexible(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 12),
                                                child: Text(
                                                  _list[index].timeMandante,
                                                  style:
                                                      TextStyle(fontSize: 12.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        _list[index].situacao,
                                                        style: TextStyle(
                                                            fontSize: 10.0),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        _list[index]
                                                            .golsMandante,
                                                        style: TextStyle(
                                                            fontSize: 12.0),
                                                      ),
                                                      SizedBox(width: 4),
                                                      Text(
                                                        '-',
                                                        style: TextStyle(
                                                            fontSize: 12.0),
                                                      ),
                                                      SizedBox(width: 4),
                                                      Text(
                                                        _list[index]
                                                            .golsVisitante,
                                                        style: TextStyle(
                                                            fontSize: 12.0),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 12.0),
                                                child: Text(
                                                  _list[index].timeVisitante,
                                                  style:
                                                      TextStyle(fontSize: 12.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                    ]),
                              ),
                            );
                          },
                        ),
                )),
    );
  }
}
