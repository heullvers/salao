class Partida {
  final String campeonato;
  final String golsMandante;
  final String golsVisitante;
  final String linkEstatistica;
  final String linkOdds;
  final String situacao;
  final String timeMandante;
  final String timeVisitante;

  Partida(
      {this.campeonato,
      this.golsMandante,
      this.golsVisitante,
      this.linkEstatistica,
      this.linkOdds,
      this.situacao,
      this.timeMandante,
      this.timeVisitante});

  factory Partida.formJson(Map<String, dynamic> json) {
    return new Partida(
        campeonato: json['Campeonato'],
        golsMandante: json['GolsMandante'],
        golsVisitante: json['GolsVisitante'],
        linkEstatistica: json['linkEstatistica'],
        linkOdds: json['linkOdds'],
        situacao: json['situacao'],
        timeMandante: json['timeMandante'],
        timeVisitante: json['timeVisitante']);
  }
}
