import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class Register {
  final UserRepository _userRepository;

  Register(this._userRepository);

  Future<Either<Failure, UserEntity>> call(
      String name, String email, String password) async {
    return await _userRepository.register(name, email, password);
  }
}
