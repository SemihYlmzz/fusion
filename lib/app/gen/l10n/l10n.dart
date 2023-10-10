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
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get currentLanguage {
    return Intl.message(
      'English',
      name: 'currentLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Apple`
  String get signInWithApple {
    return Intl.message(
      'Sign In with Apple',
      name: 'signInWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign In with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Sign In with Facebook',
      name: 'signInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `REFRESH DECK`
  String get refreshDeck {
    return Intl.message(
      'REFRESH DECK',
      name: 'refreshDeck',
      desc: '',
      args: [],
    );
  }

  /// `PLAY`
  String get play {
    return Intl.message(
      'PLAY',
      name: 'play',
      desc: '',
      args: [],
    );
  }

  /// `DONE`
  String get done {
    return Intl.message(
      'DONE',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `SETTINGS`
  String get settings {
    return Intl.message(
      'SETTINGS',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `General `
  String get general {
    return Intl.message(
      'General ',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Background Music`
  String get backgroundMusic {
    return Intl.message(
      'Background Music',
      name: 'backgroundMusic',
      desc: '',
      args: [],
    );
  }

  /// `Sound Effects`
  String get soundEffects {
    return Intl.message(
      'Sound Effects',
      name: 'soundEffects',
      desc: '',
      args: [],
    );
  }

  /// `Dialogues`
  String get dialogues {
    return Intl.message(
      'Dialogues',
      name: 'dialogues',
      desc: '',
      args: [],
    );
  }

  /// `Haptics`
  String get haptics {
    return Intl.message(
      'Haptics',
      name: 'haptics',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Default`
  String get defaultText {
    return Intl.message(
      'Default',
      name: 'defaultText',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Report a Bug`
  String get reportABug {
    return Intl.message(
      'Report a Bug',
      name: 'reportABug',
      desc: '',
      args: [],
    );
  }

  /// `Send Us a Mail`
  String get sendUsAMail {
    return Intl.message(
      'Send Us a Mail',
      name: 'sendUsAMail',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message(
      'Privacy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Credits`
  String get credits {
    return Intl.message(
      'Credits',
      name: 'credits',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter a Username`
  String get enterUsername {
    return Intl.message(
      'Enter a Username',
      name: 'enterUsername',
      desc: '',
      args: [],
    );
  }

  /// `NOT UNIQUE`
  String get notUnique {
    return Intl.message(
      'NOT UNIQUE',
      name: 'notUnique',
      desc: '',
      args: [],
    );
  }

  /// `Can't rename yet`
  String get cantRenameYet {
    return Intl.message(
      'Can\'t rename yet',
      name: 'cantRenameYet',
      desc: '',
      args: [],
    );
  }

  /// `HOURS`
  String get hoursText {
    return Intl.message(
      'HOURS',
      name: 'hoursText',
      desc: '',
      args: [],
    );
  }

  /// `You should wait`
  String get youShouldWait {
    return Intl.message(
      'You should wait',
      name: 'youShouldWait',
      desc: '',
      args: [],
    );
  }

  /// `Username too short`
  String get usernameTooShortError {
    return Intl.message(
      'Username too short',
      name: 'usernameTooShortError',
      desc: '',
      args: [],
    );
  }

  /// `Username too long`
  String get usernameTooLongError {
    return Intl.message(
      'Username too long',
      name: 'usernameTooLongError',
      desc: '',
      args: [],
    );
  }

  /// `No special characters.`
  String get usernameHasSpecialCharsError {
    return Intl.message(
      'No special characters.',
      name: 'usernameHasSpecialCharsError',
      desc: '',
      args: [],
    );
  }

  /// `Has bad words.`
  String get usernameHasBadWordsError {
    return Intl.message(
      'Has bad words.',
      name: 'usernameHasBadWordsError',
      desc: '',
      args: [],
    );
  }

  /// `You can change your name every 30 days.`
  String get usernameChangeLimitWarning {
    return Intl.message(
      'You can change your name every 30 days.',
      name: 'usernameChangeLimitWarning',
      desc: '',
      args: [],
    );
  }

  /// `2x the damage I take is reduced from the opponent's HP.`
  String get emberusAbilityDescription {
    return Intl.message(
      '2x the damage I take is reduced from the opponent\'s HP.',
      name: 'emberusAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `I attack my enemy twice.`
  String get ignisAbilityDescription {
    return Intl.message(
      'I attack my enemy twice.',
      name: 'ignisAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `My powers are doubled.`
  String get blazeonAbilityDescription {
    return Intl.message(
      'My powers are doubled.',
      name: 'blazeonAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `My enemy takes double damage in the next battle.`
  String get flamaraAbilityDescription {
    return Intl.message(
      'My enemy takes double damage in the next battle.',
      name: 'flamaraAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `I absorb 3 points from my enemy.`
  String get pyyrhusAbilityDescription {
    return Intl.message(
      'I absorb 3 points from my enemy.',
      name: 'pyyrhusAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `I deal double damage to the opponent's HP.`
  String get embrellaAbilityDescription {
    return Intl.message(
      'I deal double damage to the opponent\'s HP.',
      name: 'embrellaAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `I attack directly to the opponent's HP.`
  String get solaraAbilityDescription {
    return Intl.message(
      'I attack directly to the opponent\'s HP.',
      name: 'solaraAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `This turn HP's take triple damage.`
  String get flamorionAbilityDescription {
    return Intl.message(
      'This turn HP\'s take triple damage.',
      name: 'flamorionAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `The damage i inflict can not be reduced.`
  String get solariusAbilityDescription {
    return Intl.message(
      'The damage i inflict can not be reduced.',
      name: 'solariusAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ally fire elements gain 1 power for each card I kill.`
  String get dramberAbilityDescription {
    return Intl.message(
      'Ally fire elements gain 1 power for each card I kill.',
      name: 'dramberAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Resurrect the last dead ally.`
  String get tritonAbilityDescription {
    return Intl.message(
      'Resurrect the last dead ally.',
      name: 'tritonAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `For each round my HP decreases, heal 4 HP.`
  String get oceanusAbilityDescription {
    return Intl.message(
      'For each round my HP decreases, heal 4 HP.',
      name: 'oceanusAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Opponent HP are healed instead of each of my HP's going down.`
  String get riverAbilityDescription {
    return Intl.message(
      'Opponent HP are healed instead of each of my HP\'s going down.',
      name: 'riverAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `My enemy's power becomes 1.`
  String get nereusAbilityDescription {
    return Intl.message(
      'My enemy\'s power becomes 1.',
      name: 'nereusAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `For each time you heal in this game, I gain 3 powers.`
  String get dylanAbilityDescription {
    return Intl.message(
      'For each time you heal in this game, I gain 3 powers.',
      name: 'dylanAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Heal 3.`
  String get kaiAbilityDescription {
    return Intl.message(
      'Heal 3.',
      name: 'kaiAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Heal 3 for each water element you play.`
  String get marinaAbilityDescription {
    return Intl.message(
      'Heal 3 for each water element you play.',
      name: 'marinaAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `In the next battle, players take the damage the opponent would take.`
  String get neptuneAbilityDescription {
    return Intl.message(
      'In the next battle, players take the damage the opponent would take.',
      name: 'neptuneAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `I die, you heal as much as my power.`
  String get carolineAbilityDescription {
    return Intl.message(
      'I die, you heal as much as my power.',
      name: 'carolineAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `If an ally dies while I'm in you hand, kill me and revive that ally.`
  String get aquariusAbilityDescription {
    return Intl.message(
      'If an ally dies while I\'m in you hand, kill me and revive that ally.',
      name: 'aquariusAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `When Ally Earth elements die, I take no damage.`
  String get terraAbilityDescription {
    return Intl.message(
      'When Ally Earth elements die, I take no damage.',
      name: 'terraAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `If you attack while I'm in your Deck, I'll hit your opponent's HP's.`
  String get gaiaAbilityDescription {
    return Intl.message(
      'If you attack while I\'m in your Deck, I\'ll hit your opponent\'s HP\'s.',
      name: 'gaiaAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `I kill my Enemy.`
  String get lyraAbilityDescription {
    return Intl.message(
      'I kill my Enemy.',
      name: 'lyraAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Remove ability of my Enemy.`
  String get flintAbilityDescription {
    return Intl.message(
      'Remove ability of my Enemy.',
      name: 'flintAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `My enemy's powers are halved.`
  String get boulderAbilityDescription {
    return Intl.message(
      'My enemy\'s powers are halved.',
      name: 'boulderAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `I do not take damage from cards under 5 power.`
  String get arvidAbilityDescription {
    return Intl.message(
      'I do not take damage from cards under 5 power.',
      name: 'arvidAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Your opponent can not be healed.`
  String get gideonAbilityDescription {
    return Intl.message(
      'Your opponent can not be healed.',
      name: 'gideonAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Next fight no one can use ability.`
  String get onyxAbilityDescription {
    return Intl.message(
      'Next fight no one can use ability.',
      name: 'onyxAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `I double the power of the next ally to fight.`
  String get ragnarAbilityDescription {
    return Intl.message(
      'I double the power of the next ally to fight.',
      name: 'ragnarAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `I don't take damage from the first hit.`
  String get thorinAbilityDescription {
    return Intl.message(
      'I don\'t take damage from the first hit.',
      name: 'thorinAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Kill me and send my enemy into the hands of the opponent.`
  String get aeroAbilityDescription {
    return Intl.message(
      'Kill me and send my enemy into the hands of the opponent.',
      name: 'aeroAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Summon an air element with damage taken.`
  String get novaAbilityDescription {
    return Intl.message(
      'Summon an air element with damage taken.',
      name: 'novaAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `I hit the enemy and go back one row`
  String get auroraAbilityDescription {
    return Intl.message(
      'I hit the enemy and go back one row',
      name: 'auroraAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `My enemy and the next enemy switch places.`
  String get seraphinaAbilityDescription {
    return Intl.message(
      'My enemy and the next enemy switch places.',
      name: 'seraphinaAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `My enemy moves to my place.`
  String get celesteAbilityDescription {
    return Intl.message(
      'My enemy moves to my place.',
      name: 'celesteAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Swap the next ally and enemy`
  String get lunaAbilityDescription {
    return Intl.message(
      'Swap the next ally and enemy',
      name: 'lunaAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `My enemy cannot hit this turn.`
  String get emberAbilityDescription {
    return Intl.message(
      'My enemy cannot hit this turn.',
      name: 'emberAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `I'll go back to your hand after I hit enemy.`
  String get ariaAbilityDescription {
    return Intl.message(
      'I\'ll go back to your hand after I hit enemy.',
      name: 'ariaAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Players give their cards to the opponent.`
  String get zephyrAbilityDescription {
    return Intl.message(
      'Players give their cards to the opponent.',
      name: 'zephyrAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ally air elements gain 3 power.`
  String get orionAbilityDescription {
    return Intl.message(
      'Ally air elements gain 3 power.',
      name: 'orionAbilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `To continue to the game,\nplease read and confirm the following:`
  String get termsOfUseInformation {
    return Intl.message(
      'To continue to the game,\nplease read and confirm the following:',
      name: 'termsOfUseInformation',
      desc: '',
      args: [],
    );
  }

  /// `I have read and agree to the`
  String get iAgreeToThe {
    return Intl.message(
      'I have read and agree to the',
      name: 'iAgreeToThe',
      desc: '',
      args: [],
    );
  }

  /// `Fusion Privacy Notice`
  String get fusionPrivacyNotice {
    return Intl.message(
      'Fusion Privacy Notice',
      name: 'fusionPrivacyNotice',
      desc: '',
      args: [],
    );
  }

  /// `By continuing, I agree to the Terms of Service and acknowledge reading the Privacy Notices for Devangs and Fusion.`
  String get termsOfUseWarningText {
    return Intl.message(
      'By continuing, I agree to the Terms of Service and acknowledge reading the Privacy Notices for Devangs and Fusion.',
      name: 'termsOfUseWarningText',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get acceptText {
    return Intl.message(
      'Accept',
      name: 'acceptText',
      desc: '',
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
