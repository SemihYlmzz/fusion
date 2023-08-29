import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// Canceling Text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// The current Language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get currentLanguage;

  /// Social Apple login text.
  ///
  /// In en, this message translates to:
  /// **'Sign In with Apple'**
  String get signInWithApple;

  /// Social Google login text.
  ///
  /// In en, this message translates to:
  /// **'Sign In with Google'**
  String get signInWithGoogle;

  /// Social Facebook login text.
  ///
  /// In en, this message translates to:
  /// **'Sign In with Facebook'**
  String get signInWithFacebook;

  /// Welcome text in all languages.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// Text for taking new random deck instead of current one.
  ///
  /// In en, this message translates to:
  /// **'REFRESH DECK'**
  String get refreshDeck;

  /// Text for starting game.
  ///
  /// In en, this message translates to:
  /// **'PLAY'**
  String get play;

  /// Done word.
  ///
  /// In en, this message translates to:
  /// **'DONE'**
  String get done;

  /// Simple Sign Out text.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// Simple Settings text.
  ///
  /// In en, this message translates to:
  /// **'SETTINGS'**
  String get settings;

  /// Simple General text.
  ///
  /// In en, this message translates to:
  /// **'General '**
  String get general;

  /// Simple Background Music text.
  ///
  /// In en, this message translates to:
  /// **'Background Music'**
  String get backgroundMusic;

  /// Simple Sound Effects text.
  ///
  /// In en, this message translates to:
  /// **'Sound Effects'**
  String get soundEffects;

  /// Simple Dialogue text.
  ///
  /// In en, this message translates to:
  /// **'Dialogues'**
  String get dialogues;

  /// Simple Haptics text.
  ///
  /// In en, this message translates to:
  /// **'Haptics'**
  String get haptics;

  /// Simple Language text.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Simple Default text.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultText;

  /// Simple Username text.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// Simple Account text.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// Text for bug report button
  ///
  /// In en, this message translates to:
  /// **'Report a Bug'**
  String get reportABug;

  /// Text for mail send button
  ///
  /// In en, this message translates to:
  /// **'Send Us a Mail'**
  String get sendUsAMail;

  /// Text for privacy button
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// Show Terms Button text.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// Show Credits Button text.
  ///
  /// In en, this message translates to:
  /// **'Credits'**
  String get credits;

  /// Delete Account Button text.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// Enter a Username text in all langs.
  ///
  /// In en, this message translates to:
  /// **'Enter a Username'**
  String get enterUsername;

  /// NOT UNIQUE word in all langs.
  ///
  /// In en, this message translates to:
  /// **'NOT UNIQUE'**
  String get notUnique;

  /// Cant rename yet text in all langs.
  ///
  /// In en, this message translates to:
  /// **'Can\'t rename yet'**
  String get cantRenameYet;

  /// HOURS text in all langs
  ///
  /// In en, this message translates to:
  /// **'HOURS'**
  String get hoursText;

  /// You should wait text in all langs
  ///
  /// In en, this message translates to:
  /// **'You should wait'**
  String get youShouldWait;

  /// Error for short username usage.
  ///
  /// In en, this message translates to:
  /// **'Username too short'**
  String get usernameTooShortError;

  /// Error for long username usage.
  ///
  /// In en, this message translates to:
  /// **'Username too long'**
  String get usernameTooLongError;

  /// Error for username contains special chars.
  ///
  /// In en, this message translates to:
  /// **'No special characters.'**
  String get usernameHasSpecialCharsError;

  /// Profanity error for username.
  ///
  /// In en, this message translates to:
  /// **'Has bad words.'**
  String get usernameHasBadWordsError;

  /// Simple warning telling username can be change oncea month.
  ///
  /// In en, this message translates to:
  /// **'You can change your name every 30 days.'**
  String get usernameChangeLimitWarning;

  /// Ability description of Emberus GameCard
  ///
  /// In en, this message translates to:
  /// **'2x the damage I take is reduced from the opponent\'s HP.'**
  String get emberusAbilityDescription;

  /// Ability description of Ignis GameCard
  ///
  /// In en, this message translates to:
  /// **'I attack my enemy twice.'**
  String get ignisAbilityDescription;

  /// Ability description of Blazeon GameCard
  ///
  /// In en, this message translates to:
  /// **'My powers are doubled.'**
  String get blazeonAbilityDescription;

  /// Ability description of Flamara GameCard
  ///
  /// In en, this message translates to:
  /// **'My enemy takes double damage in the next battle.'**
  String get flamaraAbilityDescription;

  /// Ability description of Pyyrhus GameCard
  ///
  /// In en, this message translates to:
  /// **'I absorb 3 points from my enemy.'**
  String get pyyrhusAbilityDescription;

  /// Ability description of Embrella GameCard
  ///
  /// In en, this message translates to:
  /// **'I deal double damage to the opponent\'s HP.'**
  String get embrellaAbilityDescription;

  /// Ability description of Solara GameCard
  ///
  /// In en, this message translates to:
  /// **'I attack directly to the opponent\'s HP.'**
  String get solaraAbilityDescription;

  /// Ability description of Flamorion GameCard
  ///
  /// In en, this message translates to:
  /// **'This turn HP\'s take triple damage.'**
  String get flamorionAbilityDescription;

  /// Ability description of Solarius GameCard
  ///
  /// In en, this message translates to:
  /// **'The damage i inflict can not be reduced.'**
  String get solariusAbilityDescription;

  /// Ability description of Dramber GameCard
  ///
  /// In en, this message translates to:
  /// **'Ally fire elements gain 1 power for each card I kill.'**
  String get dramberAbilityDescription;

  /// Ability description of Triton GameCard
  ///
  /// In en, this message translates to:
  /// **'Resurrect the last dead ally.'**
  String get tritonAbilityDescription;

  /// Ability description of Oceanus GameCard
  ///
  /// In en, this message translates to:
  /// **'For each round my HP decreases, heal 4 HP.'**
  String get oceanusAbilityDescription;

  /// Ability description of River GameCard
  ///
  /// In en, this message translates to:
  /// **'Opponent HP are healed instead of each of my HP\'s going down.'**
  String get riverAbilityDescription;

  /// Ability description of Nereus GameCard
  ///
  /// In en, this message translates to:
  /// **'My enemy\'s power becomes 1.'**
  String get nereusAbilityDescription;

  /// Ability description of Dylan GameCard
  ///
  /// In en, this message translates to:
  /// **'For each time you heal in this game, I gain 3 powers.'**
  String get dylanAbilityDescription;

  /// Ability description of Kai GameCard
  ///
  /// In en, this message translates to:
  /// **'Heal 3.'**
  String get kaiAbilityDescription;

  /// Ability description of Marina GameCard
  ///
  /// In en, this message translates to:
  /// **'Heal 3 for each water element you play.'**
  String get marinaAbilityDescription;

  /// Ability description of Neptune GameCard
  ///
  /// In en, this message translates to:
  /// **'In the next battle, players take the damage the opponent would take.'**
  String get neptuneAbilityDescription;

  /// Ability description of Caroline GameCard
  ///
  /// In en, this message translates to:
  /// **'I die, you heal as much as my power.'**
  String get carolineAbilityDescription;

  /// Ability description of Aquarius GameCard
  ///
  /// In en, this message translates to:
  /// **'If an ally dies while I\'m in you hand, kill me and revive that ally.'**
  String get aquariusAbilityDescription;

  /// Ability description of Terra GameCard
  ///
  /// In en, this message translates to:
  /// **'When Ally Earth elements die, I take no damage.'**
  String get terraAbilityDescription;

  /// Ability description of Gaia GameCard
  ///
  /// In en, this message translates to:
  /// **'If you attack while I\'m in your Deck, I\'ll hit your opponent\'s HP\'s.'**
  String get gaiaAbilityDescription;

  /// Ability description of Lyra GameCard
  ///
  /// In en, this message translates to:
  /// **'I kill my Enemy.'**
  String get lyraAbilityDescription;

  /// Ability description of Flint GameCard
  ///
  /// In en, this message translates to:
  /// **'Remove ability of my Enemy.'**
  String get flintAbilityDescription;

  /// Ability description of Boulder GameCard
  ///
  /// In en, this message translates to:
  /// **'My enemy\'s powers are halved.'**
  String get boulderAbilityDescription;

  /// Ability description of Arvid GameCard
  ///
  /// In en, this message translates to:
  /// **'I do not take damage from cards under 5 power.'**
  String get arvidAbilityDescription;

  /// Ability description of Gideon GameCard
  ///
  /// In en, this message translates to:
  /// **'Your opponent can not be healed.'**
  String get gideonAbilityDescription;

  /// Ability description of Onyx GameCard
  ///
  /// In en, this message translates to:
  /// **'Next fight no one can use ability.'**
  String get onyxAbilityDescription;

  /// Ability description of Ragnar GameCard
  ///
  /// In en, this message translates to:
  /// **'I double the power of the next ally to fight.'**
  String get ragnarAbilityDescription;

  /// Ability description of Thorin GameCard
  ///
  /// In en, this message translates to:
  /// **'I don\'t take damage from the first hit.'**
  String get thorinAbilityDescription;

  /// Ability description of Aero GameCard
  ///
  /// In en, this message translates to:
  /// **'Kill me and send my enemy into the hands of the opponent.'**
  String get aeroAbilityDescription;

  /// Ability description of Nova GameCard
  ///
  /// In en, this message translates to:
  /// **'Summon an air element with damage taken.'**
  String get novaAbilityDescription;

  /// Ability description of Aurora GameCard
  ///
  /// In en, this message translates to:
  /// **'I hit the enemy and go back one row'**
  String get auroraAbilityDescription;

  /// Ability description of Seraphina GameCard
  ///
  /// In en, this message translates to:
  /// **'My enemy and the next enemy switch places.'**
  String get seraphinaAbilityDescription;

  /// Ability description of Celeste GameCard
  ///
  /// In en, this message translates to:
  /// **'My enemy moves to my place.'**
  String get celesteAbilityDescription;

  /// Ability description of Luna GameCard
  ///
  /// In en, this message translates to:
  /// **'Swap the next ally and enemy'**
  String get lunaAbilityDescription;

  /// Ability description of Ember GameCard
  ///
  /// In en, this message translates to:
  /// **'My enemy cannot hit this turn.'**
  String get emberAbilityDescription;

  /// Ability description of Aria GameCard
  ///
  /// In en, this message translates to:
  /// **'I\'ll go back to your hand after I hit enemy.'**
  String get ariaAbilityDescription;

  /// Ability description of Zephyr GameCard
  ///
  /// In en, this message translates to:
  /// **'Players give their cards to the opponent.'**
  String get zephyrAbilityDescription;

  /// Ability description of Orion GameCard
  ///
  /// In en, this message translates to:
  /// **'Ally air elements gain 3 power.'**
  String get orionAbilityDescription;

  /// Information text for Terms of use accept screen.
  ///
  /// In en, this message translates to:
  /// **'To continue to the game,\nplease read and confirm the following:'**
  String get termsOfUseInformation;

  /// Text says accepting upcoming sentences.
  ///
  /// In en, this message translates to:
  /// **'I have read and agree to the'**
  String get iAgreeToThe;

  /// Fusion Privacy Notice Text.
  ///
  /// In en, this message translates to:
  /// **'Fusion Privacy Notice'**
  String get fusionPrivacyNotice;

  /// Text that saying devangs and fusions terms readed and accepted by user.
  ///
  /// In en, this message translates to:
  /// **'By continuing, I agree to the Terms of Service and acknowledge reading the Privacy Notices for Devangs and Fusion.'**
  String get termsOfUseWarningText;

  /// Simple Accept text in all languages.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get acceptText;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
