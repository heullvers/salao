class Api {
  String campeonato;
  String golsMandante;
  String golsVisitante;
  String linkEstatistica;
  String linkOdds;
  String situacao;
  String timeMandante;
  String timeVisitante;

  Api(
      {this.campeonato,
      this.golsMandante,
      this.golsVisitante,
      this.linkEstatistica,
      this.linkOdds,
      this.situacao,
      this.timeMandante,
      this.timeVisitante});

  Api.fromJson(Map<String, dynamic> json) {
    campeonato = json['Campeonato'];
    golsMandante = json['GolsMandante'];
    golsVisitante = json['GolsVisitante'];
    linkEstatistica = json['linkEstatistica'];
    linkOdds = json['linkOdds'];
    situacao = json['situacao'];
    timeMandante = json['timeMandante'];
    timeVisitante = json['timeVisitante'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Campeonato'] = this.campeonato;
    data['GolsMandante'] = this.golsMandante;
    data['GolsVisitante'] = this.golsVisitante;
    data['linkEstatistica'] = this.linkEstatistica;
    data['linkOdds'] = this.linkOdds;
    data['situacao'] = this.situacao;
    data['timeMandante'] = this.timeMandante;
    data['timeVisitante'] = this.timeVisitante;
    return data;
  }
}
