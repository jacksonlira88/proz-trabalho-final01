class Endereco {
  String estado;
  String municipio;
  String bairro;
  String logradouro;
  String? numero;
  String? complemento;
  String? _cep;

  Endereco(this.estado, this.municipio, this.bairro, this.logradouro,
      {this.numero, this.complemento});

  adicionarCEP(String cep) {
    //converter e validar
    _cep = cep;
  }

  get cep {
    return _cep;
  }
}
