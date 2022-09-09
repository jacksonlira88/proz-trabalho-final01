import 'package:uuid/uuid.dart';

String idGenerator() {
  final id = Uuid().v1();
  return id;
}

DateTime dataAtual() {
  return DateTime.now();
}
