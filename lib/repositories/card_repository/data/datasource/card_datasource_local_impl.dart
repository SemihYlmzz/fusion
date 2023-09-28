import 'package:flutter/material.dart' hide Element;
import 'package:fpdart/fpdart.dart';

import '../../../../app/gen/assets.gen.dart';
import '../../../../app/l10n/l10n.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/typedefs/typedefs.dart';
import '../../domain/entities/card_entity.dart';
import 'card_datasource.dart';

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
        'emberus': context.l10n.emberusAbilityDescription,
        'ignis': context.l10n.ignisAbilityDescription,
        'blazeon': context.l10n.blazeonAbilityDescription,
        'flamara': context.l10n.flamaraAbilityDescription,
        'pyyrhus': context.l10n.pyyrhusAbilityDescription,
        'embrella': context.l10n.embrellaAbilityDescription,
        'solara': context.l10n.solaraAbilityDescription,
        'flamorion': context.l10n.flamorionAbilityDescription,
        'solarius': context.l10n.solariusAbilityDescription,
        'dramber': context.l10n.dramberAbilityDescription,
        'triton': context.l10n.tritonAbilityDescription,
        'oceanus': context.l10n.oceanusAbilityDescription,
        'river': context.l10n.riverAbilityDescription,
        'nereus': context.l10n.nereusAbilityDescription,
        'dylan': context.l10n.dylanAbilityDescription,
        'kai': context.l10n.kaiAbilityDescription,
        'marina': context.l10n.marinaAbilityDescription,
        'neptune': context.l10n.neptuneAbilityDescription,
        'caroline': context.l10n.carolineAbilityDescription,
        'aquarius': context.l10n.aquariusAbilityDescription,
        'terra': context.l10n.terraAbilityDescription,
        'gaia': context.l10n.gaiaAbilityDescription,
        'lyra': context.l10n.lyraAbilityDescription,
        'flint': context.l10n.flintAbilityDescription,
        'boulder': context.l10n.boulderAbilityDescription,
        'arvid': context.l10n.arvidAbilityDescription,
        'gideon': context.l10n.gideonAbilityDescription,
        'onyx': context.l10n.onyxAbilityDescription,
        'ragnar': context.l10n.ragnarAbilityDescription,
        'thorin': context.l10n.thorinAbilityDescription,
        'aero': context.l10n.aeroAbilityDescription,
        'nova': context.l10n.novaAbilityDescription,
        'aurora': context.l10n.auroraAbilityDescription,
        'seraphina': context.l10n.seraphinaAbilityDescription,
        'celeste': context.l10n.celesteAbilityDescription,
        'luna': context.l10n.lunaAbilityDescription,
        'ember': context.l10n.emberAbilityDescription,
        'aria': context.l10n.ariaAbilityDescription,
        'zephyr': context.l10n.zephyrAbilityDescription,
        'orion': context.l10n.orionAbilityDescription,
      };
  static Color elementShadowColor(Element element) {
    return switch (element) {
      Element.fire => const Color(0xFFFF4D00),
      Element.water => const Color(0xFF3F7A9E),
      Element.earth => const Color(0xFF2E7900),
      Element.air => Colors.white,
    };
  }

  static List<Color> elementGradientColor(Element element) {
    return switch (element) {
      Element.fire => [
          const Color(0xFFc94c2d),
          const Color(0xFFFBF276),
        ],
      Element.water => [
          const Color(0xFF33658E),
          const Color(0xFF87F8F8),
        ],
      Element.earth => [
          const Color(0xFF46966B),
          const Color(0xFF8BB987),
        ],
      Element.air => [
          const Color(0xFFADADAD),
          const Color(0xFFEBEBEB),
        ],
    };
  }
}
