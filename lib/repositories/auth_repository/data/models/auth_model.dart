import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.id,
    super.email,
    super.name,
    super.photo,
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'photo': photo,
    };
  }

  AuthModel fromEntity(AuthEntity entity) {
    return AuthModel(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      photo: entity.photo,
    );
  }

  static AuthEntity toEntity(AuthModel authModel) {
    return AuthEntity(
      id: authModel.id,
      email: authModel.email,
      name: authModel.name,
      photo: authModel.photo,
    );
  }
}
// class Point {
  // num x, y;
  // Point(this.x, this.y);
  // static Point polar(num theta, num radius) {
    // return Point(radius * math.cos(theta),
        // radius * math.sin(theta));
  // }
// }

// class Point {
  // num x, y;
  // Point(this.x, this.y);
  // Point.polar(num theta, num radius)
      // : x = radius * math.cos(theta),
        // y = radius * math.sin(theta);
// }
