import 'dart:io';

import 'package:registre_empresa/model/empresa.dart';
import 'package:registre_empresa/model/endereco.dart';
import 'package:registre_empresa/model/pessoa_fisica.dart';
import 'package:registre_empresa/model/pessoa_juridica.dart';
import 'package:registre_empresa/model/socio.dart';
import 'package:registre_empresa/repository/repository_empresas.dart';

void main(List<String> arguments) {
  RepositoryEmpresas empresas = RepositoryEmpresas();

  bool verdade = true;
  do {
    int opcao = 7;
    print('\n');
    print('SGE - Sistema de Gerenciamento de Empresas');
    print('Opções:');
    print('1. Cadastrar uma nova empresa');
    print('2. Buscar Empresa cadastrada por CNPJ');
    print('3. Buscar Empresa por CPF/CNPJ do Sócio');
    print(
        '4. Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social)');
    print('5. Excluir uma empresa (por ID)');
    print('0. Sair');
    opcao = int.parse(stdin.readLineSync()!);

    switch (opcao) {
      case 1:
        cadastrarEmpresa(empresas);
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        imprimirEmpresas(empresas);
        break;
      case 5:
        break;
      case 0:
        verdade = false;
        break;
      default:
    }
  } while (verdade);
}

void cadastrarEmpresa(RepositoryEmpresas empresas) {
  print("Informações da empresa");
  stdout.write("Razao Social: ");
  String nomeSocialEmpresa = stdin.readLineSync()!;
  stdout.write("Nome Fantasia: ");
  String nomeFantasiaEmpresa = stdin.readLineSync()!;
  stdout.write("Telefone: ");
  String telefoneEmpresa = stdin.readLineSync()!;
  stdout.write(
      "CNPJ(apenas número): "); //validar: quantidade de números, antes de criar empresa
  String cnpjEmpresa = stdin.readLineSync()!;

  Endereco enderecoEmpresa = cadastrarEndereco();
  Socio? socio = cadastraSocio(empresas);

  if (socio == null) {
    //finalizar progra1ma

  } else {
    // se PessoaJuridica passar id para socioIdPJ, se não socioIdPF
    if (socio.runtimeType == PessoaJuridica) {
      Empresa empresa = Empresa(nomeSocialEmpresa, nomeFantasiaEmpresa,
          telefoneEmpresa, enderecoEmpresa,
          socioIdPJ: socio.id);
      empresa.validarCNPJ(cnpjEmpresa);
      empresas.cadastrarEmpresa(empresa);
      print('Empresa cadastrada!\n');
    } else {
      Empresa empresa = Empresa(nomeSocialEmpresa, nomeFantasiaEmpresa,
          telefoneEmpresa, enderecoEmpresa,
          socioIdPF: socio.id);
      empresa.validarCNPJ(cnpjEmpresa);
      empresas.cadastrarEmpresa(empresa);
      print('Empresa cadastrada!\n');
    }
  }
}

Socio? cadastraSocio(RepositoryEmpresas empresas) {
  print('Cadastrar Sócio');
  print('Tipo de sócio:');
  print('1. Pessoal Física');
  print('2. Pessoa Jurídica');
  stdout.write('Opção: ');
  int optionSocio = int.parse(stdin.readLineSync()!);

// se 1 pessoa física se 2 pessoa juridica
  if (optionSocio == 1) {
    print("Sócio Pessoa Física da ");
    stdout.write("Nome completo do sócio: ");
    String nomeSocio = stdin.readLineSync()!;
    stdout.write('CPF: ');
    String cpfSocio = stdin.readLineSync()!;

    Endereco enderecoPf = cadastrarEndereco();

    PessoaFisica sociopf = PessoaFisica(nomeSocio, enderecoPf);
    sociopf.validarCPF(cpfSocio); // só avança se o CNPJ estiver validado
    empresas.cadastrarSocioPF(sociopf);

    return sociopf;
  } else if (optionSocio == 2) {
    // cadastra pessoa jurídica
    print("Sócio Pessoa Jurídica"); // se 1 pessoa física se 2 pessoa juridica
    stdout.write("Razão Social: ");
    String razaoSocialSocio = stdin.readLineSync()!;
    stdout.write('Nome Fantasia: ');
    String nomeFantasiaSocio = stdin.readLineSync()!;
    stdout.write('CNPJ: ');
    String cnpjSocio = stdin.readLineSync()!;

    Endereco enderecopj = cadastrarEndereco();

    PessoaJuridica socioPJ =
        PessoaJuridica(razaoSocialSocio, nomeFantasiaSocio, enderecopj);
    socioPJ.validarCNPJ(cnpjSocio); // só avança se o CNPJ estiver validado
    empresas.cadastrarSocioPJ(socioPJ);

    return socioPJ;
  } else {
    return null;
  }
}

Endereco cadastrarEndereco() {
  print("Cadastrar endereço do Socio");
  stdout.write('Estado: ');
  String estado = stdin.readLineSync()!;
  stdout.write('Cidade: ');
  String municipio = stdin.readLineSync()!;
  stdout.write('Bairro: ');
  String bairro = stdin.readLineSync()!;
  stdout.write('Logradouro: ');
  String logradouro = stdin.readLineSync()!;
  stdout.write('Número');
  String numero = stdin.readLineSync()!;
  stdout.write('Complemento: ');
  String commplemento = stdin.readLineSync()!;

  Endereco endereco = Endereco(estado, municipio, bairro, logradouro,
      numero: numero, complemento: commplemento);
  return endereco;
}

void imprimirEmpresas(RepositoryEmpresas empresas) {
  if (empresas.listaEmpresas().isNotEmpty) {
    for (var element in empresas.listaEmpresas()) {
      print('\n');
      print("ID: ${element.id}");
      print("CNPJ: ${element.cnpj} Data Cadastro: ${element.dataCadastro}");
      print("Razão Social: ${element.nomeSocial}");
      print("Nome Fantasia: ${element.nomeFantasia}");
      print("Telefone:: ${element.id}");
      print(
          "Endereço:: ${element.endereco.logradouro}, ${element.endereco.numero}, ${element.endereco.bairro}, ${element.endereco.municipio}/${element.endereco.estado}, ${element.endereco.cep} ");
      print("Sócio: ");
      if (element.socioIdPJ != null) {
        // buscar pj e imprimir
        PessoaJuridica? pj = empresas.getSocioPJId(element.socioIdPJ!);
        print("CNPJ: ${pj?.cnpj}");
        print("Razão Social: ${pj?.razaoSocial}");
        print("Nome Fantasia:  ${pj?.nomeFantasia}");
        print(
            "Endereço:: ${pj?.endereco.logradouro}, ${pj?.endereco.numero}, ${pj?.endereco.bairro}, ${pj?.endereco.municipio}/${pj?.endereco.estado}, ${pj?.endereco.cep} ");
      }
      if (element.socioIdPF != null) {
        PessoaFisica? pf = empresas.getSocioPFId(element.socioIdPF!);
        print("CPF: ${pf?.cpf}");
        print("Nome completo: ${pf?.nome}");

        print(
            "Endereço:: ${pf?.endereco.logradouro}, ${pf?.endereco.numero}, ${pf?.endereco.bairro}, ${pf?.endereco.municipio}/${pf?.endereco.estado}, ${pf?.endereco.cep} ");
      }
    }
  } else {
    print('Sem empresas cadastradas!');
  }
}
