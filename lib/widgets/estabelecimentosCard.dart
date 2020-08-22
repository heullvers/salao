import 'package:flutter/material.dart';
import 'package:salao/models/Estabelecimento.dart';

Estabelecimento estabelecimentoUm = Estabelecimento(
    nomeProfissional: 'Flavio',
    nomeEstabelecimento: 'Flavio Cortes',
    imgUrl: 'assets/images/estabelecimentoUm');

Estabelecimento estabelecimentoDois = Estabelecimento(
    nomeProfissional: 'Neuza',
    nomeEstabelecimento: 'Neuza Salão',
    imgUrl: 'assets/images/estabelecimentoDois');

Estabelecimento estabelecimentoTres = Estabelecimento(
    nomeProfissional: 'Betinho',
    nomeEstabelecimento: 'Betinho barbearia',
    imgUrl: 'assets/images/estabelecimentoTres');

List<Estabelecimento> estabelecimentos = new List();

class EstabelecimentosCard extends StatelessWidget {
  final estabelecimentoIndex;

  const EstabelecimentosCard({this.estabelecimentoIndex});

  @override
  Widget build(BuildContext context) {
    estabelecimentos.add(estabelecimentoUm);
    estabelecimentos.add(estabelecimentoDois);
    estabelecimentos.add(estabelecimentoTres);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black),
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 20,
              child: Image.asset(
                estabelecimentos[estabelecimentoIndex].imgUrl,
                width: MediaQuery.of(context).size.width * 0.60,
              ))
        ],
      ),
    );
  }
}
