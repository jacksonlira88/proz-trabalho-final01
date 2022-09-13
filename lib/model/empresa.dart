import 'package:registre_empresa/model/endereco.dart';
import 'package:registre_empresa/gerador.dart';

class Empresa {
  late final String id;
  String nomeSocial;
  String nomeFantasia;
  String telefone;
  late String _cnpj;
  Endereco endereco;
  late final DateTime dataCadastro;
  String? socioIdPF;
  String? socioIdPJ;

  Empresa(this.nomeSocial, this.nomeFantasia, this.telefone, this.endereco,
      {this.socioIdPF, this.socioIdPJ}) {
    id = idGenerator();
    dataCadastro = dataAtual();
  }

  set inserirCNPJ(String cnpj) {
    _cnpj = cnpj;
  }

  get cnpj {
    return _cnpj;
  }
}
