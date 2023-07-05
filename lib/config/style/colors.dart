import 'package:flutter/painting.dart';

class AppColor extends ColorSwatch<int> {
  const AppColor(super.primary, super.swatch);

  Color get shade200 => this[200]!;
  Color get shade300 => this[300]!;
  Color get shade400 => this[400]!;
  Color get shade500 => this[500]!;
  Color get shade600 => this[600]!;
  Color get shade700 => this[700]!;
  Color get shade800 => this[800]!;
  Color get shade900 => this[900]!;
  Color get shade075 => this[075]!;
  Color get shade050 => this[050]!;
  Color get shade025 => this[025]!;
}

class AppColors {
  AppColors._();
  static const Color transparent = Color(0x00000000);
  static const Color backgroundDark = Color(0xff0A0A0A);
  static const Color backgroundLight = Color(0xffBBBBBB);

  /// Black-> Gray
  static const AppColor black = AppColor(
    _blackPrimaryValue,
    <int, Color>{
      200: Color(0xFF777777),
      300: Color(0xFF666666),
      400: Color(0xFF555555),
      500: Color(0xFF444444),
      600: Color(0xFF333333),
      700: Color(0xFF222222),
      800: Color(0xFF111111),
      900: Color(_blackPrimaryValue),
      075: Color(0xC0000000),
      050: Color(0x80000000),
      025: Color(0x40000000),
    },
  );
  static const int _blackPrimaryValue = 0xFF000000;

  /// White -> Gray
  static const AppColor white = AppColor(
    _whitePrimaryValue,
    <int, Color>{
      200: Color(0xFF888888),
      300: Color(0xFF999999),
      400: Color(0xFFAAAAAA),
      500: Color(0xFFBBBBBB),
      600: Color(0xFFCCCCCC),
      700: Color(0xFFDDDDDD),
      800: Color(0xFFEEEEEE),
      900: Color(_whitePrimaryValue),
      075: Color(0xC0FFFFFF),
      050: Color(0x80FFFFFF),
      025: Color(0x40FFFFFF),
    },
  );
  static const int _whitePrimaryValue = 0xFFFFFFFF;

  /// LightOrange -> DarkOrange
  static const AppColor orange = AppColor(
    _orangePrimaryValue,
    <int, Color>{
      200: Color(0xFFFFE8B6),
      300: Color(0xFFFFD891),
      400: Color(0xFFFFCC70),
      500: Color(_orangePrimaryValue),
      600: Color(0xFFFFB942),
      700: Color(0xFFCC8825),
      800: Color(0xFFB66906),
      900: Color(0xFF8E5F1E),
      075: Color(0xC0FFBC58),
      050: Color(0x80FFBC58),
      025: Color(0x40FFBC58),
    },
  );
  static const int _orangePrimaryValue = 0xFFFFBC58;

  /// LightPurple -> DarkPurple
  static const AppColor purple = AppColor(
    _purplePrimaryValue,
    <int, Color>{
      200: Color(0xFFDDAEFF),
      300: Color(0xFFC577FF),
      400: Color(0xFF9E1AFF),
      500: Color(_purplePrimaryValue),
      600: Color(0xFF6905B1),
      700: Color(0xFF580098),
      800: Color(0xFF460974),
      900: Color(0xFF410071),
      075: Color(0xC07F04DA),
      050: Color(0x807F04DA),
      025: Color(0x407F04DA),
    },
  );
  static const int _purplePrimaryValue = 0xFF7F04DA;

  /// LightPink -> DarkPink
  static const AppColor pink = AppColor(
    _pinkPrimaryValue,
    <int, Color>{
      200: Color(0xFFFFB9BE),
      300: Color(0xFFFF939B),
      400: Color(0xFFFF6A75),
      500: Color(_pinkPrimaryValue),
      600: Color(0xFFFF2656),
      700: Color(0xFFBD1739),
      800: Color(0xFF970326),
      900: Color(0xFF7B0922),
      075: Color(0xC0FF3A6A),
      050: Color(0x80FF3A6A),
      025: Color(0x40FF3A6A),
    },
  );
  static const int _pinkPrimaryValue = 0xFFFF3A6A;

  /// LightNegativeRed -> DarkNegativeRed
  static const AppColor negativeRed = AppColor(
    _negativeRedPrimaryValue,
    <int, Color>{
      200: Color(0xFFF2ACA7),
      300: Color(0xFFF46157),
      400: Color(0xFFF46157),
      500: Color(_negativeRedPrimaryValue),
      600: Color(0xFFCD392E),
      700: Color(0xFFC5352B),
      800: Color(0xFF9F1A11),
      900: Color(0xFF730800),
      075: Color(0xC0F44336),
      050: Color(0x80F44336),
      025: Color(0x40F44336),
    },
  );
  static const int _negativeRedPrimaryValue = 0xFFF44336;

  /// LightWarningOrange -> DarkWarningOrange
  static const AppColor warningOrange = AppColor(
    _warningOrangePrimaryValue,
    <int, Color>{
      200: Color(0xFFF0CD99),
      300: Color(0xFFE9B973),
      400: Color(0xFFF2AC45),
      500: Color(_warningOrangePrimaryValue),
      600: Color(0xFFDC8A11),
      700: Color(0xFFAC7406),
      800: Color(0xFF895302),
      900: Color(0xFF563300),
      075: Color(0xC0FF9800),
      050: Color(0x80FF9800),
      025: Color(0x40FF9800),
    },
  );
  static const int _warningOrangePrimaryValue = 0xFFFF9800;

  /// LightGreen -> DarkGreen
  static const AppColor positiveGreen = AppColor(
    _positiveGreenPrimaryValue,
    <int, Color>{
      200: Color(0xFF9BC69A),
      300: Color(0xFF88CF87),
      400: Color(0xFF63CC61),
      500: Color(_positiveGreenPrimaryValue),
      600: Color(0xFF2FAD2D),
      700: Color(0xFF258B23),
      800: Color(0xFF1A7018),
      900: Color(0xFF155814),
      075: Color(0xC040C63D),
      050: Color(0x8040C63D),
      025: Color(0x4040C63D),
    },
  );
  static const int _positiveGreenPrimaryValue = 0xFF40C63D;

  static const List<AppColor> primaries = <AppColor>[
    orange,
    purple,
    pink,
    negativeRed,
    warningOrange,
    positiveGreen,
  ];
}
