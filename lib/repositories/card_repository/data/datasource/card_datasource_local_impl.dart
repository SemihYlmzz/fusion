import 'package:flutter/widgets.dart' hide Element;
import 'package:fpdart/fpdart.dart';
import 'package:fusion/gen/assets.gen.dart';
import 'package:fusion/l10n/app_localizations.dart';
import 'package:fusion/repositories/card_repository/data/datasource/card_datasource.dart';
import 'package:fusion/repositories/card_repository/domain/entities/card_entity.dart';
import 'package:fusion/utils/failure.dart';
import 'package:fusion/utils/typedefs.dart';

class CardDataSourceLocalImpl implements CardDatasource {
  @override
  FutureEither<GameCard> getCard({required String cardId}) async {
    try {
      final cardEntity = CardDatas.cards[cardId];
      if (cardEntity != null) {
        return Right(cardEntity);
      } else {
        return Left(Failure('No cards found with this ID'));
      }
    } catch (e) {
      return Left(Failure('An unexpected error occurred: $e'));
    }
  }
}

class CardDatas {
  static Map<String, GameCard> cards = {
    // FIRE CARDS
    'emberus': GameCard(
      name: 'Emberus',
      abilityId: 'emberus',
      cardId: 'emberus',
      element: Element.fire,
      imagePath: Assets.images.fireCards.emberus.path,
      power: 0,
    ),
    'ignis': GameCard(
      name: 'Ignis',
      abilityId: 'ignis',
      cardId: 'ignis',
      element: Element.fire,
      imagePath: Assets.images.fireCards.ignis.path,
      power: 1,
    ),
    'blazeon': GameCard(
      name: 'Blazeon',
      abilityId: 'blazeon',
      cardId: 'blazeon',
      element: Element.fire,
      imagePath: Assets.images.fireCards.blazeon.path,
      power: 2,
    ),
    'flamara': GameCard(
      name: 'Flamara',
      abilityId: 'flamara',
      cardId: 'flamara',
      element: Element.fire,
      imagePath: Assets.images.fireCards.flamara.path,
      power: 3,
    ),
    'pyyrhus': GameCard(
      name: 'Pyyrhus',
      abilityId: 'pyyrhus',
      cardId: 'pyyrhus',
      element: Element.fire,
      imagePath: Assets.images.fireCards.pyyrhus.path,
      power: 4,
    ),
    'embrella': GameCard(
      name: 'Embrella',
      abilityId: 'embrella',
      cardId: 'embrella',
      element: Element.fire,
      imagePath: Assets.images.fireCards.embrella.path,
      power: 5,
    ),
    'solara': GameCard(
      name: 'Solara',
      abilityId: 'solara',
      cardId: 'solara',
      element: Element.fire,
      imagePath: Assets.images.fireCards.solara.path,
      power: 6,
    ),
    'flamorion': GameCard(
      name: 'Flamorion',
      abilityId: 'flamorion',
      cardId: 'flamorion',
      element: Element.fire,
      imagePath: Assets.images.fireCards.flamorion.path,
      power: 7,
    ),
    'solarius': GameCard(
      name: 'Solarius',
      abilityId: 'solarius',
      cardId: 'solarius',
      element: Element.fire,
      imagePath: Assets.images.fireCards.solarius.path,
      power: 8,
    ),
    'dramber': GameCard(
      name: 'Dramber',
      abilityId: 'dramber',
      cardId: 'dramber',
      element: Element.fire,
      imagePath: Assets.images.fireCards.dramber.path,
      power: 9,
    ),
    // WATER CARDS
    'triton': GameCard(
      name: 'Triton',
      abilityId: 'triton',
      cardId: 'triton',
      element: Element.water,
      imagePath: Assets.images.waterCards.triton.path,
      power: 0,
    ),
    'oceanus': GameCard(
      name: 'Oceanus',
      abilityId: 'oceanus',
      cardId: 'oceanus',
      element: Element.water,
      imagePath: Assets.images.waterCards.oceanus.path,
      power: 1,
    ),
    'river': GameCard(
      name: 'River',
      abilityId: 'river',
      cardId: 'river',
      element: Element.water,
      imagePath: Assets.images.waterCards.river.path,
      power: 2,
    ),
    'nereus': GameCard(
      name: 'Nereus',
      abilityId: 'nereus',
      cardId: 'nereus',
      element: Element.water,
      imagePath: Assets.images.waterCards.nereus.path,
      power: 3,
    ),
    'dylan': GameCard(
      name: 'Dylan',
      abilityId: 'dylan',
      cardId: 'dylan',
      element: Element.water,
      imagePath: Assets.images.waterCards.dylan.path,
      power: 4,
    ),
    'kai': GameCard(
      name: 'Kai',
      abilityId: 'kai',
      cardId: 'kai',
      element: Element.water,
      imagePath: Assets.images.waterCards.kai.path,
      power: 5,
    ),
    'marina': GameCard(
      name: 'Marina',
      abilityId: 'marina',
      cardId: 'marina',
      element: Element.water,
      imagePath: Assets.images.waterCards.marina.path,
      power: 6,
    ),
    'neptune': GameCard(
      name: 'Neptune',
      abilityId: 'neptune',
      cardId: 'neptune',
      element: Element.water,
      imagePath: Assets.images.waterCards.neptune.path,
      power: 7,
    ),
    'caroline': GameCard(
      name: 'Caroline',
      abilityId: 'caroline',
      cardId: 'caroline',
      element: Element.water,
      imagePath: Assets.images.waterCards.caroline.path,
      power: 8,
    ),
    'aquarius': GameCard(
      name: 'Aquarius',
      abilityId: 'aquarius',
      cardId: 'aquarius',
      element: Element.water,
      imagePath: Assets.images.waterCards.aquarius.path,
      power: 9,
    ),
    // EARTH CARDS
    'terra': GameCard(
      name: 'Terra',
      abilityId: 'terra',
      cardId: 'terra',
      element: Element.earth,
      imagePath: Assets.images.earthCards.terra.path,
      power: 0,
    ),
    'gaia': GameCard(
      name: 'Gaia',
      abilityId: 'gaia',
      cardId: 'gaia',
      element: Element.earth,
      imagePath: Assets.images.earthCards.gaia.path,
      power: 1,
    ),
    'lyra': GameCard(
      name: 'Lyra',
      abilityId: 'lyra',
      cardId: 'lyra',
      element: Element.earth,
      imagePath: Assets.images.earthCards.lyra.path,
      power: 2,
    ),
    'flint': GameCard(
      name: 'Flint',
      abilityId: 'flint',
      cardId: 'flint',
      element: Element.earth,
      imagePath: Assets.images.earthCards.flint.path,
      power: 3,
    ),
    'boulder': GameCard(
      name: 'Boulder',
      abilityId: 'boulder',
      cardId: 'boulder',
      element: Element.earth,
      imagePath: Assets.images.earthCards.boulder.path,
      power: 4,
    ),
    'arvid': GameCard(
      name: 'Arvid',
      abilityId: 'arvid',
      cardId: 'arvid',
      element: Element.earth,
      imagePath: Assets.images.earthCards.arvid.path,
      power: 5,
    ),
    'gideon': GameCard(
      name: 'Gideon',
      abilityId: 'gideon',
      cardId: 'gideon',
      element: Element.earth,
      imagePath: Assets.images.earthCards.gideon.path,
      power: 6,
    ),
    'onyx': GameCard(
      name: 'Onyx',
      abilityId: 'onyx',
      cardId: 'onyx',
      element: Element.earth,
      imagePath: Assets.images.earthCards.onyx.path,
      power: 7,
    ),
    'ragnar': GameCard(
      name: 'Ragnar',
      abilityId: 'ragnar',
      cardId: 'ragnar',
      element: Element.earth,
      imagePath: Assets.images.earthCards.ragnar.path,
      power: 8,
    ),
    'thorin': GameCard(
      name: 'Thorin',
      abilityId: 'thorin',
      cardId: 'thorin',
      element: Element.earth,
      imagePath: Assets.images.earthCards.thorin.path,
      power: 9,
    ),
    // AIR CARDS
    'aero': GameCard(
      name: 'aero',
      abilityId: 'aero',
      cardId: 'aero',
      element: Element.air,
      imagePath: Assets.images.airCards.aero.path,
      power: 0,
    ),
    'nova': GameCard(
      name: 'nova',
      abilityId: 'nova',
      cardId: 'nova',
      element: Element.air,
      imagePath: Assets.images.airCards.nova.path,
      power: 1,
    ),
    'aurora': GameCard(
      name: 'aurora',
      abilityId: 'aurora',
      cardId: 'aurora',
      element: Element.air,
      imagePath: Assets.images.airCards.aurora.path,
      power: 2,
    ),
    'seraphina': GameCard(
      name: 'seraphina',
      abilityId: 'seraphina',
      cardId: 'seraphina',
      element: Element.air,
      imagePath: Assets.images.airCards.seraphina.path,
      power: 3,
    ),
    'celeste': GameCard(
      name: 'celeste',
      abilityId: 'celeste',
      cardId: 'celeste',
      element: Element.air,
      imagePath: Assets.images.airCards.celeste.path,
      power: 4,
    ),
    'luna': GameCard(
      name: 'luna',
      abilityId: 'luna',
      cardId: 'luna',
      element: Element.air,
      imagePath: Assets.images.airCards.luna.path,
      power: 5,
    ),
    'ember': GameCard(
      name: 'ember',
      abilityId: 'ember',
      cardId: 'ember',
      element: Element.air,
      imagePath: Assets.images.airCards.ember.path,
      power: 6,
    ),
    'aria': GameCard(
      name: 'aria',
      abilityId: 'aria',
      cardId: 'aria',
      element: Element.air,
      imagePath: Assets.images.airCards.aria.path,
      power: 7,
    ),
    'zephyr': GameCard(
      name: 'zephyr',
      abilityId: 'zephyr',
      cardId: 'zephyr',
      element: Element.air,
      imagePath: Assets.images.airCards.zephyr.path,
      power: 8,
    ),
    'orion': GameCard(
      name: 'orion',
      abilityId: 'orion',
      cardId: 'orion',
      element: Element.air,
      imagePath: Assets.images.airCards.orion.path,
      power: 9,
    ),
  };
  static Map<String, String> cardDescriptions(BuildContext context) => {
        'emberus': AppLocalizations.of(context).emberusAbilityDescription,
        'ignis': AppLocalizations.of(context).ignisAbilityDescription,
        'blazeon': AppLocalizations.of(context).blazeonAbilityDescription,
        'flamara': AppLocalizations.of(context).flamaraAbilityDescription,
        'pyyrhus': AppLocalizations.of(context).pyyrhusAbilityDescription,
        'embrella': AppLocalizations.of(context).embrellaAbilityDescription,
        'solara': AppLocalizations.of(context).solaraAbilityDescription,
        'flamorion': AppLocalizations.of(context).flamorionAbilityDescription,
        'solarius': AppLocalizations.of(context).solariusAbilityDescription,
        'dramber': AppLocalizations.of(context).dramberAbilityDescription,
        'triton': AppLocalizations.of(context).tritonAbilityDescription,
        'oceanus': AppLocalizations.of(context).oceanusAbilityDescription,
        'river': AppLocalizations.of(context).riverAbilityDescription,
        'nereus': AppLocalizations.of(context).nereusAbilityDescription,
        'dylan': AppLocalizations.of(context).dylanAbilityDescription,
        'kai': AppLocalizations.of(context).kaiAbilityDescription,
        'marina': AppLocalizations.of(context).marinaAbilityDescription,
        'neptune': AppLocalizations.of(context).neptuneAbilityDescription,
        'caroline': AppLocalizations.of(context).carolineAbilityDescription,
        'aquarius': AppLocalizations.of(context).aquariusAbilityDescription,
        'terra': AppLocalizations.of(context).terraAbilityDescription,
        'gaia': AppLocalizations.of(context).gaiaAbilityDescription,
        'lyra': AppLocalizations.of(context).lyraAbilityDescription,
        'flint': AppLocalizations.of(context).flintAbilityDescription,
        'boulder': AppLocalizations.of(context).boulderAbilityDescription,
        'arvid': AppLocalizations.of(context).arvidAbilityDescription,
        'gideon': AppLocalizations.of(context).gideonAbilityDescription,
        'onyx': AppLocalizations.of(context).onyxAbilityDescription,
        'ragnar': AppLocalizations.of(context).ragnarAbilityDescription,
        'thorin': AppLocalizations.of(context).thorinAbilityDescription,
        'aero': AppLocalizations.of(context).aeroAbilityDescription,
        'nova': AppLocalizations.of(context).novaAbilityDescription,
        'aurora': AppLocalizations.of(context).auroraAbilityDescription,
        'seraphina': AppLocalizations.of(context).seraphinaAbilityDescription,
        'celeste': AppLocalizations.of(context).celesteAbilityDescription,
        'luna': AppLocalizations.of(context).lunaAbilityDescription,
        'ember': AppLocalizations.of(context).emberAbilityDescription,
        'aria': AppLocalizations.of(context).ariaAbilityDescription,
        'zephyr': AppLocalizations.of(context).zephyrAbilityDescription,
        'orion': AppLocalizations.of(context).orionAbilityDescription,
      };
}