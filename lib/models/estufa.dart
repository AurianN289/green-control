class Estufa {
  final String nome;
  final String dono;
  final String localizacao;
  final String tipoCultivo;

  double temperatura;
  double umidadeAr;
  double umidadeSolo;
  double co2;
  double luminosidade;

  bool autoAtivada;
  bool irrigacaoAtiva;
  bool ventilacaoAtiva;
  bool luzArtificialAtiva;
  bool aquecedorAtivo;
  bool janelaAberta;

  Estufa({
    required this.nome,
    required this.dono,
    required this.localizacao,
    required this.tipoCultivo,
    this.temperatura = 0.0,
    this.umidadeAr = 0.0,
    this.umidadeSolo = 0.0,
    this.co2 = 0.0,
    this.luminosidade = 0.0,
    this.autoAtivada = false,
    this.irrigacaoAtiva = false,
    this.ventilacaoAtiva = false,
    this.luzArtificialAtiva = false,
    this.aquecedorAtivo = false,
    this.janelaAberta = false,
  });

  /// Método para ligar/desligar automação
  void toggleAutomatizacao() {
    autoAtivada = !autoAtivada;
  }

  /// Método para atualizar sensores
  void atualizarSensores({
    double? temperatura,
    double? umidadeAr,
    double? umidadeSolo,
    double? co2,
    double? luminosidade,
  }) {
    if (temperatura != null) this.temperatura = temperatura;
    if (umidadeAr != null) this.umidadeAr = umidadeAr;
    if (umidadeSolo != null) this.umidadeSolo = umidadeSolo;
    if (co2 != null) this.co2 = co2;
    if (luminosidade != null) this.luminosidade = luminosidade;
  }
}
