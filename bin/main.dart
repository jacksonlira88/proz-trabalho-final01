import 'dart:io';

import 'package:registre_empresa/model/empresa.dart';
import 'package:registre_empresa/model/endereco.dart';
import 'package:registre_empresa/model/pessoa_fisica.dart';
import 'package:registre_empresa/model/pessoa_juridica.dart';
import 'package:registre_empresa/repository/repository_empresas.dart';

void main(List<String> arguments) {
  RepositoryEmpresas empresas = RepositoryEmpresas();

  bool verdade = true;
  do {
    int opcao = 7;
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
        imprimirEmpresas(empresas.listaEmpresas(), empresas);
        break;
      case 5:
        break;
      case 0:
        verdade = false;
        break;
      default:
    }
  } while (verdade);

  // só avaça se o CNPJ estiver validados
}

void cadastrarEmpresa(RepositoryEmpresas empresas) {
  print("Informações da empresa");
  print("Razao Social:");
  String nomeSocialEmpresa = stdin.readLineSync()!;
  print("Nome Fantasia:");
  String nomeFantasiaEmpresa = stdin.readLineSync()!;
  print("Telefone:");
  String telefoneEmpresa = stdin.readLineSync()!;
  print(
      "CNPJ(apenas número): "); //validar: quantidade de números, antes de criar empresa
  String cnpjEmpresa = stdin.readLineSync()!;

  print('Endereço da $nomeFantasiaEmpresa');
  print('Estado:');
  String estadoEmpresa = stdin.readLineSync()!;
  print('Cidade:');
  String municipioEmpresa = stdin.readLineSync()!;
  print('Bairro:');
  String bairroEmpresa = stdin.readLineSync()!;
  print('Logradouro:');
  String logradouroEmpresa = stdin.readLineSync()!;
  print('Número:');
  String numeroEmpresa = stdin.readLineSync()!;
  print('Complemento');
  String commplementoEmpresa = stdin.readLineSync()!;

  Endereco enderecoEmpresa = Endereco(
      estadoEmpresa, municipioEmpresa, bairroEmpresa, logradouroEmpresa,
      numero: numeroEmpresa, complemento: commplementoEmpresa);

  print('Tipo de sócio:');
  print('1. Pessoal Física');
  print('2. Pessoa Jurídica');
  int optionSocio = int.parse(stdin.readLineSync()!);
  if (optionSocio == 1) {
    // cadastrar pessoa física
    print(
        "Cadastrar Sócio da $nomeFantasiaEmpresa"); // se 1 pessoa física se 2 pessoa juridica
    print("Nome completo do sócio");
    String nomeSocio = stdin.readLineSync()!;
    print('CPF:');
    String cpfSocio = stdin.readLineSync()!;

    print("Endereço do Socio Pessoa Física");
    String estadoSocio = "Paraiba";
    String municipioSocio = " Sousa";
    String bairroSocio = "Centro";
    String logradouroSocio = "Ana Tereza";
    String numeroSocio = "22";
    String commplementoSocio = "Aparatemento 4";

    Endereco enderecoSocio = Endereco(
        estadoSocio, municipioSocio, bairroSocio, logradouroSocio,
        numero: numeroSocio, complemento: commplementoSocio);

    PessoaFisica socio = PessoaFisica(nomeSocio, enderecoSocio);
    socio.validarCPF(cpfSocio); // só avança de o CNPJ estiver validados
    empresas.cadastrarSocioPF(socio);
    Empresa empresa = Empresa(nomeSocialEmpresa, nomeFantasiaEmpresa,
        telefoneEmpresa, enderecoEmpresa,
        socioIdPF: socio.id);
    empresa.validarCNPJ(cnpjEmpresa);

    empresas.cadastrarEmpresa(empresa);
  } else if (optionSocio == 2) {}
}

void imprimirEmpresas(List<Empresa> empresasList, RepositoryEmpresas empresas) {
  if (empresasList.isNotEmpty) {
    for (var element in empresasList) {
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
        PessoaJuridica? pj = empresas.getSocioPJId(element.id)!;
        print("CNPJ: ${pj.cnpj}");
        print("Razão Social: ${pj.razaoSocial}");
        print("Nome Fantasia:  ${pj.nomeFantasia}");
        print(
            "Endereço:: ${pj.endereco.logradouro}, ${pj.endereco.numero}, ${pj.endereco.bairro}, ${pj.endereco.municipio}/${pj.endereco.estado}, ${pj.endereco.cep} ");
      }

      if (element.socioIdPF != null) {
        // buscar PF e imprimir
        // buscar pj e imprimir
        PessoaFisica? pf = empresas.getSocioPFId(element.socioIdPF!);
        print("CPF: ${pf?.cpf}");
        print("Nome completo: ${pf?.nome}");

        print(
            "Endereço:: ${pf?.endereco.logradouro}, ${pf?.endereco.numero}, ${pf?.endereco.bairro}, ${pf?.endereco.municipio}/${pf?.endereco.estado}, ${pf?.endereco.cep} ");
      }
      print('\n');
    }
  } else {
    print('Sem empresas cadastradas!');
  }
}
