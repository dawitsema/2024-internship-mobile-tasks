import 'package:dartz/dartz.dart';
import 'package:task_6/core/error/failures.dart';
import 'package:task_6/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, String>> login(String email, String password);
  Future<Either<Failure, UserEntity>> register(
      String name, String email, String password);
  Future<Either<Failure, UserEntity>> getUser(String accessToken);
}
