bool eCnpj(String cnpj) {
  if (cnpj == "00000000000000" ||
      cnpj == "22222222222222" ||
      cnpj == "11111111111111" ||
      cnpj == "33333333333333" ||
      cnpj == "44444444444444" ||
      cnpj == "55555555555555" ||
      cnpj == "66666666666555" ||
      cnpj == "77777777777777" ||
      cnpj == "88888888888888" ||
      cnpj == "99999999999999" ||
      cnpj.length != 14 ||
      cnpj.contains('a') ||
      cnpj.contains('b') ||
      cnpj.contains('c') ||
      cnpj.contains('d') ||
      cnpj.contains('e') ||
      cnpj.contains('f') ||
      cnpj.contains('g') ||
      cnpj.contains('g') ||
      cnpj.contains('i') ||
      cnpj.contains('j') ||
      cnpj.contains('k') ||
      cnpj.contains('l') ||
      cnpj.contains('m') ||
      cnpj.contains('n') ||
      cnpj.contains('o') ||
      cnpj.contains('p') ||
      cnpj.contains('q') ||
      cnpj.contains('r') ||
      cnpj.contains('s') ||
      cnpj.contains('t') ||
      cnpj.contains('u') ||
      cnpj.contains('v') ||
      cnpj.contains('w') ||
      cnpj.contains('x') ||
      cnpj.contains('y') ||
      cnpj.contains('z') ||
      cnpj.contains('#') ||
      cnpj.contains('!') ||
      cnpj.contains('#') ||
      cnpj.contains(' ') ||
      cnpj.contains('%') ||
      cnpj.contains('*') ||
      cnpj.contains('(') ||
      cnpj.contains(')') ||
      cnpj.contains(']') ||
      cnpj.contains('[') ||
      cnpj.contains('ª') ||
      cnpj.contains('-') ||
      cnpj.contains('+') ||
      cnpj.contains('/') ||
      cnpj.contains(';') ||
      cnpj.contains('^') ||
      cnpj.contains('?') ||
      cnpj.contains('.') ||
      cnpj.contains(',')) {
    return false;
  } else {
    return true;
  }
}

bool eCpf(String cpf) {
  if (cpf == "00000000000" ||
      cpf == "22222222222" ||
      cpf == "11111111111" ||
      cpf == "33333333333" ||
      cpf == "44444444444" ||
      cpf == "55555555555" ||
      cpf == "66666666666" ||
      cpf == "77777777777" ||
      cpf == "88888888888" ||
      cpf == "99999999999" ||
      cpf.length != 11 ||
      cpf.contains('a') ||
      cpf.contains('b') ||
      cpf.contains('c') ||
      cpf.contains('d') ||
      cpf.contains('e') ||
      cpf.contains('f') ||
      cpf.contains('g') ||
      cpf.contains('g') ||
      cpf.contains('i') ||
      cpf.contains('j') ||
      cpf.contains('k') ||
      cpf.contains('l') ||
      cpf.contains('m') ||
      cpf.contains('n') ||
      cpf.contains('o') ||
      cpf.contains('p') ||
      cpf.contains('q') ||
      cpf.contains('r') ||
      cpf.contains('s') ||
      cpf.contains('t') ||
      cpf.contains('u') ||
      cpf.contains('v') ||
      cpf.contains('w') ||
      cpf.contains('x') ||
      cpf.contains('y') ||
      cpf.contains('z') ||
      cpf.contains('#') ||
      cpf.contains('!') ||
      cpf.contains('#') ||
      cpf.contains(' ') ||
      cpf.contains('%') ||
      cpf.contains('*') ||
      cpf.contains('(') ||
      cpf.contains(')') ||
      cpf.contains(']') ||
      cpf.contains('[') ||
      cpf.contains('ª') ||
      cpf.contains('-') ||
      cpf.contains('+') ||
      cpf.contains('/') ||
      cpf.contains(';') ||
      cpf.contains('^') ||
      cpf.contains('?') ||
      cpf.contains('/') ||
      cpf.contains('.') ||
      cpf.contains(',')) {
    return (false);
  } else {
    return true;
  }
}

String formatoCNPJ(String cnpj) {
  List<String> lCnpj = cnpj.split('');
  lCnpj.insert(2, '.');
  lCnpj.insert(6, '.');
  lCnpj.insert(10, '/');
  lCnpj.insert(15, '-');
  return lCnpj.join("");
}

String formatoCPF(String cpf) {
  List<String> lcpf = cpf.split('');
  lcpf.insert(3, '.');
  lcpf.insert(7, '.');
  lcpf.insert(11, '-');
  return lcpf.join("");
}
