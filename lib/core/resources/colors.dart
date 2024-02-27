import 'package:flutter/material.dart';

enum AppThemeMode { dark, light }

abstract class AppThemeColors {
  Color get primaryColor;
  Color get accentColor;

  Color get inactive;

  Color get warning;

  Color get error;

  Color get natural;

  Color get success;

  Color get lightGray;

  Color get darkGray;

  Color get backgroundColor;

  Color get light;

  Color get dark;

  Color get secondaryColor;

  Color get transparent;

  Color get divider;
  Color get surface;

  List<Color> get gradientColor;

  Color get gradientStarts;
  Color get info;
  Color get firstGradientStarts;
  Color get secondGradientStarts;
  Color get thirdGradientStarts;

  Color get gradientEnds;
  Color get firstGradientEnds;
  Color get secondGradientEnds;
  Color get thirdGradientEnds;
  Color get white;
  Color get green;
  Color get blankLight;
}

class LightModeColors extends AppThemeColors {
  @override
  Color get primaryColor => Colors.green;

  @override
  Color get backgroundColor => const Color(0xffF8F8F8);

  @override
  Color get darkGray =>  Colors.white12;

  @override
  Color get light => const Color(0xFFFFFFFF);

  @override
  Color get dark => const Color(0xff0F0F0F);

  @override
  Color get secondaryColor => const Color(0xff344aad);

  @override
  Color get transparent => Colors.transparent;

  @override
  List<Color> get gradientColor =>
      [const Color(0xff2E4E76), const Color(0xff15949E)];

  @override
  Color get gradientStarts => const Color(0xffd60764);

  @override
  Color get gradientEnds => const Color(0xffab0344);

  @override
  Color get divider => const Color(0x5EC7C8C8);

  @override
  Color get inactive => const Color(0xffEFFBFF);

  @override
  Color get lightGray => const Color(0xffE2E2E2);

  @override
  Color get warning => const Color(0xffED8A0A);

  @override
  Color get error => const Color(0xffE33E5A);

  @override
  Color get natural => const Color(0xff4B92D4);

  @override
  Color get success => const Color(0xff29DE92);

  @override
  Color get firstGradientEnds => const Color(0xffab0344);

  @override
  Color get firstGradientStarts => const Color(0xffd60764);

  @override
  Color get secondGradientEnds => const Color(0xff0F7275);

  @override
  Color get secondGradientStarts => const Color(0xff159A9E);

  @override
  Color get thirdGradientEnds => const Color(0xff0F4675);

  @override
  Color get thirdGradientStarts => const Color(0xff155F9E);

  @override
  Color get surface => const Color(0xFFe0e2e5);

  @override
  Color get accentColor => const Color(0xffcdf8e7);

  @override
  Color get info => const Color(0xffF0C242);

  @override
  // TODO: implement white
  Color get white => Colors.white;

  @override
  // TODO: implement green
  Color get green => Colors.green;

  @override
  // TODO: implement blankLight
  Color get blankLight => Colors.white.withOpacity(0.1);
}

class DarkModeColors extends AppThemeColors {
  Color get blankLight => Colors.black38;
  @override
  Color get primaryColor => Colors.green;

  @override
  Color get accentColor => const Color(0xffcdf8e7);
  @override
  Color get info => const Color(0xffF0C242);
  @override
  Color get natural => const Color(0xff4B92D4);

  @override
  Color get success => const Color(0xff29DE92);

  @override
  Color get backgroundColor => const Color(0xFF242424);

  @override
  Color get darkGray => const Color(0xff6F6F6F);

  @override
  Color get light => Colors.white;

  @override
  Color get dark => const Color(0xff0F0F0F);

  @override
  Color get secondaryColor => const Color(0xff15949E);

  @override
  Color get error => const Color(0xffE33E5A);

  @override
  Color get transparent => Colors.transparent;

  @override
  List<Color> get gradientColor =>
      [const Color(0xff2E4E76), const Color(0xff15949E)];

  @override
  Color get gradientStarts => const Color(0xff2E4E76);

  @override
  Color get gradientEnds => const Color(0xff15949E);

  @override
  Color get divider => const Color(0x5EC7C8C8);

  @override
  Color get inactive => const Color(0xffEFFBFF);

  @override
  Color get lightGray => const Color(0xffE2E2E2);

  @override
  Color get warning => const Color(0xffED8A0A);

  @override
  Color get firstGradientEnds => const Color(0xff0D4E63);

  @override
  Color get firstGradientStarts => const Color(0xff157D9E);

  @override
  Color get secondGradientEnds => const Color(0xff0F7275);

  @override
  Color get secondGradientStarts => const Color(0xff159A9E);

  @override
  Color get thirdGradientEnds => const Color(0xff0F4675);

  @override
  Color get thirdGradientStarts => const Color(0xff155F9E);

  @override
  Color get surface => const Color(0xFFe0e2e5);

  @override
  // TODO: implement white
  Color get white => Colors.white;
  Color get green => Colors.green;
}

class ThemeFactory {
  static AppThemeColors colorModeFactory(AppThemeMode appThemeMode) {
    switch (appThemeMode) {
      case AppThemeMode.light:
        return LightModeColors();
      case AppThemeMode.dark:
        return DarkModeColors();
      default:
        return LightModeColors();
    }
  }

  static ThemeMode currentTheme(AppThemeMode appThemeMode) {
    return appThemeMode == AppThemeMode.dark ? ThemeMode.dark : ThemeMode.light;
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
