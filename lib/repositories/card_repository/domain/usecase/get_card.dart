import 'package:fpdart/fpdart.dart';
import 'package:fusion/repositories/card_repository/domain/entities/card_entity.dart';
import 'package:fusion/repositories/card_repository/domain/repository/card_repository.dart';
import 'package:fusion/utils/failure.dart';
import 'package:fusion/utils/typedefs.dart';
import 'package:fusion/utils/usecase.dart';

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
