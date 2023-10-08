import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.dateOfCreate,
    required this.uid,
    required this.username,
    required this.accountnameChangeEligibilityDate,
    required this.lastActivityDate,
    required this.deck,
    this.accountDeletionScheduledDate,
    this.email,
    this.gameId,
  });

  final DateTime? accountDeletionScheduledDate;
  final DateTime dateOfCreate;
  final String? email;
  final String uid;
  final String username;
  final DateTime accountnameChangeEligibilityDate;
  final DateTime lastActivityDate;
  final String? gameId;
  final List<String> deck;

  User copyWith({
    DateTime? accountDeletionScheduledDate,
    DateTime? dateOfCreate,
    String? email,
    String? uid,
    String? username,
    DateTime? accountnameChangeEligibilityDate,
    DateTime? lastActivityDate,
    String? gameId,
    List<String>? deck,
  }) {
    return User(
      accountDeletionScheduledDate:
          accountDeletionScheduledDate ?? this.accountDeletionScheduledDate,
      dateOfCreate: dateOfCreate ?? this.dateOfCreate,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      username: username ?? this.username,
      accountnameChangeEligibilityDate: accountnameChangeEligibilityDate ??
          this.accountnameChangeEligibilityDate,
      lastActivityDate: lastActivityDate ?? this.lastActivityDate,
      gameId: gameId ?? this.gameId,
      deck: deck ?? this.deck,
    );
  }

  @override
  List<Object?> get props => [
        dateOfCreate,
        uid,
        username,
        accountnameChangeEligibilityDate,
        lastActivityDate,
        deck,
        accountDeletionScheduledDate,
        email,
        gameId,
      ];
}
