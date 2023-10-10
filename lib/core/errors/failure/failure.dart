import 'package:equatable/equatable.dart';
import 'package:fusion/app/gen/l10n/l10n.dart';

import '../../../initialize/injection_container.dart';

class Failure extends Equatable {
  const Failure({required this.message});
  Failure.network() : message = getIt<L10n>().dylanAbilityDescription;
  final String message;

  @override
  List<Object?> get props => [message];
}
