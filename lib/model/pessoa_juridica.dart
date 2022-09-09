import 'package:registre_empresa/model/socio.dart';

class PessoaJuridica extends Socio {
  String razaoSocial;
  String nomeFantasia;
  late String _cnpj;

  PessoaJuridica(this.razaoSocial, this.nomeFantasia, super.endereco);

  bool validarCNPJ(String cnpj) {
    _cnpj = cnpj;
    return true;
  }

  get cnpj {
    return _cnpj;
  }
}
