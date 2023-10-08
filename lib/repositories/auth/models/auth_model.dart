import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthModel extends Equatable {
  const AuthModel({
    required this.id,
    this.email,
    this.name,
    this.photo,
  });
  factory AuthModel.fromFirebaseUser(User firebaseUser) {
    return AuthModel(
      id: firebaseUser.uid,
      email: firebaseUser.email,
      name: firebaseUser.displayName,
      photo: firebaseUser.photoURL,
    );
  }
  factory AuthModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('id') ||
        !map.containsKey('isGuest') ||
        !map.containsKey('email') ||
        !map.containsKey('name') ||
        !map.containsKey('photo')) {
      throw Exception('Invalid map data');
    }
    return AuthModel(
      id: map['id'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      photo: map['photo'] as String,
    );
  }

  AuthModel copyWith({
    String? id,
    bool? isGuest,
    String? email,
    String? name,
    String? photo,
  }) {
    return AuthModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }

  final String id;
  final String? email;
  final String? name;
  final String? photo;

  bool get isEmpty => this == AuthModel.empty;

  bool get isNotEmpty => this != AuthModel.empty;

  @override
  List<Object?> get props => [email, id, name, photo];
  static const empty = AuthModel(
    id: '',
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'photo': photo,
    };
  }
}
