import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure({this.message = 'Unexpected Error'});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({String message = 'Server Failure'})
      : super(message: message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({String message = 'Connection Failure'})
      : super(message: message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({String message = 'Database Failure'})
      : super(message: message);
}
