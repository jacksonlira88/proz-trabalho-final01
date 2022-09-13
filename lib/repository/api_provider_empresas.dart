import 'package:registre_empresa/model/empresa.dart';
import 'package:registre_empresa/model/pessoa_fisica.dart';
import 'package:registre_empresa/model/pessoa_juridica.dart';

class APIProviderEmpresas {
  late final List<Empresa> _empresasCadastradas = [];
  late final List<PessoaFisica> _sociosPF = [];
  late final List<PessoaJuridica> _sociosPJ = [];

//metodos para pessoa juridica
  bool cadastrarSocioPJ(PessoaJuridica socio) {
    _sociosPJ.add(socio);
    return true;
  }

  List<PessoaJuridica> listarSociosPJ() {
    return _sociosPJ;
  }

  PessoaJuridica? getSocioPJId(String id) {
    for (var element in _sociosPJ) {
      if (element.id == id) {
        return element;
      }
    }
    return null;
  }

// métodos para sócio pessoa física
  bool cadastrarSocioPF(PessoaFisica socio) {
    _sociosPF.add(socio);
    return true;
  }

  List<PessoaFisica> listarSociosPF() {
    return _sociosPF;
  }

  PessoaFisica? getSocioPFId(String id) {
    for (var element in _sociosPF) {
      if (element.id == id) {
        return element;
      }
    }
    return null;
  }

// metodos para empresa
  Empresa? getEmpresaCPFSocio(String cpfSocio) {
    for (var socio in _sociosPF) {
      if (socio.cpf == cpfSocio) {
        for (var element in _empresasCadastradas) {
          if (element.socioIdPF == socio.id) {
            return element;
          }
        }
      }
    }
    return null;
  }

// se empresa não tiver sócio com esse cnpj retorna null, não testado, TESTAR a noite
//O que fazer com o retorno null
  Empresa? getEmpresaCNPJSocio(String cnpjSocio) {
    for (var socio in _sociosPJ) {
      if (socio.cnpj == cnpjSocio) {
        for (var element in _empresasCadastradas) {
          if (element.socioIdPJ == socio.id) {
            return element;
          }
        }
      }
    }
    return null;
  }

  List<Empresa> listarEmpresa() {
    return _empresasCadastradas;
  }

  bool cadastrarEmpresa(Empresa empresa) {
    _empresasCadastradas.add(empresa);
    return true;
  }

  bool removerEmpresa(String id) {
    if (id != '') {
      if (_empresasCadastradas.isEmpty) {
        return false;
      } else {
        for (var element in _empresasCadastradas) {
          if (element.id == id) {
            bool result = _empresasCadastradas.remove(element);
            if (result) {
              return true;
            }
          }
        }
      }
    }
    return false;
  }

  Empresa? getEmpresaCNPJ(String cnpj) {
    for (var empresa in _empresasCadastradas) {
      if (empresa.cnpj == cnpj) {
        return empresa;
      }
    }
    return null;
  }
}
