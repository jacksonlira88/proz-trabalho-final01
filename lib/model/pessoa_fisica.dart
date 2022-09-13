import 'package:registre_empresa/model/socio.dart';

class PessoaFisica extends Socio {
  String nome;
  late String _cpf;

  PessoaFisica(this.nome, super.endereco);

  set inserirrCPF(String cpf) {
    _cpf = cpf;
  }

  get cpf {
    return _cpf;
  }
}
