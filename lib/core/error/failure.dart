import 'package:equatable/equatable.dart';

class Failure extends Equatable implements Exception {
  final String? message;

  Failure({this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  @override
  String get message =>
      'Não foi possível processar seu pedido, tente novamente mais tarde.';
}

class NotFaoundFailure extends Failure {
  @override
  String get message => 'Registro não encontrado.';
}

class InvalidCredentialsFailure extends Failure {
  @override
  String get message => 'Credenciais inválidas';
}
