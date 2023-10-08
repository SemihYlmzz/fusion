import '../../initialize/injection_container.dart';
import 'card_datasource.dart';
import 'card_repository_impl.dart';
import 'datasource/card_datasource_local_impl.dart';

class CardRepositoryInjection {
  static Future<void> inject() async {
    getIt
      // CardDataSource <-connection-> Firebase
      ..registerSingleton<CardDatasource>(CardDataSourceLocalImpl())

      // CardRepository <-connection-> CardDataSource
      ..registerSingleton<CardRepository>(CardRepository(getIt()));
  }
}
