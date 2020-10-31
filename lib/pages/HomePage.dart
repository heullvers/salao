import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:salao/api/API.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Api> _api;

  Future<List<Api>> _getUser() async {
    try {
      List<Api> listUser = List();
      final response = await http.get('http://10.0.2.2:5000/jogos');
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        decodeJson.forEach((item) => listUser.add(Api.fromJson(item)));
        return listUser;
      } else {
        print("ELSE Erro ao carregar lista");
        return null;
      }
    } catch (e) {
      print("EXCEÇÃO Erro ao carregar lista");
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _getUser().then((map) {
      _api = map;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      drawer: Drawer(),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: _api == null
              ? Container()
              : ListView.builder(
                  itemCount: _api.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        //colocar condição pra quando jogo estiver ainda nao tiver acabado primeiro tempo
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Previsão'),
                            content: Text('Deseja prever o resultado de ' +
                                _api[index].timeMandante +
                                ' e ' +
                                _api[index].timeVisitante +
                                ' ?'),
                            actions: <Widget>[
                              FlatButton(onPressed: () {}, child: Text('Sim')),
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
                            top: 10.0, left: 8.0, right: 8.0, bottom: 4.0),
                        child: Table(
                            border: TableBorder(
                              bottom:
                                  BorderSide(width: 0.2, color: Colors.black),
                            ),
                            children: [
                              TableRow(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top: 12),
                                      child: Text(
                                        _api[index].timeMandante,
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                _api[index].situacao,
                                                style:
                                                    TextStyle(fontSize: 10.0),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                _api[index].golsMandante,
                                                style:
                                                    TextStyle(fontSize: 12.0),
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                '-',
                                                style:
                                                    TextStyle(fontSize: 12.0),
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                _api[index].golsVisitante,
                                                style:
                                                    TextStyle(fontSize: 12.0),
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
                                    Container(
                                      margin: EdgeInsets.only(top: 12.0),
                                      child: Text(
                                        _api[index].timeVisitante,
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                            ]),
                      ),
                    );
                  },
                )),
    );
  }
}
