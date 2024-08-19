import 'package:task_6/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String id,
    required String name,
    required String email,
    String? accessToken,
  }) : super(
          id: id,
          name: name,
          email: email,
          accessToken: accessToken,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? json['_id'],
      name: json['name'],
      email: json['email'],
      accessToken: json['access_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'access_token': accessToken,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      accessToken: accessToken,
    );
  }
}
