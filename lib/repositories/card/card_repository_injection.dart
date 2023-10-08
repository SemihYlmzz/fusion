import '../../initialize/injection_container.dart';
import 'data/datasource/card_datasource.dart';
import 'data/datasource/card_datasource_local_impl.dart';
import 'data/repository/card_repository_impl.dart';
import 'domain/repository/card_repository.dart';
import 'domain/usecase/get_card.dart';

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
