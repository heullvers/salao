import 'dart:ffi';

class Estabelecimento {
  String nomeProfissional;
  String nomeEstabelecimento;
  String imgUrl;
  double rating;

  Estabelecimento(
      {this.nomeProfissional,
      this.nomeEstabelecimento,
      this.imgUrl,
      this.rating});
}
