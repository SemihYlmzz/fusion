// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Canceling Text',
      args: [],
    );
  }

  /// `English`
  String get currentLanguage {
    return Intl.message(
      'English',
      name: 'currentLanguage',
      desc: 'The current Language',
      args: [],
    );
  }

  /// `Sign In with Apple`
  String get signInWithApple {
    return Intl.message(
      'Sign In with Apple',
      name: 'signInWithApple',
      desc: 'Social Apple login text.',
      args: [],
    );
  }

  /// `Sign In with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign In with Google',
      name: 'signInWithGoogle',
      desc: 'Social Google login text.',
      args: [],
    );
  }

  /// `Sign In with Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Sign In with Facebook',
      name: 'signInWithFacebook',
      desc: 'Social Facebook login text.',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: 'Welcome text in all languages.',
      args: [],
    );
  }

  /// `REFRESH DECK`
  String get refreshDeck {
    return Intl.message(
      'REFRESH DECK',
      name: 'refreshDeck',
      desc: 'Text for taking new random deck instead of current one.',
      args: [],
    );
  }

  /// `PLAY`
  String get play {
    return Intl.message(
      'PLAY',
      name: 'play',
      desc: 'Text for starting game.',
      args: [],
    );
  }

  /// `DONE`
  String get done {
    return Intl.message(
      'DONE',
      name: 'done',
      desc: 'Done word.',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: 'Simple Sign Out text.',
      args: [],
    );
  }

  /// `SETTINGS`
  String get settings {
    return Intl.message(
      'SETTINGS',
      name: 'settings',
      desc: 'Simple Settings text.',
      args: [],
    );
  }

  /// `General `
  String get general {
    return Intl.message(
      'General ',
      name: 'general',
      desc: 'Simple General text.',
      args: [],
    );
  }

  /// `Background Music`
  String get backgroundMusic {
    return Intl.message(
      'Background Music',
      name: 'backgroundMusic',
      desc: 'Simple Background Music text.',
      args: [],
    );
  }

  /// `Sound Effects`
  String get soundEffects {
    return Intl.message(
      'Sound Effects',
      name: 'soundEffects',
      desc: 'Simple Sound Effects text.',
      args: [],
    );
  }

  /// `Dialogues`
  String get dialogues {
    return Intl.message(
      'Dialogues',
      name: 'dialogues',
      desc: 'Simple Dialogue text.',
      args: [],
    );
  }

  /// `Haptics`
  String get haptics {
    return Intl.message(
      'Haptics',
      name: 'haptics',
      desc: 'Simple Haptics text.',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: 'Simple Language text.',
      args: [],
    );
  }

  /// `Default`
  String get defaultText {
    return Intl.message(
      'Default',
      name: 'defaultText',
      desc: 'Simple Default text.',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: 'Simple Username text.',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: 'Simple Account text.',
      args: [],
    );
  }

  /// `Report a Bug`
  String get reportABug {
    return Intl.message(
      'Report a Bug',
      name: 'reportABug',
      desc: 'Text for bug report button',
      args: [],
    );
  }

  /// `Send Us a Mail`
  String get sendUsAMail {
    return Intl.message(
      'Send Us a Mail',
      name: 'sendUsAMail',
      desc: 'Text for mail send button',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message(
      'Privacy',
      name: 'privacy',
      desc: 'Text for privacy button',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: 'Show Terms Button text.',
      args: [],
    );
  }

  /// `Credits`
  String get credits {
    return Intl.message(
      'Credits',
      name: 'credits',
      desc: 'Show Credits Button text.',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: 'Delete Account Button text.',
      args: [],
    );
  }

  /// `Enter a Username`
  String get enterUsername {
    return Intl.message(
      'Enter a Username',
      name: 'enterUsername',
      desc: 'Enter a Username text in all langs.',
      args: [],
    );
  }

  /// `NOT UNIQUE`
  String get notUnique {
    return Intl.message(
      'NOT UNIQUE',
      name: 'notUnique',
      desc: 'NOT UNIQUE word in all langs.',
      args: [],
    );
  }

  /// `Can't rename yet`
  String get cantRenameYet {
    return Intl.message(
      'Can\'t rename yet',
      name: 'cantRenameYet',
      desc: 'Cant rename yet text in all langs.',
      args: [],
    );
  }

  /// `HOURS`
  String get hoursText {
    return Intl.message(
      'HOURS',
      name: 'hoursText',
      desc: 'HOURS text in all langs',
      args: [],
    );
  }

  /// `You should wait`
  String get youShouldWait {
    return Intl.message(
      'You should wait',
      name: 'youShouldWait',
      desc: 'You should wait text in all langs',
      args: [],
    );
  }

  /// `Username too short`
  String get usernameTooShortError {
    return Intl.message(
      'Username too short',
      name: 'usernameTooShortError',
      desc: 'Error for short username usage.',
      args: [],
    );
  }

  /// `Username too long`
  String get usernameTooLongError {
    return Intl.message(
      'Username too long',
      name: 'usernameTooLongError',
      desc: 'Error for long username usage.',
      args: [],
    );
  }

  /// `No special characters.`
  String get usernameHasSpecialCharsError {
    return Intl.message(
      'No special characters.',
      name: 'usernameHasSpecialCharsError',
      desc: 'Error for username contains special chars.',
      args: [],
    );
  }

  /// `Has bad words.`
  String get usernameHasBadWordsError {
    return Intl.message(
      'Has bad words.',
      name: 'usernameHasBadWordsError',
      desc: 'Profanity error for username.',
      args: [],
    );
  }

  /// `You can change your name every 30 days.`
  String get usernameChangeLimitWarning {
    return Intl.message(
      'You can change your name every 30 days.',
      name: 'usernameChangeLimitWarning',
      desc: 'Simple warning telling username can be change oncea month.',
      args: [],
    );
  }

  /// `2x the damage I take is reduced from the opponent's HP.`
  String get emberusAbilityDescription {
    return Intl.message(
      '2x the damage I take is reduced from the opponent\'s HP.',
      name: 'emberusAbilityDescription',
      desc: 'Ability description of Emberus GameCard',
      args: [],
    );
  }

  /// `I attack my enemy twice.`
  String get ignisAbilityDescription {
    return Intl.message(
      'I attack my enemy twice.',
      name: 'ignisAbilityDescription',
      desc: 'Ability description of Ignis GameCard',
      args: [],
    );
  }

  /// `My powers are doubled.`
  String get blazeonAbilityDescription {
    return Intl.message(
      'My powers are doubled.',
      name: 'blazeonAbilityDescription',
      desc: 'Ability description of Blazeon GameCard',
      args: [],
    );
  }

  /// `My enemy takes double damage in the next battle.`
  String get flamaraAbilityDescription {
    return Intl.message(
      'My enemy takes double damage in the next battle.',
      name: 'flamaraAbilityDescription',
      desc: 'Ability description of Flamara GameCard',
      args: [],
    );
  }

  /// `I absorb 3 points from my enemy.`
  String get pyyrhusAbilityDescription {
    return Intl.message(
      'I absorb 3 points from my enemy.',
      name: 'pyyrhusAbilityDescription',
      desc: 'Ability description of Pyyrhus GameCard',
      args: [],
    );
  }

  /// `I deal double damage to the opponent's HP.`
  String get embrellaAbilityDescription {
    return Intl.message(
      'I deal double damage to the opponent\'s HP.',
      name: 'embrellaAbilityDescription',
      desc: 'Ability description of Embrella GameCard',
      args: [],
    );
  }

  /// `I attack directly to the opponent's HP.`
  String get solaraAbilityDescription {
    return Intl.message(
      'I attack directly to the opponent\'s HP.',
      name: 'solaraAbilityDescription',
      desc: 'Ability description of Solara GameCard',
      args: [],
    );
  }

  /// `This turn HP's take triple damage.`
  String get flamorionAbilityDescription {
    return Intl.message(
      'This turn HP\'s take triple damage.',
      name: 'flamorionAbilityDescription',
      desc: 'Ability description of Flamorion GameCard',
      args: [],
    );
  }

  /// `The damage i inflict can not be reduced.`
  String get solariusAbilityDescription {
    return Intl.message(
      'The damage i inflict can not be reduced.',
      name: 'solariusAbilityDescription',
      desc: 'Ability description of Solarius GameCard',
      args: [],
    );
  }

  /// `Ally fire elements gain 1 power for each card I kill.`
  String get dramberAbilityDescription {
    return Intl.message(
      'Ally fire elements gain 1 power for each card I kill.',
      name: 'dramberAbilityDescription',
      desc: 'Ability description of Dramber GameCard',
      args: [],
    );
  }

  /// `Resurrect the last dead ally.`
  String get tritonAbilityDescription {
    return Intl.message(
      'Resurrect the last dead ally.',
      name: 'tritonAbilityDescription',
      desc: 'Ability description of Triton GameCard',
      args: [],
    );
  }

  /// `For each round my HP decreases, heal 4 HP.`
  String get oceanusAbilityDescription {
    return Intl.message(
      'For each round my HP decreases, heal 4 HP.',
      name: 'oceanusAbilityDescription',
      desc: 'Ability description of Oceanus GameCard',
      args: [],
    );
  }

  /// `Opponent HP are healed instead of each of my HP's going down.`
  String get riverAbilityDescription {
    return Intl.message(
      'Opponent HP are healed instead of each of my HP\'s going down.',
      name: 'riverAbilityDescription',
      desc: 'Ability description of River GameCard',
      args: [],
    );
  }

  /// `My enemy's power becomes 1.`
  String get nereusAbilityDescription {
    return Intl.message(
      'My enemy\'s power becomes 1.',
      name: 'nereusAbilityDescription',
      desc: 'Ability description of Nereus GameCard',
      args: [],
    );
  }

  /// `For each time you heal in this game, I gain 3 powers.`
  String get dylanAbilityDescription {
    return Intl.message(
      'For each time you heal in this game, I gain 3 powers.',
      name: 'dylanAbilityDescription',
      desc: 'Ability description of Dylan GameCard',
      args: [],
    );
  }

  /// `Heal 3.`
  String get kaiAbilityDescription {
    return Intl.message(
      'Heal 3.',
      name: 'kaiAbilityDescription',
      desc: 'Ability description of Kai GameCard',
      args: [],
    );
  }

  /// `Heal 3 for each water element you play.`
  String get marinaAbilityDescription {
    return Intl.message(
      'Heal 3 for each water element you play.',
      name: 'marinaAbilityDescription',
      desc: 'Ability description of Marina GameCard',
      args: [],
    );
  }

  /// `In the next battle, players take the damage the opponent would take.`
  String get neptuneAbilityDescription {
    return Intl.message(
      'In the next battle, players take the damage the opponent would take.',
      name: 'neptuneAbilityDescription',
      desc: 'Ability description of Neptune GameCard',
      args: [],
    );
  }

  /// `I die, you heal as much as my power.`
  String get carolineAbilityDescription {
    return Intl.message(
      'I die, you heal as much as my power.',
      name: 'carolineAbilityDescription',
      desc: 'Ability description of Caroline GameCard',
      args: [],
    );
  }

  /// `If an ally dies while I'm in you hand, kill me and revive that ally.`
  String get aquariusAbilityDescription {
    return Intl.message(
      'If an ally dies while I\'m in you hand, kill me and revive that ally.',
      name: 'aquariusAbilityDescription',
      desc: 'Ability description of Aquarius GameCard',
      args: [],
    );
  }

  /// `When Ally Earth elements die, I take no damage.`
  String get terraAbilityDescription {
    return Intl.message(
      'When Ally Earth elements die, I take no damage.',
      name: 'terraAbilityDescription',
      desc: 'Ability description of Terra GameCard',
      args: [],
    );
  }

  /// `If you attack while I'm in your Deck, I'll hit your opponent's HP's.`
  String get gaiaAbilityDescription {
    return Intl.message(
      'If you attack while I\'m in your Deck, I\'ll hit your opponent\'s HP\'s.',
      name: 'gaiaAbilityDescription',
      desc: 'Ability description of Gaia GameCard',
      args: [],
    );
  }

  /// `I kill my Enemy.`
  String get lyraAbilityDescription {
    return Intl.message(
      'I kill my Enemy.',
      name: 'lyraAbilityDescription',
      desc: 'Ability description of Lyra GameCard',
      args: [],
    );
  }

  /// `Remove ability of my Enemy.`
  String get flintAbilityDescription {
    return Intl.message(
      'Remove ability of my Enemy.',
      name: 'flintAbilityDescription',
      desc: 'Ability description of Flint GameCard',
      args: [],
    );
  }

  /// `My enemy's powers are halved.`
  String get boulderAbilityDescription {
    return Intl.message(
      'My enemy\'s powers are halved.',
      name: 'boulderAbilityDescription',
      desc: 'Ability description of Boulder GameCard',
      args: [],
    );
  }

  /// `I do not take damage from cards under 5 power.`
  String get arvidAbilityDescription {
    return Intl.message(
      'I do not take damage from cards under 5 power.',
      name: 'arvidAbilityDescription',
      desc: 'Ability description of Arvid GameCard',
      args: [],
    );
  }

  /// `Your opponent can not be healed.`
  String get gideonAbilityDescription {
    return Intl.message(
      'Your opponent can not be healed.',
      name: 'gideonAbilityDescription',
      desc: 'Ability description of Gideon GameCard',
      args: [],
    );
  }

  /// `Next fight no one can use ability.`
  String get onyxAbilityDescription {
    return Intl.message(
      'Next fight no one can use ability.',
      name: 'onyxAbilityDescription',
      desc: 'Ability description of Onyx GameCard',
      args: [],
    );
  }

  /// `I double the power of the next ally to fight.`
  String get ragnarAbilityDescription {
    return Intl.message(
      'I double the power of the next ally to fight.',
      name: 'ragnarAbilityDescription',
      desc: 'Ability description of Ragnar GameCard',
      args: [],
    );
  }

  /// `I don't take damage from the first hit.`
  String get thorinAbilityDescription {
    return Intl.message(
      'I don\'t take damage from the first hit.',
      name: 'thorinAbilityDescription',
      desc: 'Ability description of Thorin GameCard',
      args: [],
    );
  }

  /// `Kill me and send my enemy into the hands of the opponent.`
  String get aeroAbilityDescription {
    return Intl.message(
      'Kill me and send my enemy into the hands of the opponent.',
      name: 'aeroAbilityDescription',
      desc: 'Ability description of Aero GameCard',
      args: [],
    );
  }

  /// `Summon an air element with damage taken.`
  String get novaAbilityDescription {
    return Intl.message(
      'Summon an air element with damage taken.',
      name: 'novaAbilityDescription',
      desc: 'Ability description of Nova GameCard',
      args: [],
    );
  }

  /// `I hit the enemy and go back one row`
  String get auroraAbilityDescription {
    return Intl.message(
      'I hit the enemy and go back one row',
      name: 'auroraAbilityDescription',
      desc: 'Ability description of Aurora GameCard',
      args: [],
    );
  }

  /// `My enemy and the next enemy switch places.`
  String get seraphinaAbilityDescription {
    return Intl.message(
      'My enemy and the next enemy switch places.',
      name: 'seraphinaAbilityDescription',
      desc: 'Ability description of Seraphina GameCard',
      args: [],
    );
  }

  /// `My enemy moves to my place.`
  String get celesteAbilityDescription {
    return Intl.message(
      'My enemy moves to my place.',
      name: 'celesteAbilityDescription',
      desc: 'Ability description of Celeste GameCard',
      args: [],
    );
  }

  /// `Swap the next ally and enemy`
  String get lunaAbilityDescription {
    return Intl.message(
      'Swap the next ally and enemy',
      name: 'lunaAbilityDescription',
      desc: 'Ability description of Luna GameCard',
      args: [],
    );
  }

  /// `My enemy cannot hit this turn.`
  String get emberAbilityDescription {
    return Intl.message(
      'My enemy cannot hit this turn.',
      name: 'emberAbilityDescription',
      desc: 'Ability description of Ember GameCard',
      args: [],
    );
  }

  /// `I'll go back to your hand after I hit enemy.`
  String get ariaAbilityDescription {
    return Intl.message(
      'I\'ll go back to your hand after I hit enemy.',
      name: 'ariaAbilityDescription',
      desc: 'Ability description of Aria GameCard',
      args: [],
    );
  }

  /// `Players give their cards to the opponent.`
  String get zephyrAbilityDescription {
    return Intl.message(
      'Players give their cards to the opponent.',
      name: 'zephyrAbilityDescription',
      desc: 'Ability description of Zephyr GameCard',
      args: [],
    );
  }

  /// `Ally air elements gain 3 power.`
  String get orionAbilityDescription {
    return Intl.message(
      'Ally air elements gain 3 power.',
      name: 'orionAbilityDescription',
      desc: 'Ability description of Orion GameCard',
      args: [],
    );
  }

  /// `To continue to the game,\nplease read and confirm the following:`
  String get termsOfUseInformation {
    return Intl.message(
      'To continue to the game,\nplease read and confirm the following:',
      name: 'termsOfUseInformation',
      desc: 'Information text for Terms of use accept screen.',
      args: [],
    );
  }

  /// `I have read and agree to the`
  String get iAgreeToThe {
    return Intl.message(
      'I have read and agree to the',
      name: 'iAgreeToThe',
      desc: 'Text says accepting upcoming sentences.',
      args: [],
    );
  }

  /// `Fusion Privacy Notice`
  String get fusionPrivacyNotice {
    return Intl.message(
      'Fusion Privacy Notice',
      name: 'fusionPrivacyNotice',
      desc: 'Fusion Privacy Notice Text.',
      args: [],
    );
  }

  /// `By continuing, I agree to the Terms of Service and acknowledge reading the Privacy Notices for Devangs and Fusion.`
  String get termsOfUseWarningText {
    return Intl.message(
      'By continuing, I agree to the Terms of Service and acknowledge reading the Privacy Notices for Devangs and Fusion.',
      name: 'termsOfUseWarningText',
      desc:
          'Text that saying devangs and fusions terms readed and accepted by user.',
      args: [],
    );
  }

  /// `Accept`
  String get acceptText {
    return Intl.message(
      'Accept',
      name: 'acceptText',
      desc: 'Simple Accept text in all languages.',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
