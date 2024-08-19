import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUser {
  final UserRepository _repository;

  GetUser(this._repository);

  Future<Either<Failure, UserEntity>> call(String accessToken) async {
    return await _repository.getUser(accessToken);
  }
}
