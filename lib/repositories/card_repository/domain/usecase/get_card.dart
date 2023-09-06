import 'package:fpdart/fpdart.dart';

import '../../../../utils/failure.dart';
import '../../../../utils/typedefs.dart';
import '../../../../utils/usecase.dart';
import '../entities/card_entity.dart';
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
