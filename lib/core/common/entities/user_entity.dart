// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String role;
  final String avatar;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.avatar,
  });

  @override
  List<Object?> get props => [id, name, email, role, avatar];
}
