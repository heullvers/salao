import 'package:flutter/material.dart';
import 'package:salao/models/Estabelecimento.dart';

Estabelecimento estabelecimentoUm = Estabelecimento(
    nomeProfissional: 'Flavio',
    nomeEstabelecimento: 'Flavio Cortes',
    imgUrl: 'assets/images/estabelecimentoUm.png',
    rating: 4.80);

Estabelecimento estabelecimentoDois = Estabelecimento(
    nomeProfissional: 'Neuza',
    nomeEstabelecimento: 'Neuza Salão',
    imgUrl: 'assets/images/estabelecimentoDois.png',
    rating: 4.9);

Estabelecimento estabelecimentoTres = Estabelecimento(
    nomeProfissional: 'Betinho',
    nomeEstabelecimento: 'Betinho barbearia',
    imgUrl: 'assets/images/estabelecimentoTres.png',
    rating: 4.7);

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
          borderRadius: BorderRadius.circular(20), color: Color(0xffEBF6FF)),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: -20,
            top: 30,
            child: Image.asset(estabelecimentos[estabelecimentoIndex].imgUrl),
            width: MediaQuery.of(context).size.width * 0.45,
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  estabelecimentos[estabelecimentoIndex].nomeEstabelecimento,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  estabelecimentos[estabelecimentoIndex].nomeProfissional,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 16,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      estabelecimentos[estabelecimentoIndex].rating.toString(),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'Ver perfil',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
