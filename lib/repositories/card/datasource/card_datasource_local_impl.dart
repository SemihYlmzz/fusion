import 'package:flutter/material.dart';

import '../../../../app/gen/assets.gen.dart';

import '../../../app/gen/l10n/l10n.dart';
import '../card_datasource.dart';
import '../errors/errors.dart';
import '../models/game_card_model.dart';

class CardDataSourceLocalImpl implements CardDatasource {
  @override
  GameCardModel getCard({required String cardId}) {
    try {
      final cardEntity = CardDatas.cards[cardId];
      if (cardEntity == null) {
        throw GetCardExceptions.getFailed;
      }
      return cardEntity;
    } catch (e) {
      if (e is GetCardExceptions) {
        rethrow;
      }
      throw GetCardExceptions.unknown;
    }
  }
}

class CardDatas {
  static Map<String, GameCardModel> cards = {
    // FIRE CARDS
    'emberus': GameCardModel(
      name: 'Emberus',
      abilityId: 'emberus',
      cardId: 'emberus',
      element: GameElements.fire,
      imagePath: Assets.images.fireCards.emberus.path,
      power: 0,
    ),
    'ignis': GameCardModel(
      name: 'Ignis',
      abilityId: 'ignis',
      cardId: 'ignis',
      element: GameElements.fire,
      imagePath: Assets.images.fireCards.ignis.path,
      power: 1,
    ),
    'blazeon': GameCardModel(
      name: 'Blazeon',
      abilityId: 'blazeon',
      cardId: 'blazeon',
      element: GameElements.fire,
      imagePath: Assets.images.fireCards.blazeon.path,
      power: 2,
    ),
    'flamara': GameCardModel(
      name: 'Flamara',
      abilityId: 'flamara',
      cardId: 'flamara',
      element: GameElements.fire,
      imagePath: Assets.images.fireCards.flamara.path,
      power: 3,
    ),
    'pyyrhus': GameCardModel(
      name: 'Pyyrhus',
      abilityId: 'pyyrhus',
      cardId: 'pyyrhus',
      element: GameElements.fire,
      imagePath: Assets.images.fireCards.pyyrhus.path,
      power: 4,
    ),
    'embrella': GameCardModel(
      name: 'Embrella',
      abilityId: 'embrella',
      cardId: 'embrella',
      element: GameElements.fire,
      imagePath: Assets.images.fireCards.embrella.path,
      power: 5,
    ),
    'solara': GameCardModel(
      name: 'Solara',
      abilityId: 'solara',
      cardId: 'solara',
      element: GameElements.fire,
      imagePath: Assets.images.fireCards.solara.path,
      power: 6,
    ),
    'flamorion': GameCardModel(
      name: 'Flamorion',
      abilityId: 'flamorion',
      cardId: 'flamorion',
      element: GameElements.fire,
      imagePath: Assets.images.fireCards.flamorion.path,
      power: 7,
    ),
    'solarius': GameCardModel(
      name: 'Solarius',
      abilityId: 'solarius',
      cardId: 'solarius',
      element: GameElements.fire,
      imagePath: Assets.images.fireCards.solarius.path,
      power: 8,
    ),
    'dramber': GameCardModel(
      name: 'Dramber',
      abilityId: 'dramber',
      cardId: 'dramber',
      element: GameElements.fire,
      imagePath: Assets.images.fireCards.dramber.path,
      power: 9,
    ),
    // WATER CARDS
    'triton': GameCardModel(
      name: 'Triton',
      abilityId: 'triton',
      cardId: 'triton',
      element: GameElements.water,
      imagePath: Assets.images.waterCards.triton.path,
      power: 0,
    ),
    'oceanus': GameCardModel(
      name: 'Oceanus',
      abilityId: 'oceanus',
      cardId: 'oceanus',
      element: GameElements.water,
      imagePath: Assets.images.waterCards.oceanus.path,
      power: 1,
    ),
    'river': GameCardModel(
      name: 'River',
      abilityId: 'river',
      cardId: 'river',
      element: GameElements.water,
      imagePath: Assets.images.waterCards.river.path,
      power: 2,
    ),
    'nereus': GameCardModel(
      name: 'Nereus',
      abilityId: 'nereus',
      cardId: 'nereus',
      element: GameElements.water,
      imagePath: Assets.images.waterCards.nereus.path,
      power: 3,
    ),
    'dylan': GameCardModel(
      name: 'Dylan',
      abilityId: 'dylan',
      cardId: 'dylan',
      element: GameElements.water,
      imagePath: Assets.images.waterCards.dylan.path,
      power: 4,
    ),
    'kai': GameCardModel(
      name: 'Kai',
      abilityId: 'kai',
      cardId: 'kai',
      element: GameElements.water,
      imagePath: Assets.images.waterCards.kai.path,
      power: 5,
    ),
    'marina': GameCardModel(
      name: 'Marina',
      abilityId: 'marina',
      cardId: 'marina',
      element: GameElements.water,
      imagePath: Assets.images.waterCards.marina.path,
      power: 6,
    ),
    'neptune': GameCardModel(
      name: 'Neptune',
      abilityId: 'neptune',
      cardId: 'neptune',
      element: GameElements.water,
      imagePath: Assets.images.waterCards.neptune.path,
      power: 7,
    ),
    'caroline': GameCardModel(
      name: 'Caroline',
      abilityId: 'caroline',
      cardId: 'caroline',
      element: GameElements.water,
      imagePath: Assets.images.waterCards.caroline.path,
      power: 8,
    ),
    'aquarius': GameCardModel(
      name: 'Aquarius',
      abilityId: 'aquarius',
      cardId: 'aquarius',
      element: GameElements.water,
      imagePath: Assets.images.waterCards.aquarius.path,
      power: 9,
    ),
    // EARTH CARDS
    'terra': GameCardModel(
      name: 'Terra',
      abilityId: 'terra',
      cardId: 'terra',
      element: GameElements.earth,
      imagePath: Assets.images.earthCards.terra.path,
      power: 0,
    ),
    'gaia': GameCardModel(
      name: 'Gaia',
      abilityId: 'gaia',
      cardId: 'gaia',
      element: GameElements.earth,
      imagePath: Assets.images.earthCards.gaia.path,
      power: 1,
    ),
    'lyra': GameCardModel(
      name: 'Lyra',
      abilityId: 'lyra',
      cardId: 'lyra',
      element: GameElements.earth,
      imagePath: Assets.images.earthCards.lyra.path,
      power: 2,
    ),
    'flint': GameCardModel(
      name: 'Flint',
      abilityId: 'flint',
      cardId: 'flint',
      element: GameElements.earth,
      imagePath: Assets.images.earthCards.flint.path,
      power: 3,
    ),
    'boulder': GameCardModel(
      name: 'Boulder',
      abilityId: 'boulder',
      cardId: 'boulder',
      element: GameElements.earth,
      imagePath: Assets.images.earthCards.boulder.path,
      power: 4,
    ),
    'arvid': GameCardModel(
      name: 'Arvid',
      abilityId: 'arvid',
      cardId: 'arvid',
      element: GameElements.earth,
      imagePath: Assets.images.earthCards.arvid.path,
      power: 5,
    ),
    'gideon': GameCardModel(
      name: 'Gideon',
      abilityId: 'gideon',
      cardId: 'gideon',
      element: GameElements.earth,
      imagePath: Assets.images.earthCards.gideon.path,
      power: 6,
    ),
    'onyx': GameCardModel(
      name: 'Onyx',
      abilityId: 'onyx',
      cardId: 'onyx',
      element: GameElements.earth,
      imagePath: Assets.images.earthCards.onyx.path,
      power: 7,
    ),
    'ragnar': GameCardModel(
      name: 'Ragnar',
      abilityId: 'ragnar',
      cardId: 'ragnar',
      element: GameElements.earth,
      imagePath: Assets.images.earthCards.ragnar.path,
      power: 8,
    ),
    'thorin': GameCardModel(
      name: 'Thorin',
      abilityId: 'thorin',
      cardId: 'thorin',
      element: GameElements.earth,
      imagePath: Assets.images.earthCards.thorin.path,
      power: 9,
    ),
    // AIR CARDS
    'aero': GameCardModel(
      name: 'aero',
      abilityId: 'aero',
      cardId: 'aero',
      element: GameElements.air,
      imagePath: Assets.images.airCards.aero.path,
      power: 0,
    ),
    'nova': GameCardModel(
      name: 'nova',
      abilityId: 'nova',
      cardId: 'nova',
      element: GameElements.air,
      imagePath: Assets.images.airCards.nova.path,
      power: 1,
    ),
    'aurora': GameCardModel(
      name: 'aurora',
      abilityId: 'aurora',
      cardId: 'aurora',
      element: GameElements.air,
      imagePath: Assets.images.airCards.aurora.path,
      power: 2,
    ),
    'seraphina': GameCardModel(
      name: 'seraphina',
      abilityId: 'seraphina',
      cardId: 'seraphina',
      element: GameElements.air,
      imagePath: Assets.images.airCards.seraphina.path,
      power: 3,
    ),
    'celeste': GameCardModel(
      name: 'celeste',
      abilityId: 'celeste',
      cardId: 'celeste',
      element: GameElements.air,
      imagePath: Assets.images.airCards.celeste.path,
      power: 4,
    ),
    'luna': GameCardModel(
      name: 'luna',
      abilityId: 'luna',
      cardId: 'luna',
      element: GameElements.air,
      imagePath: Assets.images.airCards.luna.path,
      power: 5,
    ),
    'ember': GameCardModel(
      name: 'ember',
      abilityId: 'ember',
      cardId: 'ember',
      element: GameElements.air,
      imagePath: Assets.images.airCards.ember.path,
      power: 6,
    ),
    'aria': GameCardModel(
      name: 'aria',
      abilityId: 'aria',
      cardId: 'aria',
      element: GameElements.air,
      imagePath: Assets.images.airCards.aria.path,
      power: 7,
    ),
    'zephyr': GameCardModel(
      name: 'zephyr',
      abilityId: 'zephyr',
      cardId: 'zephyr',
      element: GameElements.air,
      imagePath: Assets.images.airCards.zephyr.path,
      power: 8,
    ),
    'orion': GameCardModel(
      name: 'orion',
      abilityId: 'orion',
      cardId: 'orion',
      element: GameElements.air,
      imagePath: Assets.images.airCards.orion.path,
      power: 9,
    ),
  };
  static Map<String, String> cardDescriptions(BuildContext context) => {
        'emberus': L10n.current.emberusAbilityDescription,
        'ignis': L10n.current.ignisAbilityDescription,
        'blazeon': L10n.current.blazeonAbilityDescription,
        'flamara': L10n.current.flamaraAbilityDescription,
        'pyyrhus': L10n.current.pyyrhusAbilityDescription,
        'embrella': L10n.current.embrellaAbilityDescription,
        'solara': L10n.current.solaraAbilityDescription,
        'flamorion': L10n.current.flamorionAbilityDescription,
        'solarius': L10n.current.solariusAbilityDescription,
        'dramber': L10n.current.dramberAbilityDescription,
        'triton': L10n.current.tritonAbilityDescription,
        'oceanus': L10n.current.oceanusAbilityDescription,
        'river': L10n.current.riverAbilityDescription,
        'nereus': L10n.current.nereusAbilityDescription,
        'dylan': L10n.current.dylanAbilityDescription,
        'kai': L10n.current.kaiAbilityDescription,
        'marina': L10n.current.marinaAbilityDescription,
        'neptune': L10n.current.neptuneAbilityDescription,
        'caroline': L10n.current.carolineAbilityDescription,
        'aquarius': L10n.current.aquariusAbilityDescription,
        'terra': L10n.current.terraAbilityDescription,
        'gaia': L10n.current.gaiaAbilityDescription,
        'lyra': L10n.current.lyraAbilityDescription,
        'flint': L10n.current.flintAbilityDescription,
        'boulder': L10n.current.boulderAbilityDescription,
        'arvid': L10n.current.arvidAbilityDescription,
        'gideon': L10n.current.gideonAbilityDescription,
        'onyx': L10n.current.onyxAbilityDescription,
        'ragnar': L10n.current.ragnarAbilityDescription,
        'thorin': L10n.current.thorinAbilityDescription,
        'aero': L10n.current.aeroAbilityDescription,
        'nova': L10n.current.novaAbilityDescription,
        'aurora': L10n.current.auroraAbilityDescription,
        'seraphina': L10n.current.seraphinaAbilityDescription,
        'celeste': L10n.current.celesteAbilityDescription,
        'luna': L10n.current.lunaAbilityDescription,
        'ember': L10n.current.emberAbilityDescription,
        'aria': L10n.current.ariaAbilityDescription,
        'zephyr': L10n.current.zephyrAbilityDescription,
        'orion': L10n.current.orionAbilityDescription,
      };
  static Color elementShadowColor(GameElements element) {
    return switch (element) {
      GameElements.fire => const Color(0xFFFF4D00),
      GameElements.water => const Color(0xFF3F7A9E),
      GameElements.earth => const Color(0xFF2E7900),
      GameElements.air => Colors.white,
    };
  }

  static List<Color> elementGradientColor(GameElements element) {
    return switch (element) {
      GameElements.fire => [
          const Color(0xFFc94c2d),
          const Color(0xFFFBF276),
        ],
      GameElements.water => [
          const Color(0xFF33658E),
          const Color(0xFF87F8F8),
        ],
      GameElements.earth => [
          const Color(0xFF46966B),
          const Color(0xFF8BB987),
        ],
      GameElements.air => [
          const Color(0xFFADADAD),
          const Color(0xFFEBEBEB),
        ],
    };
  }
}
