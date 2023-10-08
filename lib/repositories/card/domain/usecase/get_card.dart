import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure/failure.dart';
import '../../../../core/typedefs/typedefs.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/game_card_entity.dart';
import '../repository/card_repository.dart';

class GetCardUseCase extends UseCase<Either<Failure, GameCard>, CardIdParams> {
  GetCardUseCase({required this.cardRepository});
  final CardRepository cardRepository;

  @override
  FutureEither<GameCard> execute(CardIdParams params) async {
    return cardRepository.getCard(cardId: params.cardId);
  }
}

class CardIdParams {
  const CardIdParams({
    required this.cardId,
  });
  final String cardId;
}
