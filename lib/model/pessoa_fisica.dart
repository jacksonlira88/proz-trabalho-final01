import 'package:registre_empresa/model/socio.dart';

class PessoaFisica extends Socio {
  String nome;
  late String _cpf;

  PessoaFisica(this.nome, super.endereco);

  bool validarCPF(String cpf) {
    _cpf = cpf;
    return true;
  }

  get cpf {
    return _cpf;
  }
}
