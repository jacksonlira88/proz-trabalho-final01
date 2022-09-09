import 'package:registre_empresa/gerador.dart';
import 'package:registre_empresa/model/endereco.dart';

abstract class Socio {
  late final String _id;
  late Endereco endereco;

  Socio(this.endereco) {
    _id = idGenerator();
  }

  get id {
    return _id;
  }
}
