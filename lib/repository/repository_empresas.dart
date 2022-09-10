// ignore: file_names
import 'package:registre_empresa/model/pessoa_fisica.dart';
import 'package:registre_empresa/model/pessoa_juridica.dart';
import 'package:registre_empresa/repository/api_provider_empresas.dart';
import 'package:registre_empresa/model/empresa.dart';

class RepositoryEmpresas {
  late final APIProviderEmpresas _apiProvider;
  RepositoryEmpresas() {
    _apiProvider = APIProviderEmpresas();
  }

  bool cadastrarSocioPF(PessoaFisica socio) {
    return _apiProvider.cadastrarSocioPF(socio);
  }

  PessoaFisica? getSocioPFId(String id) {
    return _apiProvider.getSocioPFId(id);
  }

  bool cadastrarSocioPJ(PessoaJuridica socio) {
    return _apiProvider.cadastrarSocioPJ(socio);
  }

  PessoaJuridica? getSocioPJId(String id) {
    return _apiProvider.getSocioPJId(id);
  }

// metodos para  empresa

  bool cadastrarEmpresa(Empresa empresa) {
    return _apiProvider.cadastrarEmpresa(empresa);
  }

  bool removerEmpresa(String id) {
    return _apiProvider.removerEmpresa(id);
  }

  List<Empresa> listaEmpresas() {
    return _apiProvider.listarEmpresa();
  }

// não concluido
  Empresa? getEmpresaCNPJ(String cnpj) {
    return _apiProvider.getEmpresaCNPJ(cnpj);
  }

  Empresa? getEmpresaCNPJSocio(String cnpj) {
    return _apiProvider.getEmpresaCNPJSocio(cnpj);
  }

  String getEmpresaCPFSocio(String cpf) {
    return 'Empresa';
  }
}
