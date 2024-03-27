import 'package:ecomm_bloc_app/core/common/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role,
    required super.avatar,
  });

  UserModel copyWith({
    int? id,
    String? email,
    String? password,
    String? name,
    String? role,
    String? avatar,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        role: role ?? this.role,
        avatar: avatar ?? this.avatar,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        role: json["role"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "role": role,
        "avatar": avatar,
      };
}
