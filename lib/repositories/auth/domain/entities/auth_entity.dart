import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  const AuthEntity({
    required this.id,
    this.email,
    this.name,
    this.photo,
  });
  final String id;
  final String? email;
  final String? name;
  final String? photo;

  static const empty = AuthEntity(
    id: '',
  );

  bool get isEmpty => this == AuthEntity.empty;

  bool get isNotEmpty => this != AuthEntity.empty;

  AuthEntity copyWith({
    String? id,
    bool? isGuest,
    String? email,
    String? name,
    String? photo,
  }) {
    return AuthEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }

  @override
  List<Object?> get props => [email, id, name, photo];
}
