import 'package:fusion/injection_container.dart';

import 'package:fusion/repositories/card_repository/data/datasource/card_datasource.dart';

import 'package:fusion/repositories/card_repository/data/datasource/card_datasource_local_impl.dart';
import 'package:fusion/repositories/card_repository/data/repository/card_repository_impl.dart';
import 'package:fusion/repositories/card_repository/domain/repository/card_repository.dart';
import 'package:fusion/repositories/card_repository/domain/usecase/get_card.dart';

class CardRepositoryInjection {
  static Future<void> inject() async {
    getIt
      // CardDataSource <-connection-> Firebase
      ..registerSingleton<CardDatasource>(CardDataSourceLocalImpl())

      // CardRepository <-connection-> CardDataSource

      ..registerSingleton<CardRepository>(CardRepositoryImpl(getIt()))

      // CardUseCases <-connection-> CardRepository
      ..registerSingleton<GetCardUseCase>(
        GetCardUseCase(
          cardRepository: getIt<CardRepository>(),
        ),
      );
  }
}
