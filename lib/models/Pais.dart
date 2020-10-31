class Pais {
  final int id;
  final String name;
  final String flag;

  Pais(this.id, this.name, this.flag);

  static List<Pais> paises() {
    return <Pais>[
      Pais(1, 'Brasil', '🇧🇷'),
      Pais(2, 'Espanha', '🇪🇸'),
      Pais(3, 'Inglaterra', '🏴󠁧󠁢󠁥󠁮󠁧󠁿'),
      Pais(4, 'Peru', '🇵🇪'),
    ];
  }
}
