class Endereco {
  final String estado;
  final String municipio;
  final String bairro;
  final String logradouro;
  final String? numero;
  final String? complemento;
  late final String? _cep;

  Endereco(this.estado, this.municipio, this.bairro, this.logradouro,
      {this.numero, this.complemento});

  set adicionarCEP(String cep) {
    //converter e validar
    _cep = cep;
  }

  get cep {
    return _cep;
  }
}
